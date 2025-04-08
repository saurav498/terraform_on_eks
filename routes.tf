resource "aws_route_table" "private" {
    vpc_id = aws_vpc.eks-vpc.id
  
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.eks-nat.id
    }
    tags = {
        Name = "${local.env}-private"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.eks-vpc.id
  
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.eks-nat.id
    }
    tags = {
        Name = "${local.env}-public"
    }
}

resource "aws_route_table_association" "private-zone1" {
    subnet_id = aws_subnet.private-zone1.id
    route_table_id = aws_route_table.private.id  
}

resource "aws_route_table_association" "private-zone2" {
    subnet_id = aws_subnet.private-zone2.id
    route_table_id = aws_route_table.private.id  
}

resource "aws_route_table_association" "public-zone1" {
    subnet_id = aws_subnet.public-zone1.id
    route_table_id = aws_route_table.public.id  
}

resource "aws_route_table_association" "public-zone2" {
    subnet_id = aws_subnet.public-zone2.id
    route_table_id = aws_route_table.public.id  
}

