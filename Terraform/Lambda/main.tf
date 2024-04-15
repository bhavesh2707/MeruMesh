resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda_function"
  filename      = "lambda_function_payload.zip"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  environment {
    variables = {
      ENV_VAR_NAME = "ENV_VAR_VALUE"
    }
  }
}
