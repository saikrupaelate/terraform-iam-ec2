# Terraform AWS IAM and EC2 Infrastructure as Code

Automated provisioning of EC2 instances, IAM roles, and S3 bucket access with security best practices using GitHub Actions CI/CD pipeline.

## 🚀 Features

- **Automated CI/CD Pipeline**: GitHub Actions for automatic Terraform deployment
- **EC2 Instance Management**: Provision and manage EC2 instances
- **IAM Security**: Role-based access control with S3 read-only policies
- **Security Groups**: Network access management for EC2
- **S3 Integration**: Bucket creation and management
- **Infrastructure as Code**: Version-controlled infrastructure

## 📋 Prerequisites

- AWS Account with appropriate IAM permissions
- GitHub repository access
- AWS credentials configured as GitHub secrets

## 🔐 GitHub Secrets Setup

Add the following secrets to your GitHub repository (Settings > Secrets and variables > Actions):

1. **AWS_ACCESS_KEY_ID** - Your AWS Access Key
2. **AWS_SECRET_ACCESS_KEY** - Your AWS Secret Access Key

## 📁 Project Structure

```
.
├── main.tf              # Main Terraform configuration
├── variables.tf         # Variable definitions
├── outputs.tf           # Output definitions
├── versions.tf          # Provider versions
├── provider.tf          # AWS provider configuration
├── terraform.tfvars     # Variable values (not committed)
├── secrets.tfvars       # Sensitive variables (not committed)
└── .github/
    └── workflows/
        └── terraform-deploy.yml  # GitHub Actions workflow
```

## 🔄 CI/CD Workflow

The GitHub Actions pipeline automatically:

1. **On Pull Requests**:
   - Checks Terraform formatting
   - Validates Terraform syntax
   - Generates and comments with Terraform plan
   
2. **On Push to Main**:
   - Initializes Terraform
   - Plans infrastructure changes
   - Applies changes automatically

## 📝 Configuration

### 1. Create `terraform.tfvars`

```hcl
aws_region    = "us-east-1"
instance_type = "t3.micro"
bucket_name   = "your-unique-bucket-name"
```

### 2. Commit and Push

```bash
git add .
git commit -m "Add Terraform configuration"
git push origin main
```

### 3. Monitor Pipeline

Watch the workflow in GitHub Actions tab. The pipeline will:
- Initialize Terraform
- Plan the deployment
- Apply changes to AWS

## 🛡️ Security Features (Foundation)

This project is structured to support:
- ✅ IAM least-privilege access
- ✅ Security group restrictions
- ✅ Read-only S3 policies
- 🔄 Ready for additional security implementations (encryption, logging, monitoring, etc.)

## 🔧 Future Security Enhancements

This foundation is designed for extensibility:
- SSL/TLS certificate integration
- CloudWatch logging and monitoring
- CloudTrail audit logging
- Encryption at rest and in transit
- Secrets management with AWS Secrets Manager
- WAF integration
- VPC flow logs

## 📊 Outputs

After deployment, the pipeline provides:
- EC2 Instance Public IP
- S3 Bucket Name
- IAM Role Name

## ⚠️ Important Notes

- **Security Group**: Currently allows SSH from 0.0.0.0/0 - restrict in production
- **Sensitive Files**: `secrets.tfvars` and `.terraform/` are excluded from git
- **State Management**: Terraform state is uploaded as artifacts (use remote state in production)

## 🚫 Troubleshooting

**Pipeline Fails During Apply**:
- Check AWS credentials in GitHub secrets
- Verify AWS IAM permissions
- Check bucket name uniqueness

**Terraform Plan Shows Errors**:
- Review variable values in `terraform.tfvars`
- Ensure all required variables are defined

## 📚 Resources

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [AWS IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

---

**Ready to extend with additional security implementations?** This foundation supports modular additions for encryption, monitoring, compliance, and more!
