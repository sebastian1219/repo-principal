provider "aws" {
  region                  = "us-east-1"
  access_key              = var.aws_access_key_id
  secret_key              = var.aws_secret_access_key
  token                   = var.aws_session_token
}

module "redes" {
  source       = "./modules/redes"
  vpc_cidr     = var.vpc_cidr
  vpc_name     = var.vpc_name
  public_subnets = var.public_subnets
  azs          = var.azs
  sg_name      = var.sg_name
  allowed_ips  = var.allowed_ips
}

module "computo" {
  source        = "./modules/computo"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  subnet_ids    = module.redes.subnet_ids
  sg_id         = module.redes.sg_id
}

module "almacenamiento" {
  source            = "./modules/almacenamiento"
  bucket_name       = var.bucket_name
  bucket_acl        = var.bucket_acl
  environment       = var.environment
  versioning_status = var.versioning_status
}
