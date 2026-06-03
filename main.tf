module "redes" {
  source     = "git::https://github.com/sebastian1219/M-dulo-Redes.git"
  cidr_block = var.vpc_cidr
}

module "computo" {
  source        = "git::https://github.com/sebastian1219/M-dulo-C-mputo-.git"
  vpc_id        = module.redes.vpc_id
  instance_type = var.instance_type
  ami_id        = var.ami_id
}

module "almacenamiento" {
  source      = "git::https://github.com/sebastian1219/M-dulo-Almacenamiento-.git"
  bucket_name = var.bucket_name
}
