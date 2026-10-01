variable "environment" {
  type = string
  description = "environment name"
}
variable "identifier" {
  type = string
  description = "identifier name for rds"
}
variable "engine" {
    type = string
    default = "postgres"
  
}
variable "engine_version" {
    type = string
    description = "engine version"
  
}
variable "instance_class" {
    type = string
    default = "db.t3.medium"
    description = "instance class for rds database."
  
}
variable "allocated_storage" {
  type = number
  default = 20
  description = "initial allocated storage in GB"
}