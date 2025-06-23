terraform {
    required_provider {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
}

provider "aws" {
   region = "ap-south-1"
}