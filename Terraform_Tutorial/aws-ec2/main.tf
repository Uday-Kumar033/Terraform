terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # region = var.region
  region = "eu-north-1"
}

resource "aws_instance" "myserver" {
  ami = "ami-0c2e61fdcb5495691"
  instance_type = "t3.micro"
  count = 5

  tags = {
    Name = "Sampleserver-${count.index + 1}"
  }
}

