# Basic Usage Example for oci-adb-module

This example shows how to provision an Oracle Autonomous Database using:

- Terraform 1.12+
- OCI Vault for the admin password

## Instructions

1. Edit `terraform.tfvars` and set your values for:
   - `compartment_id`
   - `admin_password_secret_id`
   - `admin_password_secret_version` (optional, default is 1)

2. Run the following commands:

```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
