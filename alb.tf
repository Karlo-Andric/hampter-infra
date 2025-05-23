# resource "aws_lb_target_group" "backend_target" {
#   name        = "backend-tg-${terraform.workspace}-${var.region}"
#   port        = 3000
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.thr_vpc.id
#   target_type = "ip"

#   health_check {
#     path                = "/"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#     protocol            = "HTTP"
#     port                = 3000
#   }
# }