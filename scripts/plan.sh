#!/usr/bin/env bash
set -euo pipefail

ENVIRONMENT="${1:-dev}"

if [[ ! "$ENVIRONMENT" =~ ^(dev|uat|prod)$ ]]; then
  echo "Usage: $0 {dev|uat|prod}"
  exit 1
fi

terraform -chdir="envs/$ENVIRONMENT" init
terraform -chdir="envs/$ENVIRONMENT" plan
