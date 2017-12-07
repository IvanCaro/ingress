sudo su - root
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update &&
apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni

#kubeadm join --token 82f0c8.94a17ca36c98a898 10.201.2.18:6443 --discovery-token-ca-cert-hash sha256:c9c71bd579a223f8bcb11d5e2027162b1c7f0d9d47876897d4df9f186fae5166