
module "aws_iam_role" {
  source = "./module/IAM"
}
module "aws_lambda_function" {
  source = "./module/Lambda"
  lambda_name = var.lambda_name
  iam_role = module.aws_iam_role.invoke_arn_arn
  image_tag = var.image_tag
}
module "api" {
    source = "./module/API"
    uri = module.aws_lambda_function.invoke_arn
}