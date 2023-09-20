//VPC
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_vpc 
  instance_tenancy = "default"

  tags = {
    Name = "vpc"
  }
}

//DMZ Subnet
resource "aws_subnet" "dmz_subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.dmzsubnet
  availability_zone = var.az_dmzsubnet

  tags = {
    Name = "dmz"
  }
}

//Data
resource "aws_subnet" "data_subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.datasubnet
  availability_zone = var.az_datasubnet

  tags = {
    Name = "data"
  }
}

//compute
resource "aws_subnet" "compute_subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.computesubnet
  availability_zone = var.az_computesubnet

  tags = {
    Name = "compute"
  }
}
//IGW
resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Tf-IGW"
  }
}
//routetable
resource "aws_route_table" "awsrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }
  tags = {
    Name = "RT"
  }
}
// route table association
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.dmz_subnet.id 
  route_table_id = aws_route_table.awsrt.id
}

// security group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "SSH access from a specific local IP"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["122.164.82.88/32"]  // Replace with your local IP
  }
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "seg"
  }
}

