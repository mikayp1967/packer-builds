# packer-builds

**Simple packer build example**

* Build a new AMI from latest AL2 in eu-west-2 region
* Run shell scripts for whatever reason
* Copy files to AMI 
* install specific packages

## Instructions

* Install packer (see below)
* If you are running on an EC2 then give the EC2 admin role to the server, otherwise set your AWS creds
* Edit the files in the scripts dir to install or perform any required actions on your AMI
* Edit package-list for any packages you want installed
* Put files that need copying over into the files subdirs (not yet implemented)
* Run packer - see readme for version to build

## Versions

### kube-node

Builds up an Ubuntu ami with kube packages ready to join a cluster

### AL2

Amazon Linux 2 workhorse box. Basically just al2 and a few packages but super easy to add to





## Installing packer

    https://www.packer.io/downloads
    https://learn.hashicorp.com/tutorials/packer/get-started-install-cli
