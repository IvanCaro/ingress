sudo su - root
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update &&
apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni &&
kubeadm init

export KUBECONFIG=/etc/kubernetes/admin.conf &&
kubectl apply --filename https://git.io/weave-kube-1.6

kubectl cluster-info &&
kubectl get nodes --watch

# kubectl get pods --all-namespaces

# kubectl apply --filename https://git.io/weave-kube-1.6

# kubectl get pods --all-namespaces

