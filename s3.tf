terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "create_bucket" {
  bucket = "s3bucketkms"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object_upload" {
  bucket = "s3bucketkms"
  key    = "sample.txt"
  source = "sample.txt"
  etag = filemd5("sample.txt")
}
