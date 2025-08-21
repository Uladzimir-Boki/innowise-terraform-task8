terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
  default_tags {
    tags = {
      Project   = "Trainee project"
      Owner     = "trainee"
      ManagedBy = "Terraform"
    }
  }
}

module "public_vpc" {
  source      = "./modules/vpc"
  name_prefix = "trainee-project"
  azs         = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  vpc_cidr    = "10.0.0.0/16"
}

output "vpc_id" {
  description = "Created VPC Id"
  value       = module.public_vpc.vpc_id
}

output "subnet_ids" {
  description = "List of created public subnets ids"
  value       = module.public_vpc.public_subnet_ids
}