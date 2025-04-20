terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "chatterbox-terraform-state"
    key     = "terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
    profile = "chatterbox"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "chatterbox"
}

module "networking" {
  source = "../modules/networking"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

module "rds" {
  source      = "../modules/rds"
  environment = var.environment
  vpc_id      = module.networking.vpc_id
  # private_subnets = module.networking.private_subnets # for production
  public_subnets = module.networking.public_subnets # for dev
  db_name        = var.db_name
  db_username    = var.db_username
  db_password    = var.db_password
}

module "cognito" {
  source = "../modules/cognito"

  environment    = var.environment
  user_pool_name = var.user_pool_name
}

module "s3" {
  source = "../modules/s3"

  environment            = var.environment
  bucket_name            = var.bucket_name
  allowed_origins        = var.allowed_origins
  allowed_principal_arns = var.allowed_principal_arns
}
