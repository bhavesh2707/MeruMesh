variable "region" {
  default = "us-east-2"
}
variable "lambda_name" {
  default = "test_run"
}
variable "image_tag" {
  description = "Enter the image tag"
  default = "v1"
}