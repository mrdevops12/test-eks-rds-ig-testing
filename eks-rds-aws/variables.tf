variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["10.0.0.0/19", "10.0.32.0/19"]
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
  default     = ["10.0.64.0/19"]
}

variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "eks-cluster"
}

variable "environment" {
  description = "Deployment Environment"
  type        = string
  default     = "dev"
}

variable "rds_username" {
  description = "Database Username"
  type        = string
  default     = "admin"
}

variable "rds_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}

variable "availability_zone" {
  description = "Availability Zone for RDS"
  type        = string
  default     = "us-east-1a"
}
variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "s3_buckets" {
  description = "List of S3 bucket names"
  type        = list(string)
}




