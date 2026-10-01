variable "environment" {
    description = "environment name (e.g dev, uat, pro)"
    type = string
  
}
variable "instance" {
    description = "share the instance type"
    type = map(object({
      instance_type = string
      subnet_id = string
      volume_size = number
      additional_tags = map(string)
    }))
    
    }
  
variable "ami_id"{
    type = string
    description = "ami id for the instance"

}
variable "security_group_ids" {
    type = list(string)
    description = "List of security group IDs"
}
