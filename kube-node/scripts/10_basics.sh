#!/usr/bin/bash
#
# Basic stuff to add



sudo apt-get update
sudo apt install -y net-tools
sudo apt install -y jq

# Install/config AWS
sudo apt install -y awscli
mkdir ~/.aws
cat  >  ~/.aws/config <<EOF
[default]
region = eu-west-2
EOF