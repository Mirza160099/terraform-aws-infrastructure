data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source   = "../../modules/network"
  name     = "dev"
  vpc_cidr = "10.30.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "app" {
  source             = "../../modules/app"
  name               = "dev"
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  instance_type      = "t3.micro"
  desired_capacity   = 1
  min_size           = 1
  max_size           = 2
}

module "observability" {
  source         = "../../modules/observability"
  name           = "dev"
  asg_name       = module.app.asg_name
  alb_arn_suffix = module.app.alb_arn_suffix
}
