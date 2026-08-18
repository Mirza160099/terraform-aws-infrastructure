terraform {
  backend "s3" {
    bucket         = "REPLACE-WITH-STATE-BUCKET"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
