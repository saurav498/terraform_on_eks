variable "region" {
    type = string
    default = "eu-north-1"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "private_zone_cidrs" {
    type = list(string)
    default = [ "10.0.0.0/19", "10.0.32.0/19" ] 
}

variable "public_zone_cidrs" {
    type = list(string)
    default = [ "10.0.64.0/19", "10.0.96.0/19" ] 
}

variable "availability_zones" {
    type = list(string)
    default = [ "eu-north-1a", "eu-north-1b" ]
}

variable "eks_name" {
    type = string
    default = "my_eks_cluster"
}

variable "eks_version" {
    type = string
    default = "1.29"
}

