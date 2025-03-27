resource "aws_eip" "nat" {
    domain = "vpc"

    tags = {
        Name = "${local.env}-nat"
    }
  
}

resource "aws_nat_gateway" "eks-nat" {
    subnet_id = aws_subnet.public-zone1.id
    allocation_id = aws_eip.nat.id

    tags = {
        Name = "${local.env}-eks-nat"
    }

    depends_on = [ aws_internet_gateway.eks-igw ]
}