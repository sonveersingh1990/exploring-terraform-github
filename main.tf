terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
}

provider "aws" {
   region = "ap-south-1"
}

resource "aws_instance" "web_app" {
   ami = "demo_instance_id"
   instance_type = "t2.micro"

   tags = {
    name = web_app
   }
}