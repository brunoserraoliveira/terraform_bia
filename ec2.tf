resource "aws_instance" "bia_local" {
  ami           = "ami-03972092c42e8c0ca"
  instance_type = "t3.micro"
  user_data = file("./docs/userdata.sh")

  root_block_device {
    volume_size = 12
  }

  vpc_security_group_ids = [aws_security_group.bia_dev.id]
  tags = {
    ambiente = "dev"
    Name     = var.instance_name
  }

  iam_instance_profile = aws_iam_instance_profile.role_acesso_ssm.name

}