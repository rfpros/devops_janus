packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}


variable "source_ami" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "aws_region" {
  type    = string
}

variable "iam_instance_profile" {
  type    = string
}

variable "ami_name" {
  type    = string
}

variable "runner_name" {
  type    = string
}

source "amazon-ebs" "runner" {
  region =  "${var.aws_region}"
  instance_type =  "${var.instance_type}"

  ami_name =  "${var.ami_name} {{timestamp}}"

  source_ami =  "${var.source_ami}"
  ssh_username =  "ubuntu"

  iam_instance_profile =  "${var.iam_instance_profile}"

  user_data_file = "files/cloud-config.txt"

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 64
    volume_type = "gp3"
    delete_on_termination = true
  }

  run_tags = {
    "Name" = "Packer: ${var.ami_name} {{timestamp}}"
    "auth.gh-oidc" = "true"
  }

  run_volume_tags = {
    "Name" = "Packer: ${var.ami_name} {{timestamp}}"
    "auth.gh-oidc" = "true"
  }

  snapshot_tags = {
    "Name" = "${var.ami_name} {{timestamp}}"
    "auth.gh-oidc" = "true"
  }

  tags = {
    "Name" = "${var.ami_name} {{timestamp}}"
    "auth.gh-oidc" = "true"
  }
}

build {
  sources = [
    "amazon-ebs.runner"
  ]

  provisioner "shell" {
    inline = [
      "sudo mkdir -p /setup",
      "sudo chown ubuntu:ubuntu /setup"
    ]
  }

  provisioner "file" {
    source      = "scripts"
    destination = "/setup"
  }

  # ensure that the ansible apt module doesn't fail due to missing metadata
  # see ansible#79206 for more information
  provisioner "shell" {
    inline = [
      "echo 'Waiting for cloud-init...'; cloud-init status --wait",
      "sudo rm -rf /var/lib/apt/lists/*",
      "sudo touch -d '1970-01-01 0:00:00' /var/lib/apt/lists"
    ]
  }

  provisioner "ansible" {
    playbook_file = "../../ansible/runner/packer.yml"
    groups = [
      "tag_class_runner",
      "aws_ec2"
    ]
    extra_arguments = [
      "--extra-vars", "actions_runner_name=${var.runner_name} actions_runner_prevent_service_start=true containers_prevent_service_start=true"
    ]
  }

  provisioner "shell" {
    inline = [
      "sudo -i /setup/scripts/test.sh"
    ]
  }

  provisioner "shell" {
    inline = [
      "sudo -i /setup/scripts/clean.sh"
    ]
  }
}
