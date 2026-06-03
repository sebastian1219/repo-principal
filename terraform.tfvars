# -------------------
# Redes
# -------------------
vpc_cidr       = "10.0.0.0/16"
vpc_name       = "vpc-principal"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
azs            = ["us-east-1a", "us-east-1b"]
sg_name        = "default-sg"
allowed_ips    = ["0.0.0.0/0"]  # Permite acceso desde cualquier IP

# -------------------
# Cómputo
# -------------------
ami_id        = "ami-046b36f55e189564a"   # Amazon Linux 2 válido en us-east-1
instance_type = "t2.micro"
instance_name = "ec2-principal"

# -------------------
# Almacenamiento
# -------------------
bucket_name       = "vicente-grupo1-bucket-2026"
bucket_acl        = "private"
environment       = "dev"
versioning_status = "Enabled"
