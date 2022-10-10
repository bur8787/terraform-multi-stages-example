terraform {
  backend "s3" {
    bucket = "small-project-bs8l1hmhir"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}