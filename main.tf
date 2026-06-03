terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

module "redes" {
  source       = "git::https://github.com/VICENTE0777/M-dulo-Redes.git"
  vpc_cidr     = var.vpc_cidr
  vpc_name     = var.vpc_name
  public_subnets = var.public_subnets
  azs          = var.azs
  sg_name      = var.sg_name
  allowed_ips  = var.allowed_ips
}

module "computo" {
  source        = "git::https://github.com/VICENTE0777/M-dulo-C-mputo-.git"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  subnet_ids    = module.redes.subnet_ids
  sg_id         = module.redes.sg_id
}

module "almacenamiento" {
  source            = "git::https://github.com/VICENTE0777/M-dulo-Almacenamiento-.git"
  bucket_name       = var.bucket_name
  bucket_acl        = var.bucket_acl
  environment       = var.environment
  versioning_status = var.versioning_status
}
