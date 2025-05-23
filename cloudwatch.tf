resource "aws_cloudwatch_log_group" "thr_backend_log_group" {
  name              = "${terraform.workspace}/ecs/thr-backend"
  retention_in_days = var.env[terraform.workspace].log_retention_days
}