resource "aws_db_instance" "main" {
  engine                      = "postgres"
  engine_version              = "17.4"
  instance_class              = "db.t3.micro"
  allocated_storage           = 20
  storage_type                = "gp2"
  identifier                  = "thr-db"
#   username                    = data.aws_ssm_parameter.data_db_user.value
#   password                    = data.aws_ssm_parameter.data_db_password.value
  username                    = "postgres"
  password                    = "postgres"
  db_name                     = "thr_db"
  skip_final_snapshot         = true
  allow_major_version_upgrade = true
  publicly_accessible         = true
  copy_tags_to_snapshot       = true
  backup_retention_period     = 5

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  parameter_group_name   = aws_db_parameter_group.main.name
}

resource "aws_db_subnet_group" "main" {
  name        = "thr_db_sg"
  description = "Main database subnet group"
  subnet_ids  = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

resource "aws_db_parameter_group" "main" {
  name        = "thr-db-pg"
  family      = "postgres17"
  description = "PostgreSQL parameter group"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }
}