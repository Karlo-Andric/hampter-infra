resource "aws_ecs_cluster" "ecs" {
  name = "thr-cluster-${terraform.workspace}"
  service_connect_defaults {
    namespace = aws_service_discovery_http_namespace.http_namespace.arn
  }
}

resource "aws_service_discovery_http_namespace" "http_namespace" {
  name = terraform.workspace
}
