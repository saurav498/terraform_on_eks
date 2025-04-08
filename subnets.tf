resource "aws_subnet" "private-zone1" {
    vpc_id = aws_vpc.eks-vpc.id
    cidr_block = var.private_zone_cidrs[0]
    availability_zone = var.availability_zones[0]

    tags = {
        "Name"                                                 = "${local.env}-private-${var.availability_zones[0]}"
        "kubernetes.io/role/internal-elb"                      = "1"
        "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
    }
  
}

resource "aws_subnet" "private-zone2" {
    vpc_id = aws_vpc.eks-vpc.id
    cidr_block = var.private_zone_cidrs[1]
    availability_zone = var.availability_zones[1]

    tags = {
        "Name"                                                 = "${local.env}-private-${var.availability_zones[1]}"
        "kubernetes.io/role/internal-elb"                      = "1"
        "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
    }
  
}

resource "aws_subnet" "public-zone1" {
    vpc_id = aws_vpc.eks-vpc.id
    cidr_block = var.public_zone_cidrs[0]
    availability_zone = var.availability_zones[0]
    map_public_ip_on_launch = true

    tags = {
        "Name"                                                 = "${local.env}-private-${var.availability_zones[0]}"
        "kubernetes.io/role/elb"                               = "1"
        "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
    }
  
}

resource "aws_subnet" "public-zone2" {
    vpc_id = aws_vpc.eks-vpc.id
    cidr_block = var.public_zone_cidrs[1]
    availability_zone = var.availability_zones[1]
    map_public_ip_on_launch = true

    tags = {
        "Name"                                                 = "${local.env}-private-${var.availability_zones[1]}"
        "kubernetes.io/role/elb"                               = "1"
        "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
    }
  
}