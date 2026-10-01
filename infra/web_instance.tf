terraform {
  required_providers {
    aws = {
        source = "hashicorp"
        version = 1.5.2
    }
  }
}

provider "aws" {
    region = var.region
    }

data "aws_vpc" "selected" {
    id = var.vpc_id
}
data "aws_subnet_ids" "private" {
    vpc_id = data.aws_vpc.selected.id
    filter {
        name = "tag:Name"
        values = ["*private*"]
    }
}   

module "web_instance" {
    source = "./ec2_instance"
    environment = var.environment
    instances = var.instances
    ami_id = data.ami_id.ubuntu.id
    security_group_ids = [module.rds_sg.security_group_id]
}
