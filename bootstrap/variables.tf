variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "state_bucket_name" {
  description = "Must be globally unique."
  type        = string
}

variable "lock_table_name" {
  type    = string
  default = "terraform-state-locks"
}
