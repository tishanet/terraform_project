# Common
bastion_name = "bastion"
web_name = "web"
db_name = "db"
exporter_name = "exporter"

ami_bastion_id = "ami-04505e74c0741db8d" #Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
ami_web_id = "ami-03ededff12e34e59e" #Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
db_ami_id = "ami-07d02ee1eeb0c996c" #Debian 10 (HVM), SSD Volume Type
exporter_ami_id = "ami-0e472ba40eb589f49" #Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
instance_type = "t3.micro"
monitoring = false

# VPC
name_vpc = "vpc_zdh"
cidr_vpc = "10.10.0.0/16"
availability_zone_vpc = [ "us-east-1a", "us-east-1b" ]
public_subnet_vpc = [ "10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24", "10.10.40.0/24" ]

# Security group 
in_from_all = [ "0.0.0.0/0" ]
