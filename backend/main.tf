provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_s3_bucket" "finance" {
  bucket = "yogeshterraform-state-locking-2023"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name         = "terraform-state-lock-dynamo"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}