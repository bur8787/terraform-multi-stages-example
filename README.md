## Case Study
1. There are two environments, one for staging and one for production.
2. Each environment is built on each AWS account
3. Each resource is nearly identical, but some differ.

## My Thought
### TL;DR
For large projects, it would be better to create another AWS account separated from `production` and `staging` for backend.  
For small projects, it would be better to use different backend on each AWS account.

### Details
`tfstate` should be stored in each AWS account or use another AWS account instead of staging and production.

Normally, when using the workspace function to separate environments, the same backend is used, but we don't want to do that this time. It is not desirable to have the production `tfstate` disappear if the AWS account for the staging environment is accidentally deleted.
On the other hand, we do not want to put the `tfstate` of the staging environment in the production environment, nor do we want only the bare minimum to happen in the production environment.

Therefore, for large projects, I think a good move would be to create another AWS account.
For smaller projects, it seems a bit overkill.

Currently, there is no support to separate backend configurations for each workspace
https://github.com/hashicorp/terraform/issues/16627