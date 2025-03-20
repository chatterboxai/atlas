variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
}

variable "domain_name" {
  description = "Domain name of the application"
  type        = string
  default     = "http://localhost:3000"
}
