module "vpc" {
    source = "./modules/vpc"
    cidr_block = var.cidr_block
    common_tags = local.common_tags
}

module "web" {
    name="web"
    source = "./modules/ec2-setup"
    instance_type= var.instance_type
    subnet_id = module.vpc.public_subnet_id
    vpc_id = module.vpc.vpc_id
    key_name = aws_key_pair.tech_task.key_name
    common_tags = local.common_tags

    ingress_rules = {
     ssh = {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_ipv4 = "${var.my_ip}/32"
    }

    http8080 = {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
  }
  }
}

module "db" {
  source        = "./modules/ec2-setup"
  name          = "db"
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
  key_name      = aws_key_pair.tech_task.key_name
  common_tags = local.common_tags

  ingress_rules = {
    ssh = {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_ipv4 = "${var.my_ip}/32"
    }

    mysql = {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      source_sg_id = module.web.security_group_id
    }
  }
}