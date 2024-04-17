variable "lambda_name" {
  default = "test"
}
variable "iam_role" {
  default = ""
}
variable "image_tag" {
  default = ""
  description = "Enter the image tag"
}
variable "source_arn" {
  default = ""
}