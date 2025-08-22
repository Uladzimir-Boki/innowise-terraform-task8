output "vpc_id" {
  description = "Created VPC Id"
  value       = module.public_vpc.vpc_id
}

output "subnet_ids" {
  description = "List of created public subnets ids"
  value       = module.public_vpc.public_subnet_ids
}