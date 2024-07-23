


resource "aws_vpc" "network" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "my-vpc" 
    }
}

resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.network.id
    availability_zone         = "us-west-2a"
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "internet" {
    vpc_id = aws_vpc.network.id
  
  tags = {
    Name = "aws_internet_gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.network.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
    route_table_id      = aws_route_table.public_rt.id
    subnet_id           = aws_subnet.public.id
  
}