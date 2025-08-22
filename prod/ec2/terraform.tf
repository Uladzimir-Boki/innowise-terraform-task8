terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "trainee"

  region = "eu-north-1"

  default_tags {
    tags = {
      Owner = "Uladzimir Boki"
    }
  }
}