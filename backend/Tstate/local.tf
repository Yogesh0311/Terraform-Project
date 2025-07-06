provider "aws" {
  region = "us-west-2"
}

resource "local_file" "pet" {
  filename = "/tmp/pets.txt"
  content  = "We love pets!"
}


terraform {
  backend "s3" {
    bucket         = "yogeshterraform-state-locking-2023"
    key            = ".terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
