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

resource "aws_instance" "bia_local" {
  ami = "ami-02f3f602d23f1659d"
  instance_type = "t3.micro"

  tags = {
    ambiente = "dev"
    Name = "bia-local"
  }
}