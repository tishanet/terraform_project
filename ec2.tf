module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = var.bastion_name

  ami = var.ami_bastion_id 
  instance_type = var.instance_type
  key_name = data.aws_key_pair.bastion.key_name
  monitoring = var.monitoring
  root_block_device = [ {volume_size=10 } ]
  vpc_security_group_ids = [module.bastion_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags = var.tags_zdh
}

module "ec2_db" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = var.db_name

  ami = var.ami_db_id 
  instance_type = var.instance_type
  key_name = data.aws_key_pair.bastion.key_name
  monitoring = var.monitoring
  root_block_device = [ {volume_size=30 } ]
  vpc_security_group_ids = [module.db_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[1]
  tags = var.tags_zdh
}

module "ec2_web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = var.web_name

  ami = var.ami_web_id 
  instance_type = var.instance_type
  key_name = data.aws_key_pair.bastion.key_name
  monitoring = var.monitoring
  root_block_device = [ {volume_size=20 } ]
  vpc_security_group_ids = [module.web_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[2]
  tags = var.tags_zdh
}
module "ec2_exporter" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = var.exporter_name

  ami = var.ami_exporter_id 
  instance_type = var.instance_type
  key_name = data.aws_key_pair.bastion.key_name
  monitoring = var.monitoring
  root_block_device = [ {volume_size=30 } ]
  vpc_security_group_ids = [module.exporter_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[3]
  tags = var.tags_zdh
}
