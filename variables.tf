# Variables para el módulo redes
variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de subnets públicas"
  type        = list(string)
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "sg_name" {
  description = "Nombre del Security Group"
  type        = string
}

variable "allowed_ips" {
  description = "Lista de IPs permitidas para acceso"
  type        = list(string)
}

# Variables para el módulo computo
variable "instance_name" {
  description = "Nombre de la instancia EC2"
  type        = string
}

# Variables para el módulo almacenamiento
variable "bucket_acl" {
  description = "ACL del bucket S3"
  type        = string
}

variable "environment" {
  description = "Entorno (dev, test, prod)"
  type        = string
}

variable "versioning_status" {
  description = "Estado del versionado del bucket"
  type        = string
}
