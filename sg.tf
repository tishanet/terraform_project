module "bastion_sg" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = module.vpc_zdh.vpc_id
  name ="bastion_sg" 
  
  ingress_cidr_blocks = var.in_from_all
  ingress_rules = ["ssh-tcp"]
  egress_rules = ["all-all"]
}

module "web_sg" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = module.vpc_zdh.vpc_id
  name ="web_sg"
  
  ingress_cidr_blocks = var.in_from_all
  ingress_rules = ["http-80-tcp", "https-443-tcp"]

   ingress_with_source_security_group_id = [
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.bastion_sg.security_group_id
    }
  ]

  egress_rules = ["all-all"]
}

module "db_sg" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = module.vpc_zdh.vpc_id
  name ="db_sg"

   ingress_with_source_security_group_id = [
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.bastion_sg.security_group_id
    },
    {
      rule                     = "mysql-tcp"
      source_security_group_id = module.web_sg.security_group_id 
    }
  ]

  egress_rules = ["all-all"]
}

module "exporter_sg" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = module.vpc_zdh.vpc_id
  name ="exporter_sg"

   ingress_with_source_security_group_id = [
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.bastion_sg.security_group_id
    },
    {
      from_port                = 9100
      to_port                  = 9100
      protocol                 = 6
      description              = "Exporter"
      source_security_group_id = module.db_sg.security_group_id
    },
  ]

  egress_rules = ["all-all"]
}
