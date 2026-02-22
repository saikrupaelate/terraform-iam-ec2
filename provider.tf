terraform {
  backend "s3" {
    bucket         = "terraform-state-storage-elate" # REPLACE with your bucket name
    key            = "terraform-iam-ec2/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table" # Optional: for state locking
  }
}

provider "aws" {
  region = var.aws_region
  # Use AWS credentials provided by environment variables, shared config, or
  # GitHub Actions secrets (recommended). Do NOT hardcode credentials in Terraform variables.
}
