resource "aws_api_gateway_rest_api" "api" {
  name        = var.api_name
  description = "Test api for merumesh"
}

resource "aws_api_gateway_resource" "api_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "api"
}

resource "aws_api_gateway_method" "api_method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.api_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "api_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.api_resource.id
  http_method             = aws_api_gateway_method.api_method.http_method
  type                    = "AWS"
  integration_http_method = "GET"
  uri                     = var.uri
}

resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on      = [aws_api_gateway_integration.api_integration]
  rest_api_id     = aws_api_gateway_rest_api.api.id
  stage_name      = "prod"
}

output "id" {
  value = aws_api_gateway_rest_api.api.id
}
output "http_method" {
  value = aws_api_gateway_method.api_method.http_method
}
output "path" {
  value = aws_api_gateway_resource.api_resource.path
}