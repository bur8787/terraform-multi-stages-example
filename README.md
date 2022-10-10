# Terraform Practice Example
## Description
小規模や中規模のサービス向けのterraformの構成例です。

## Case Study
1. There are two environments, one for staging and one for production.
2. Each environment is built on each AWS account
3. Each resource is nearly identical, but some differ.

## My Thought
### TL;DR
For middle projects, it would be better to create another AWS account separated from `production` and `staging` for backend.  
For small projects, it would be better to use different backend on each AWS account without using workspace.

### Details
Currently, there is no support to separate backend configurations for each workspace
https://github.com/hashicorp/terraform/issues/16627

`tfstate` should be stored in each AWS account or use another AWS account instead of staging and production.

Normally, when using workspace to separate environments, the same backend is used, but we don't want to do that this time. It is not desirable to have the production `tfstate` disappear if the AWS account for the staging environment is accidentally deleted.
On the other hand, we do not want to put the `tfstate` of the staging environment in the production environment, nor do we want only the bare minimum to happen in the production environment.

Therefore, for middle projects, I think a good move would be to create another AWS account.
For smaller projects, it seems a bit overkill.

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