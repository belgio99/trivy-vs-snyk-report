provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_insecure" {
  bucket = "my-insecure-bucket"
  acl    = "public-read"

  tags = {
    Name        = "Insecure Bucket"
    Environment = "Test"
  }
}
