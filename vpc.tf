resource "aws_vpc" "thr_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "thr-vpc-${terraform.workspace}-${var.region}"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.thr_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "thr-public-1-${terraform.workspace}-${var.region}"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.thr_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "thr-public-2-${terraform.workspace}-${var.region}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id   = aws_vpc.thr_vpc.id

  tags = {
    Name = "thr-igw-${terraform.workspace}"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id   = aws_vpc.thr_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "thr-public-rt-${terraform.workspace}-${var.region}"
  }
}

resource "aws_route_table_association" "public_subnet_1_assoc" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_assoc" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_route_table.id
}