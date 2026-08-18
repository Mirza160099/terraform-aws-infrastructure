# Interview Case Study

## Situation
A growing team needs repeatable AWS environments and wants to reduce manual cloud configuration.

## Task
Design a Terraform repository that demonstrates reusable modules, separate environments, secure state handling and CI validation.

## Action
- Created network, application and observability modules.
- Built Dev/UAT/Prod compositions using the same reusable modules.
- Created a bootstrap layer for encrypted S3 remote state and DynamoDB locking.
- Added GitHub Actions for format and validation checks.
- Added scripts for local validation and planning.
- Documented security, deployment, promotion and rollback considerations.

## Result
Produced a GitHub-ready IaC portfolio project showing not just Terraform syntax, but engineering practices around collaboration, change control, state security and environment management.

## Interview Talking Points
1. Why remote state matters.
2. Why state locking matters.
3. Why separate environments should not share state.
4. Module reuse vs copy/paste.
5. How provider pinning reduces change risk.
6. How to authenticate GitHub Actions securely.
7. What happens if `terraform apply` fails halfway.
8. How to manage drift.
9. How to review destructive plans.
10. How Dev/UAT/Prod promotion should work.
