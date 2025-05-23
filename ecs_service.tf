resource "aws_ecs_service" "backend_service" {
  name            = "backend-service-${terraform.workspace}"
  cluster         = aws_ecs_cluster.ecs.name
  task_definition = aws_ecs_task_definition.backend_fargate.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.public_1.id]
    security_groups  = [aws_security_group.fargate_sg.id]
    assign_public_ip = true
  }

  # load_balancer {
  #   target_group_arn = aws_lb_target_group.backend_target.arn
  #   container_name   = "thr-backend-${terraform.workspace}"
  #   container_port   = 3000
  # }
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}