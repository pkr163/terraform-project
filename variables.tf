variable "region" {
  description = "The AWS region to deploy the resources in."
  type        = string
  default     = "us-west-2"
}

variable "network_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = "db.t2.micro"
}

variable "db_engine" {
  description = "The database engine for the RDS instance."
  type        = string
  default     = "postgres"
}

variable "db_port" {
  description = "The port for the database."
  type        = string
  default     = "5432"
}
