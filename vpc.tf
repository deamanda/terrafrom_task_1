resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "cmtr-otuokx4e-01-subnet-public-a" {
  availability_zone = var.availability_zone1
  cidr_block        = var.subnet1_cidr
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "cmtr-otuokx4e-01-subnet-public-b" {
  availability_zone = var.availability_zone2
  cidr_block        = var.subnet2_cidr
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "cmtr-otuokx4e-01-subnet-public-c" {
  availability_zone = var.availability_zone3
  cidr_block        = var.subnet3_cidr
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_internet_gateway" "cmtr-otuokx4e-01-igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = var.subnet1_cidr
    gateway_id = aws_internet_gateway.cmtr-otuokx4e-01-igw.id
  }
  route {
    cidr_block = var.subnet2_cidr
    gateway_id = aws_internet_gateway.cmtr-otuokx4e-01-igw.id
  }
  route {
    cidr_block = var.subnet3_cidr
    gateway_id = aws_internet_gateway.cmtr-otuokx4e-01-igw.id
  }
}