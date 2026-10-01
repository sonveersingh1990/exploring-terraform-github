resource "aws_instance" "this" {
    for_each = var.instances
    ami = var.ami_id    
    instance_type = each.value.instance_type
    subnet_id = each.value.subnet_id
    vpc_security_group_ids = var.security_group_ids
    
    root_block_device {
        volume_size = each.value.volume_size
        volume_type = gp3
        encrypted = true

    }
    tags = merge(
        {
            Name ="${var.environment}-${each.key}"
            Environment = var.environment
            ManagedBy = "Terraform"

        },
        each.value.additional_tags

    )
}

data "ami_id" "ubuntu" {
   most_recent = true
   filter {
    name = "name"
    value = ["ubuntu/images/*"]
   }  
   owners = ["990000001001010"]
}