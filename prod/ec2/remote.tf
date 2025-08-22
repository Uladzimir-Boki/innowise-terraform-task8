data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "trainee-project-uladzimir-boki-tfstate"
    key            = "prod/vpc.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "trainee-project-uladzimir-boki-terraform-lock"
  }
}