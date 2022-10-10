terraform {
  backend "s3" {
    bucket = "small-project-62ihofymle"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}