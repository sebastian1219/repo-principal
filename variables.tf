variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "aws_session_token" {
  description = "AWS Session Token (opcional)"
  type        = string
  default     = null
}

variable "vpc_cidr" { type = string }
variable "vpc_name" { type = string }
variable "public_subnets" { type = list(string) }
variable "azs" { type = list(string) }
variable "sg_name" { type = string }
variable "allowed_ips" { type = list(string) }

variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "instance_name" { type = string }

variable "bucket_name" { type = string }
variable "bucket_acl" { type = string }
variable "environment" { type = string }
variable "versioning_status" { type = string }
