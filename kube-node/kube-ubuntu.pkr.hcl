# Ubuntu 20.04 with most the config to act as a kube node/CP

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu-kube" {
  ami_name      = "packer-ubuntu-kube-211125-2016"
  instance_type = "t2.micro"
  region        = "eu-west-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "ubuntu-kube"
  sources = [
    "source.amazon-ebs.ubuntu-kube"
  ]

  # Seems apt won't work unless cloud-init finishes
  # https://www.packer.io/docs/debugging#issues-installing-ubuntu-packages
  provisioner "shell" {
    inline = [
      "cloud-init status --wait"
    ]
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "scripts"
  }

  provisioner "file" {
    source      = "./files"
    destination = "files"
  }

  provisioner "shell" {
    environment_vars = [
      "AWS_DEFAULT_REGION=eu-west-2",
    ]
    script = "../run_scripts.sh"
  }
}
