#!/bin/bash
#
# Install kubeuser & K8s components
#

# Configure user so CP can ssh across
sudo groupadd -g 1200 kubegroup
sudo useradd -g 1200 -u 1200 -d /home/kubeuser -m -s /bin/bash kubeuser
sudo usermod -a -G docker kubeuser
mkdir ~kubeuser/.ssh ~kubeuser/.aws ~kubeuser/.kube

# Install/config AWS
cat  >  ~/.aws/config <<EOF
[default]
region = eu-west-2
EOF

sudo mkdir ~kubeuser/.ssh
sudo aws s3  cp s3://key-store-bucket-390490349038000/kube-project-keys/id_rsa.pub ~kubeuser/.ssh/authorized_keys
sudo aws s3  cp s3://key-store-bucket-390490349038000/kube-project-keys/id_rsa ~kubeuser/.ssh/id_rsa
sudo chown -R kubeuser:kubegroup ~kubeuser/.ssh ~kubeuser/.aws
sudo chmod 700 ~kubeuser/.ssh
sudo chmod 600 ~kubeuser/.ssh/*
sudo chmod 644 ~kubeuser/.ssh/id_rsa.pub

# Install Kubernetes

sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get update


# Add kube packages
sudo apt-get install -y kubeadm kubelet kubectl kubernetes-cni
kubeadm version && kubelet --version && kubectl version

