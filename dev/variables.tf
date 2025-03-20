variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "chatterbox"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "chatterbox_admin"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
  default     = "chatterbox-users"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for file uploads"
  type        = string
  default     = "chatterbox-uploads"
}
