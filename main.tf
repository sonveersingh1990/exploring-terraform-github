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

resource "aws_instance" "web" {
  ami           = "demo_ami"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}