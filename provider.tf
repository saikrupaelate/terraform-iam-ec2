terraform {
  backend "s3" {
    bucket  = "devops-iam-demo-bucket-12345"
    key     = "terraform-iam-ec2/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
  # Use AWS credentials provided by environment variables, shared config, or
  # GitHub Actions secrets (recommended). Do NOT hardcode credentials in Terraform variables.
}
