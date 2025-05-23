terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket  = "thr-tf-state"
    key     = "terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
    assume_role = {
      role_arn = "arn:aws:iam::414901227846:role/s3TaskExecutionRole"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "thr-infrastructure"
  region  = "eu-central-1"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Region      = "eu-central-1"
    }
  }
}
