#EC2
variable "bastion_name" {}
variable "web_name" {}
variable "db_name" {}
variable "exporter_name" {}
variable "instance_type" {}
variable "monitoring" {
    type = bool
}
variable "ami_bastion_id" {}
variable "ami_web_id" {}
variable "ami_db_id" {}
variable "ami_exporter_id" {}
#VPC
variable "name_vpc" {}
variable "cidr_vpc" {}
variable "availability_zone_vpc" {
    type = list(string)  
}
variable "public_subnet_vpc" {
    type = list(string)  
}
variable "dns_hostnames_vpc" {
    type = bool
    default = true
}
#SG
variable "in_from_all" {}

#Common 
variable "tags_zdh" {
    type = map
    default = {
        company = "ZDH"
        Platform = "terraform"
        author = "tisha"
    }
  
}