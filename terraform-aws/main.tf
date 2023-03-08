terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.57.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "C:/Users/TH/.aws/credentials"
}

resource "aws_s3_bucket" "devops_challenge_bucket" {
  bucket = "devops-challenge-2023030704"
  
  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.devops_challenge_bucket.id
  policy = templatefile("s3-policy.json", { bucket = aws_s3_bucket.devops_challenge_bucket.id })
}

locals {
  mime_types = jsondecode(file("../mime.json"))
}

resource "aws_s3_bucket_object" "devops_challenge_object" {
  for_each = fileset("../calculator/build/", "*")

  bucket = aws_s3_bucket.devops_challenge_bucket.id
  key    = "${each.value}"
  source = "../calculator/build/${each.value}"
  content_type =  lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}

resource "aws_s3_bucket_object" "devops_challenge_object_css" {
  for_each = fileset("../calculator/build/static/css", "*")

  bucket = aws_s3_bucket.devops_challenge_bucket.id
  key    = "static/css/${each.value}"
  source = "../calculator/build/static/css/${each.value}"
  content_type =  lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}

resource "aws_s3_bucket_object" "devops_challenge_object_js" {
  for_each = fileset("../calculator/build/static/js", "*")

  bucket = aws_s3_bucket.devops_challenge_bucket.id
  key    = "static/js/${each.value}"
  source = "../calculator/build/static/js/${each.value}"
  content_type =  lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}