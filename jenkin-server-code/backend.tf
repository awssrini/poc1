terraform {
  backend "s3" {
    bucket         = "poc-srini-terraform-state-s3-bucket"
    region         = "ap-southeast-1"
    key            = "poc1/jenkin-server-code/terraform.tfstate"
    dynamodb_table = "poc-srini-terraform-locks"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}