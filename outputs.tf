output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.redes.vpc_id
}

output "instance_ip" {
  description = "IP pública de la instancia EC2"
  value       = module.computo.instance_ip
}

output "bucket_name" {
  description = "Nombre del bucket S3"
  value       = module.almacenamiento.bucket_name
}

