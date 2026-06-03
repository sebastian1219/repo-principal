variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
}

variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "ami_id" {
  description = "AMI a utilizar para la instancia EC2"
  type        = string
}
