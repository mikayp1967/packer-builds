packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "al2" {
  ami_name      = "packer-linux-aws-al2"
  instance_type = "t2.micro"
  region        = "eu-west-2"
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.0*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"
}

build {
  name = "packer-AL2"
  sources = [
    "source.amazon-ebs.al2"
  ]

  provisioner "shell" {
      inline = ["mkdir scripts files"]
  }

  provisioner "file" {
    source = "./scripts"
    destination = "scripts"
  }

  provisioner "file" {
    source = "./files"
    destination = "files"
  }

  provisioner "shell" {
    environment_vars = [
      "AWS_DEFAULT_REGION=eu-west-2",
    ]
    script = "run_scripts.sh"
  }
}
