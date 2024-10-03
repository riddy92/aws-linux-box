# Create a VPC
resource "aws_vpc" "homelab_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Cybersecurity Homelab VPC"
  }

}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.homelab_vpc.id}"
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "Cybersecurity Homelab Public Subnet"
  }

}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.homelab_vpc.id}"

  tags = {
    Name = "Cybersecurity Homelab IGW"
  }

}

# Create Route Table
resource "aws_route_table" "route-table" {
  vpc_id = "${aws_vpc.homelab_vpc.id}"
  
}

# Create Route to IGW in Route Table
resource "aws_route" "internet" {
  route_table_id         = "${aws_route_table.route-table.id}"
  destination_cidr_block = "0.0.0.0/0" # Replace with your VPC CIDR block
  gateway_id       = "${aws_internet_gateway.igw.id}"
}

# Associate Route Table to Public Sunet
resource "aws_route_table_association" "subnet_association" {
  subnet_id = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.route-table.id}"
}



# Create Security Group for Linux Security Tools Instance.
resource "aws_security_group" "linux-security-tools" {
  description = "Ingress and egress rules for Security Tools Box"
  vpc_id = "${aws_vpc.homelab_vpc.id}"

    tags = {
    Name = "Cybersecurity Homelab Linux Security Tools Security Group"
  }

}

resource "aws_vpc_security_group_ingress_rule" "linux-security-tools-tcp" {
  security_group_id = aws_security_group.linux-security-tools.id

    from_port   = 80
    to_port     = 80
    ip_protocol    = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "linux-security-tools-icmp" {
  security_group_id = aws_security_group.linux-security-tools.id

    from_port   = -1  # ICMP type and code (-1 means all)
    to_port     = -1  # ICMP type and code (-1 means all)
    ip_protocol    = "icmp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "linux-security-tools-tcp59" {
  security_group_id = aws_security_group.linux-security-tools.id

    from_port   = 5900
    to_port     = 5920
    ip_protocol    = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "linux-security-tools-udp" {
  security_group_id = aws_security_group.linux-security-tools.id

    from_port   = 3389
    to_port     = 3389
    ip_protocol    = "udp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "linux-security-tools-tcp22" {
  security_group_id = aws_security_group.linux-security-tools.id

    from_port   = 22
    to_port     = 22
    ip_protocol    = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "linux-security-tools-tcp99" {
  security_group_id = aws_security_group.linux-security-tools.id

    from_port   = 9997
    to_port     = 9997
    ip_protocol    = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "linux-security-tools-tcp44" {
  security_group_id = aws_security_group.linux-security-tools.id

    from_port   = 443
    to_port     = 443
    ip_protocol    = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "linux-security-tools-tcp" {
  security_group_id = aws_security_group.linux-security-tools.id

    ip_protocol    = "-1"  # Allow all outbound traffic
    cidr_ipv4 = "0.0.0.0/0"
}


    
    
    


  
    
  
