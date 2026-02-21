output "ec2_public_ip" {
  value = aws_instance.demo_instance.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.demo_bucket.id
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}
