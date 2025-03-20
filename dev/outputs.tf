# Network outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnets
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.networking.private_subnets
}

# Cognito outputs
output "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool"
  value       = module.cognito.user_pool_id
}

output "cognito_client_id" {
  description = "The ID of the Cognito User Pool Client"
  value       = module.cognito.client_id
}

output "cognito_user_pool_arn" {
  description = "The ARN of the Cognito User Pool"
  value       = module.cognito.user_pool_arn
}

# RDS outputs
output "db_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.db_endpoint
}

output "db_name" {
  description = "The name of the database"
  value       = module.rds.db_name
}

output "db_username" {
  description = "The master username for the database"
  value       = module.rds.db_username
}



