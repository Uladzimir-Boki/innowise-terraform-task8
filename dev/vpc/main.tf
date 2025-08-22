
module "public_vpc" {
  source      = "../../modules/vpc"
  name_prefix = "dev-trainee-project"
  azs         = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  vpc_cidr    = "10.0.0.0/16"
}
