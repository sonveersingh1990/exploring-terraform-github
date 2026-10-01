terraform {
  required_providers {
    aws = {
        source = "hashicorp"
        version= "~>6.0"
    }

  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region ="eu-west-1"
  alias = "eu-west"
}


