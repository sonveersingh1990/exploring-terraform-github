output "instance_ids" {
    description = "Map of instance name to their IDs"
    value = {for k, v in aws_instance.this}: => v.id 
  
}
output "instance_ip" {
  description = "map of instance names to their private IPs"
  value = {for k, v in aws_instance.this : k => v.private_ip-}
}