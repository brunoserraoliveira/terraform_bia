output "instance_id" {
  description = "ID da EC2"
  value = aws_instance.bia_local.id
}

output "instance_type" {
  description = "Tipo da EC2"
  value = aws_instance.bia_local.instance_type
}

output "instance_security_groups" {
  description = "SG da EC2"
  value       = aws_security_group.bia-dev.name
}

output "public_ip" {
  description = "IP público da minha EC2"
  value       = aws_instance.bia_local.public_ip
}
