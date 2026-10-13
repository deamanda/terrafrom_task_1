resource "aws_vpc" "cmtr-otuokx4e-01-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "cmtr-otuokx4e-01-subnet-public-a" {
  availability_zone = var.availability_zone1
  cidr_block        = var.subnet1_cidr
  vpc_id            = aws_vpc.cmtr-otuokx4e-01-vpc.id
}

resource "aws_subnet" "cmtr-otuokx4e-01-subnet-public-b" {
  availability_zone = var.availability_zone2
  cidr_block        = var.subnet2_cidr
  vpc_id            = aws_vpc.cmtr-otuokx4e-01-vpc.id
}

resource "aws_subnet" "cmtr-otuokx4e-01-subnet-public-c" {
  availability_zone = var.availability_zone3
  cidr_block        = var.subnet3_cidr
  vpc_id            = aws_vpc.cmtr-otuokx4e-01-vpc.id
}

resource "aws_internet_gateway" "cmtr-otuokx4e-01-igw" {
  vpc_id = aws_vpc.cmtr-otuokx4e-01-vpc.id
}

resource "aws_route_table" "cmtr-otuokx4e-01-rt" {
  vpc_id = aws_vpc.cmtr-otuokx4e-01-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cmtr-otuokx4e-01-igw.id
  }
}

resource "aws_route_table_association" "route_table_association-a" {
  subnet_id      = aws_subnet.cmtr-otuokx4e-01-subnet-public-a.id
  route_table_id = aws_route_table.cmtr-otuokx4e-01-rt.id
}

resource "aws_route_table_association" "route_table_association-b" {
  subnet_id      = aws_subnet.cmtr-otuokx4e-01-subnet-public-b.id
  route_table_id = aws_route_table.cmtr-otuokx4e-01-rt.id
}

resource "aws_route_table_association" "route_table_association-c" {
  subnet_id      = aws_subnet.cmtr-otuokx4e-01-subnet-public-c.id
  route_table_id = aws_route_table.cmtr-otuokx4e-01-rt.id
}