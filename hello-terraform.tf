terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}


provider "aws" {
  profile = var.profile
  region  = "eu-central-1"
}

variable "profile" {
  description = "AWS profile"
}

variable "special_name" {
  description = "unique prefix for dynamo table"
}
resource "aws_dynamodb_table" "hello-table" {
  name         = "${var.special_name}-hello-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

}
