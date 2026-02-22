provider "aws" {
  region = var.aws_region
  # Use AWS credentials provided by environment variables, shared config, or
  # GitHub Actions secrets (recommended). Do NOT hardcode credentials in Terraform variables.
}
