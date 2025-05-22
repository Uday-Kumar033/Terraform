terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}
provider "aws" {
  region = "eu-north-1"
}


resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.example.bucket
  source = "./mydata.txt"
  key = "mydata.txt"

}