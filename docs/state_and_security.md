# Terraform State & Security

Terraform state can contain sensitive infrastructure data and must be protected.

## Controls Demonstrated

- Remote state in S3.
- S3 versioning enabled.
- Server-side encryption enabled.
- Public access blocked.
- DynamoDB state locking.
- Separate state key per environment.
- `.tfstate` and `.tfvars` excluded from Git.

## Production Improvements

- Use KMS CMK if required by policy.
- Restrict bucket access to deployment roles.
- Enable CloudTrail data events if justified.
- Use OIDC federation from GitHub Actions.
- Apply SCPs / IAM boundaries where appropriate.
- Store secrets in AWS Secrets Manager / SSM Parameter Store rather than Terraform variables where possible.
