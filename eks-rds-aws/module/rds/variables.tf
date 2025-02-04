variable "rds_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "rds_username" {
  description = "Database username"
  type        = string
}

variable "rds_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "VPC ID where RDS instance will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed for RDS security group"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)"
  type        = string
}

