# Deployment Workflow

## Proposed Flow

1. Developer creates a feature branch.
2. Terraform changes are committed.
3. Pull request triggers CI validation.
4. Reviewer inspects module changes and plan output.
5. Dev is applied first.
6. Post-deployment checks run.
7. Change is promoted to UAT.
8. UAT validation completes.
9. Production requires an explicit approval gate.
10. Apply is executed with a short-lived deployment role.
11. Post-deployment health checks and monitoring confirm success.

## Rollback

Terraform is declarative, but rollback still needs planning:
- revert known-good code
- re-run plan
- understand destructive changes
- restore data separately where stateful services are involved

Infrastructure rollback is not the same as application/data rollback.
