# data "aws_ssm_parameter" "data_db_user" {
#   name = "/${terraform.workspace}/db/user"
# }

# resource "aws_ssm_parameter" "db_user" {
#   name      = "/${terraform.workspace}/db/user"
#   type      = "SecureString"
#   value     = data.aws_ssm_parameter.data_db_user.value
#   overwrite = true
# }

# data "aws_ssm_parameter" "data_db_password" {
#   name = "/${terraform.workspace}/db/password"
# }

# resource "aws_ssm_parameter" "db_password" {
#   name      = "/${terraform.workspace}/db/password"
#   type      = "SecureString"
#   value     = data.aws_ssm_parameter.data_db_password.value
#   overwrite = true
# }