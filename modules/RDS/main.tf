resource "aws_db_subnet_group" "this" {
    name = "${var.environment}"-"${var.identifier}-subnet-group"
    subnet_ids = var.subnet_ids
    description = "Database subnet group for ${var.identifier} in ${var.environment}"
    tags = {
        Name = "${var.environment}-${var.identifier}-subnet-group"
        Environment = var.environment
}

}
# rds seccurity group
resource "aws_security_group" "this" {
    name = "${var.environment}-${var.identifier}-rds-sg"
    description = "Security group for RDS instance ${var.identifier} in ${var.environment}"
    vpc_id = var.vpc_id
    tags = {
        Name = "${var.environment}-${var.identifier}-rds-sg"
        Environment = var.environment
    }
    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        security_groups = var.allowed_security_group_ids
}
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        secuirity_groups = var.allowed_security_group_ids

    }

# RDS instance
resource "aws_db_instance" "this" {
    identifier = "${var.environment}-${var.identifier}"
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    allocated_storage = var.allocated_storage
    max_allocated_storage = var.max_allocated_storage
    db_name = var.db_name
    username = var.username
    password = var.password
    vpc_security_group_ids = [aws_security_group.this.id]
    db_subnet_group_name = aws_db_subnet_group.this.name
    skip_final_snapshot = true
    publicly_accessible = false
    tags = {
        Name = "${var.environment}-${var.identifier}-rds"
        Environment = var.environment
}