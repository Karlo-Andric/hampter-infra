resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "thr-tf-state"
  lifecycle {
    prevent_destroy = true
  }
}
