resource "aws_key_pair" "security-tools" {
  key_name   = "Security-Homelab-terraform"
  public_key = var.security_tools_key
}


resource "aws_instance" "security-tools" {
  ami = var.security_tools_ami
  instance_type = "t3.large"
  subnet_id = var.public_subnet_id

  key_name = aws_key_pair.security-tools.id

  
  vpc_security_group_ids = [var.security_group_id_sec_tools_linux]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30 # Specify the desired size in GB
  }

  tags = { 
    Name = "Cybersecurity Homelab [Security Tools]"
  }

}