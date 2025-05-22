terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.90.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "myserver" {
  ami = "ami-0c2e61fdcb5495691"
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    # volume_size = var.root_volume_size
    # volume_type = var.root_volume_type
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
  }

  tags = {
    Name = "Sampleserver"
  }
}