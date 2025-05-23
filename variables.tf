variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "ecr_registry" {
  type    = string
  default = "414901227846.dkr.ecr.eu-central-1.amazonaws.com"
}

variable "env" {
  default = {
    dev = {
      log_retention_days     = 30
    }
  }
}