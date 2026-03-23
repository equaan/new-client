module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "-vpc"
  
  # Uses the CIDR block provided by the DevOps engineer in the UI
  cidr = ""

  # Dynamically creates subnets based on the selected region
  azs             = ["a", "b"]
  private_subnets = [cidrsubnet("", 4, 0), cidrsubnet("", 4, 1)]
  public_subnets  = [cidrsubnet("", 4, 2), cidrsubnet("", 4, 3)]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = "production"
  }
}
