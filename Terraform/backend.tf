terraform {
  backend "s3" {
    bucket = "terrafrom-merumesh"
    key    = "/terraform.tfstate"
    region = "us-east-2"
  }
}