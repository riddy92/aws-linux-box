output "pub_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "sec_group_sec_tools" {
  value = aws_security_group.linux-security-tools.id
}