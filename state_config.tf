terraform {
  backend "s3" {
    bucket = "bia-terraform-bruno-oliveira"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
