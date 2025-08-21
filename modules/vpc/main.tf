resource "aws_vpc" "public_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "public_igw" {
  vpc_id = aws_vpc.public_vpc.id
  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.public_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_igw.id
  }

  tags = {
    Name = "${var.name_prefix}-rt"
  }
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.public_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.name_prefix}-public-subnets-${element(var.azs, count.index)}"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.azs)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}