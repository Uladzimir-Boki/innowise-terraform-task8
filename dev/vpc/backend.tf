terraform {
  backend "s3" {
    bucket         = "trainee-project-uladzimir-boki-tfstate"
    key            = "dev/vpc.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "trainee-project-uladzimir-boki-terraform-lock"
    encrypt        = true
    profile        = "trainee"
  }
}