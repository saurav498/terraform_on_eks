output "vpc_id" {
  value = aws_vpc.eks-vpc.id
}

output "public_subnets" {
  value = aws_subnet.public-zone1
}

output "private_subnets" {
  value = aws_subnet.private-zone1
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.nodes.arn
}