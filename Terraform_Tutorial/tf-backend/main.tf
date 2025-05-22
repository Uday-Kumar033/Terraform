terraform {
  backend "s3" {
    bucket = "mybuccketoopssidsd"
    key = "terraform-tfstate"
    region = "eu-north-1"
  }
}

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
  region = "eu-north-1"
}

resource "aws_instance" "myserver" {
  ami = "ami-0c2e61fdcb5495691"
  instance_type = "t3.micro"

  tags = {
    Name = "Sampleserver"
  }
}

