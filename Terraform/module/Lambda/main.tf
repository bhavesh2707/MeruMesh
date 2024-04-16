data "aws_ecr_image" "service_image" {
  repository_name = "merumesh"
  image_tag       = "latest"
}

resource "aws_lambda_function" "api_function" {
  function_name = var.lambda_name
  timeout       = 300
  package_type  = "Image"
  image_uri     = data.aws_ecr_image.service_image.image_uri

  role = var.iam_role
}

output "invoke_arn" {
  value = aws_lambda_function.api_function.invoke_arn
}
output "image_uri" {
  value = data.aws_ecr_image.service_image.image_uri
}