terraform {
  backend "s3" {
    bucket = "gowtham-selfhost-docker-tfstate"
    region = "ap-south-1"
    key = "dev/terraform.tfstate"
    dynamodb_table = "terraform-locks"    
  }
}