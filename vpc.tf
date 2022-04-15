module "vpc_zdh" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name_vpc
  cidr = var.cidr_vpc

  azs             = var.availability_zone_vpc
  public_subnets  = var.public_subnet_vpc
  
  enable_dns_hostnames = var.dns_hostnames_vpc

  tags = var.tags_zdh
}
