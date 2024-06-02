# data "aws_ami" "ubuntu_jammy_amd64" {
#   most_recent = true
#   name_regex  = "^ubuntu/images/hvm-ssd-gp3/ubuntu-jammy-22.04-amd64-server-.*$"
#   owners      = ["self"]
# }

# data "aws_ami" "ubuntu_jammy_arm64" {
#   most_recent = true
#   name_regex  = "^ubuntu/images/hvm-ssd-gp3/ubuntu-jammy-22.04-arm64-server-.*$"
#   owners      = ["self"]
# }

data "aws_ami" "ubuntu_jammy_amd64" {
  most_recent = true
  name_regex  = "^ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-.*$"
  owners      = ["amazon"]
}

data "aws_ami" "ubuntu_jammy_arm64" {
  most_recent = true
  name_regex  = "^ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-.*$"
  owners      = ["amazon"]
}

resource "terraform_data" "runner_ami_amd64" {
  triggers_replace = [
    data.aws_ami.ubuntu_jammy_amd64.id,
    aws_iam_instance_profile.runner.name
  ]

  provisioner "local-exec" {
    working_dir = "../../../packer/runner"

    environment = {
      PKR_VAR_source_ami           = data.aws_ami.ubuntu_jammy_amd64.id
      PKR_VAR_instance_type        = "c7i.xlarge"
      PKR_VAR_aws_region           = data.aws_region.current.name
      PKR_VAR_iam_instance_profile = aws_iam_instance_profile.runner.name
      PKR_VAR_ami_name             = "runner-amd64"
      PKR_VAR_runner_name          = "runner"
    }

    command = "packer build -machine-readable ami.pkr.hcl"
  }
}

resource "terraform_data" "runner_ami_arm64" {
  triggers_replace = [
    data.aws_ami.ubuntu_jammy_arm64.id,
    aws_iam_instance_profile.runner.name
  ]

  provisioner "local-exec" {
    working_dir = "../../../packer/runner"

    environment = {
      PKR_VAR_source_ami           = data.aws_ami.ubuntu_jammy_arm64.id
      PKR_VAR_instance_type        = "c7g.xlarge"
      PKR_VAR_aws_region           = data.aws_region.current.name
      PKR_VAR_iam_instance_profile = aws_iam_instance_profile.runner.name
      PKR_VAR_ami_name             = "runner-arm64"
      PKR_VAR_runner_name          = "runner"
    }

    command = "packer build -machine-readable ami.pkr.hcl"
  }
}

data "aws_ami" "runner_amd64" {
  most_recent = true
  owners      = ["self"]
  name_regex  = "^runner-amd64 .*$"
  depends_on  = [terraform_data.runner_ami_amd64]
}

data "aws_ami" "runner_arm64" {
  most_recent = true
  owners      = ["self"]
  name_regex  = "^runner-arm64 .*$"
  depends_on  = [terraform_data.runner_ami_arm64]
}
