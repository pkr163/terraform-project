provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
  cidr   = var.network_cidr
}

module "app_server" {
  source = "./modules/app_server"
  vpc_id = module.network.vpc_id
}

module "db_server" {
  source = "./modules/db_server"
  vpc_id = module.network.vpc_id
}

resource "aws_rds_instance" "db" {
  instance_class = var.db_instance_class
  engine         = var.db_engine
  vpc_security_group_ids = [module.network.db_security_group_id]
  subnet_id            = module.network.private_subnet_id
}

resource "aws_elb" "app" {
  security_groups = [module.network.lb_security_group_id]
  subnets         = module.network.public_subnet_ids
}

resource "aws_security_group_rule" "app_to_db" {
  security_group_id = module.app_server.security_group_id
  type        = "ingress"
  from_port   = var.db_port
  to_port     = var.db_port
  protocol    = "tcp"
  cidr_blocks = [module.db_server.instance_ip_cidr]
}
