# configured aws provider with proper credentials
provider "aws" {
  region    = "eu-west-1"
  profile   = "elsha"
}



resource "aws_s3_bucket" "example" {
  bucket = "elsha-jenkins"

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {    
    status = "Enabled"
  }
}
