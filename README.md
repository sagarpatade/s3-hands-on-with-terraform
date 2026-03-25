# Day 15: AWS S3 Static Website with Terraform

This project automates the creation of an S3 bucket configured for static website hosting.

## Features
- **S3 Bucket**: Unique naming via variables.
- **Versioning**: Enabled for data protection.
- **Static Website**: Configured with `index.html` and `error.html`.
- **Public Access**: Managed via `public_access_block` and `bucket_policy`.

## How to use
1. Run `terraform init`
2. Run `terraform apply`
3. Access the URL provided in the output.
