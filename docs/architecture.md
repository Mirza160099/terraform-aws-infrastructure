# Architecture

```text
                    GitHub
                      |
                 Pull Request
                      |
                Terraform CI
            fmt / init / validate
                      |
               Approved Change
                      |
       +--------------+--------------+
       |              |              |
      Dev            UAT            Prod
       |              |              |
       +------ Shared Modules -------+
              |       |       |
           Network    App   Observability
              |
          AWS Resources

Remote State:
S3 (encrypted + versioned)
+
DynamoDB state locking
```

## Design Intent

The project separates:
- reusable implementation logic (`modules/`)
- environment-specific composition (`envs/`)
- backend bootstrap (`bootstrap/`)
- automated validation (`.github/workflows/`)
