resource "aws_vpc" "aws_eks_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "aws-eks-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.aws_eks_vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_security_group" "eks_cluster_sg" {
  vpc_id = aws_vpc.aws_eks_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks_cluster_sg"
  }
}

output "vpc_id" {
  value = aws_vpc.aws_eks_vpc.id
}

output "security_group_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

