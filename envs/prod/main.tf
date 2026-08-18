data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source   = "../../modules/network"
  name     = "prod"
  vpc_cidr = "10.50.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "app" {
  source             = "../../modules/app"
  name               = "prod"
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  instance_type      = "t3.small"
  desired_capacity   = 2
  min_size           = 2
  max_size           = 4
}

module "observability" {
  source         = "../../modules/observability"
  name           = "prod"
  asg_name       = module.app.asg_name
  alb_arn_suffix = module.app.alb_arn_suffix
}
