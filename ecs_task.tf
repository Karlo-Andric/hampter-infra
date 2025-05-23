resource "aws_ecs_task_definition" "backend_fargate" {
  family                   = "backend-fargate"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name      = "thr-backend-${terraform.workspace}"
    image     = "${var.ecr_registry}/thr-ecr-${terraform.workspace}/backend:latest"
    cpu       = 256
    memory    = 1024
    essential = true
    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.thr_backend_log_group.name
        awslogs-region        = "eu-west-2"
        awslogs-stream-prefix = "ecs"
      }
    }
  }])
}
