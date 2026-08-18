provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      Project     = "terraform-aws-infrastructure"
      Environment = "uat"
      ManagedBy   = "Terraform"
    }
  }
}
