# Crear K8 en azure con VMs de ubuntu

## Pasos

### Crear VM master ubuntu server 16 TLS en azure en la red de minvu

### Crear VM minion ubuntu server 16 TLS en azure en la red de minvu

### Entrar por ssh a la maquina master

#### Crear k8 en master

##### Ingresar como root
sudo -s

##### Agregar a apt-get las direccion de google para k8
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

##### Update al apt-get
apt-get update

##### Instalar  kubeadm kubectl kubelet kubernetes-cni
apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni

##### Iniciar kubeadm
kubeadm init

##### Guardar comando join kubeadm
Guardar el comando join del kubeadmin para link con los nodes

##### copiar config de kubectl al usuario
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/
export KUBECONFIG=$HOME/admin.conf

##### aplicar wave para la coneccion con los nodes
kubectl apply --filename https://git.io/weave-kube-1.6


#### Crear k8 en minion

##### Ingresar como root
sudo -s

##### Agregar a apt-get las direccion de google para k8
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

##### Update al apt-get
apt-get update

##### Instalar  kubeadm kubectl kubelet kubernetes-cni
apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni

##### Iniciar kubeadm con join
ejecutar el comando join guardado desde el master









