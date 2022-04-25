provider "aws" {
  region = var.aws_region
}


#Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "lakehouse-test-manually"
    key = "state/terraform.tfstate"
    region = "sa-east-1"
  }
}