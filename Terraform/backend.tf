terraform {
  backend "s3" {
    bucket = "terrafrom-merumesh"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}