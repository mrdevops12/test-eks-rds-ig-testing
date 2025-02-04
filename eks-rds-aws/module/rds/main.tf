# Create RDS Security Group
resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg-${var.environment}"
  }
}

# Create RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group-${var.environment}"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

# Create RDS Parameter Group
resource "aws_db_parameter_group" "rds_params" {
  name   = "rds-mysql-params-${var.environment}"
  family = "mysql8.0"

  parameter {
    name  = "max_connections"
    value = "100"
  }

  parameter {
    name  = "log_bin_trust_function_creators"
    value = "1"
  }
}

# Create RDS MySQL Instance
resource "aws_db_instance" "rds_mysql" {
  identifier              = var.rds_identifier
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  multi_az                = true
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name  # ✅ FIXED
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]  # ✅ FIXED
  parameter_group_name    = aws_db_parameter_group.rds_params.name  # ✅ FIXED
  username               = var.rds_username
  password               = var.rds_password
  skip_final_snapshot    = false
  backup_retention_period = 7

  tags = {
    Name        = "RDS-MySQL-${var.environment}"
    Environment = var.environment
  }
}

