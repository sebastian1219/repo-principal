module "redes" {
  source         = "git::https://github.com/sebastian1219/M-dulo-Redes.git?ref=v1.0.1"
  vpc_cidr       = var.vpc_cidr
  vpc_name       = var.vpc_name
  public_subnets = var.public_subnets
  azs            = var.azs
  sg_name        = var.sg_name
  allowed_ips    = var.allowed_ips
}

module "computo" {
  source        = "git::https://github.com/sebastian1219/M-dulo-C-mputo-.git?ref=v1.0.0"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.redes.subnet_ids[0]
  sg_id         = module.redes.sg_id
  instance_name = var.instance_name
}

module "almacenamiento" {
  source            = "git::https://github.com/sebastian1219/M-dulo-Almacenamiento-.git?ref=v1.0.0"
  bucket_name       = var.bucket_name
  bucket_acl        = var.bucket_acl
  environment       = var.environment
  versioning_status = var.versioning_status
}
