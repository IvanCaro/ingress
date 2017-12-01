# Crear K8 en azure con VMs de ubuntu

## Pre requisitos

* Kubernetes 1.2 and later (TLS support for Ingress has been added in 1.2)

## Pasos

## 1. Crear VMs en azure con red de minvu

1. Crear VM master ubuntu server 16 TLS en azure en la red de minvu

2. Crear VM minion ubuntu server 16 TLS en azure en la red de minvu

## 2. Crear k8 en master

1. Entrar por ssh a la maquina master


2. Ingresar como root
```
sudo -s
```

3. Agregar a apt-get las direccion de google para k8
```
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
```

4. Update al apt-get
```
apt-get update
```

5. Instalar  kubeadm kubectl kubelet kubernetes-cni
```
apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni
```

6. Iniciar kubeadm
```
kubeadm init
```

7. Guardar comando join kubeadm
Guardar el comando join del kubeadmin para link con los nodes


8. Copiar config de kubectl al usuario
```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/
export KUBECONFIG=$HOME/admin.conf
```

9. aplicar wave para la coneccion con los nodes
```
kubectl apply --filename https://git.io/weave-kube-1.6
```

## 3. Crear k8 en minion

1. Ingresar por ssh a minion

2. Ingresar como root
```
sudo -s
```

3. Agregar a apt-get las direccion de google para k8
```
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
```

4. Update al apt-get
```
apt-get update
```

5. Instalar  kubeadm kubectl kubelet kubernetes-cni
```
apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni
```

6. Iniciar kubeadm con join
ejecutar el comando join guardado desde el master


## Instalar k8

* Kubernetes 1.2 and later (TLS support for Ingress has been added in 1.2)
* For NGINX Plus:
  * Build and make available in your cluster the [Ingress controller](../../nginx-controller) image.
  * Update the container image field in the ```nginx-plus-ingress-rc.yaml``` file accordingly.

## Running the Example

## 1. Deploy the Ingress Controller

1. Create a Secret with an SSL certificate and key for the default server of NGINX/NGINX Plus. The default server returns the Not Found page with the 404 status code for all requests for domains for which there are no Ingress rules defined. It is recommended that you use your own certificate and key. 
    ```
    $ kubectl create -f default-server-secret.yaml
    ```

2. Create an Ingress controller either for NGINX or NGINX Plus:
    ```
    $ kubectl create -f nginx-ingress-rc.yaml
    ```
    or
    ```
    $ kubectl create -f nginx-plus-ingress-rc.yaml
    ```

3. The controller container exposes ports 80, 443 (and 8080 for NGINX Plus )
on the host it is running on. Make sure to add a firewall rule to allow incoming traffic
though these ports.

## 2. Deploy the Cafe Application

1. Create the coffee and the tea services and replication controllers:
    ```
    $ kubectl create -f tea-rc.yaml
    $ kubectl create -f tea-svc.yaml
    $ kubectl create -f coffee-rc.yaml
    $ kubectl create -f coffee-svc.yaml
    ```

## 3. Configure Load Balancing

1. Create a secret with an SSL certificate and a key:
    ```
    $ kubectl create -f cafe-secret.yaml
    ```

2. Create an Ingress Resource:
    ```
    $ kubectl create -f cafe-ingress.yaml
    ```











