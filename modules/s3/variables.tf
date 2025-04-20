variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "allowed_origins" {
  description = "List of allowed origins for CORS configuration"
  type        = list(string)
  default     = ["http://localhost:3000"]
}

variable "allowed_principal_arns" {
  description = "List of IAM principal ARNs allowed to access the bucket"
  type        = list(string)
  # default     = [] # Add your application's IAM role ARNs here
}
