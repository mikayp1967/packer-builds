# packer-builds/kube-node

** Attempt to build kube node on Ubuntu
   STILL NEEDS SOME WORK
    - Got to find a better way to put keys on the box, copy from S3 is not great 
    - Some build steps still need checking/fixing

* Build a new AMI from Ubuntu-20.04 in eu-west-2 region
* Scripts to install K8s components, dependencies (docker etc), create kubeuser etc
* install specific packages

## Instructions

* Install packer (see below)
* If you are running on an EC2 then give the EC2 admin role to the server, otherwise set your AWS creds
* Edit the files in the scripts dir to install or perform any required actions on your AMI
* Edit package-list for any packages you want installed
* Run packer
    packer build kube-ubuntu.pkr.hcl
           or.... I make a little wrapper to timestamp the AMI
    . ./makepack.sh


## Installing packer

    https://www.packer.io/downloads
    https://learn.hashicorp.com/tutorials/packer/get-started-install-cli
    
