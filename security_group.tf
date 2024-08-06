resource "aws_security_group" "bia_dev" {
  name        = "bia-dev"
  description = "Security group bia-dev"
  vpc_id      = local.vpc_id

  tags = {
    Name = "bia-terraform"
  }
}

# resource "aws_vpc_security_group_ingress_rule" "entrada_3001" {
#   security_group_id = aws_security_group.bia_dev.id
#   description       = "Liberado para a porta 3001"
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 3001
#   ip_protocol       = "tcp"
#   to_port           = 3001
# }

resource "aws_vpc_security_group_ingress_rule" "entrada_22" {
  security_group_id = aws_security_group.bia_dev.id
  description       = "Liberado para a porta 22"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "saida" {
  security_group_id = aws_security_group.bia_dev.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

