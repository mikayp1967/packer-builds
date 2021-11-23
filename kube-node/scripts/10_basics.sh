#!/usr/bin/bash
#
# Basic stuff to add



sudo apt-get update
sudo hostnamectl set-hostname master-node
sudo apt install -y net-tools jq

# Install/config AWS
sudo apt install -y awscli
cat  >  ~/.aws/config <<EOF
[default]
region = eu-west-2
EOF