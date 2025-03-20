resource "aws_db_subnet_group" "main" {
  name = "${var.environment}-db-subnet-group"
  # subnet_ids = var.private_subnets # for production
  subnet_ids = var.public_subnets # for dev

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.environment}-rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # In production, restrict this to your application's IP range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-rds-sg"
    Environment = var.environment
  }
}

resource "aws_db_instance" "main" {
  identifier        = "${var.environment}-db"
  engine            = "postgres"
  engine_version    = "15.12"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  skip_final_snapshot = true # Set to false in production
  publicly_accessible = true # Set to false in production

  tags = {
    Name        = "${var.environment}-db"
    Environment = var.environment
  }
}


# For dev only
# resource "null_resource" "enable_pgvector" {
#   depends_on = [aws_db_instance.main]

#   provisioner "local-exec" {
#     command = <<-EOT
#       PGPASSWORD='${var.db_password}' psql -h ${aws_db_instance.main.endpoint} -U ${var.db_username} -d ${var.db_name} -c 'CREATE EXTENSION IF NOT EXISTS vector;'
#     EOT
#   }
# }
