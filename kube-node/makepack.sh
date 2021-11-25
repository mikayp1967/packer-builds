#!/bin/bash

# Packer wrapper to rename destination ami

DATESTAMP=$(date +'%y%m%d-%H%M')
sed -i "s/packer-ubuntu-kube.*/packer-ubuntu-kube-${DATESTAMP}\"/" kube-ubuntu.pkr.hcl
packer build kube-ubuntu.pkr.hcl
