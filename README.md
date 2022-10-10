# Terraform multi-stages example
This is an example of terraform configuration for small and medium services.

## Concept
There are the following assumptions.

1. There are two environments, one for staging and one for production.
2. Each environment is built on each AWS account
3. Each resource is nearly identical, but some differ.

In this case, without workspace, it would be better to use different backend on each AWS account.  
The reason is that there is currently no support to separate backend configurations for each workspace
https://github.com/hashicorp/terraform/issues/16627

## How to use
### Set environment variables
Generate AWS credentials from the both environments `stage` and `production`.

You need to set these variables for staging.
- STAGE_AWS_ACCESS_KEY_ID
- STAGE_AWS_SECRET_ACCESS_KEY

You need to set these variables for production.
- PROD_AWS_ACCESS_KEY_ID
- PROD_AWS_SECRET_ACCESS_KEY

How it is set up differs between local and CI/CD

For local, create `.envrc` from `.envrc.example`.  
And then install `direnv` and exec `direnv allow` in the project root directory.

```
$ cp .envrc.example .envrc
```

For CI/CD, set the above environment variables to the CI/CD platforms.

### Init, Plan, Apply(auto approve)
For staging:
```
$ make tf-stage-init
$ make tf-stage-plan
$ make tf-stage-apply-auto
```

For production:
```
$ make tf-prod-init
$ make tf-prod-plan
$ make tf-prod-apply-auto
```

## Tips
### Manage multiple Terraform versions locally
You can use `tfenv`  
https://github.com/tfutils/tfenv

### Autocomplete 
`$ terraform -install-autocomplete`

## Reference
**very useful**
- https://cloud.google.com/docs/terraform/best-practices-for-terraform

**useful**
- https://www.terraform.io/language/modules/develop
- https://www.terraform.io/cloud-docs/recommended-practices
- https://www.hashicorp.com/blog/terraform-mono-repo-vs-multi-repo-the-great-debate
- https://spacelift.io/blog/terraform-best-practices
- https://github.com/hashicorp/terraform/issues/15966
- https://github.com/antonbabenko/terraform-best-practices