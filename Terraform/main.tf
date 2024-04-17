
module "aws_iam_role" {
  source = "./module/IAM"
}
module "lambda" {
  source = "./module/Lambda"
  lambda_name = var.lambda_name
  iam_role = module.aws_iam_role.invoke_arn_arn
  image_tag = var.image_tag
}
module "api" {
  source = "./module/API"
  uri = module.lambda.invoke_arn
  function_name = module.lambda.function_name
}