#!/usr/bin/bash
#
# Install terraform
#

printf "Installing terraform...this might fail cos of repo issues in which case try tfswitch"
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform


# Install autocomlete
terraform -install-autocomplete

# Install tfswitch
sudo curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash