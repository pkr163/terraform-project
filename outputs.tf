output "app_dns_name" {
  value = aws_elb.app.dns_name
}

output "db_endpoint" {
  value = aws_rds_instance.db.endpoint
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets" {
  value = module.network.public_subnet_ids
}

output "private_subnets" {
  value = module.network.private_subnet_ids
}
