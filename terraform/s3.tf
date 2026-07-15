resource "aws_s3_bucket" "terraform_state" {
  bucket = "gowtham-selfhost-docker-tfstate"
}