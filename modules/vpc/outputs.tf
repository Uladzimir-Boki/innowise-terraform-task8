output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.public_vpc.id
}

output "public_subnet_ids" {
  description = "List of created public subnets ids"
  value       = aws_subnet.public_subnets.*.id
}