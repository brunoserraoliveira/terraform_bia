terraform {

  required_version = ">= 1.9.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "bia-dev" {
  name        = "bia-dev-tf"
  description = "Regra para instancia de trabalho bia-dev com tf"
  vpc_id      = "vpc-0e36bcd0c6e74938e"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "entrada" {
  security_group_id = aws_security_group.bia-dev.id
  description       = "Liberado 3001 para o mundo"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3001
  ip_protocol       = "tcp"
  to_port           = 3001
}

resource "aws_vpc_security_group_egress_rule" "saida" {
  security_group_id = aws_security_group.bia-dev.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


resource "aws_instance" "bia_local" {
  ami           = "ami-03972092c42e8c0ca"
  instance_type = "t3.micro"

  root_block_device {
    volume_size = 10
  }

  vpc_security_group_ids = [aws_security_group.bia-dev.id]
  tags = {
    ambiente = "dev"
    Name     = var.instance_name
  }

}