TF_STAGE_DIR := environments/stage
TF_PROD_DIR := environments/prod
AWS_STAGE_CRED := AWS_ACCESS_KEY_ID=$(STAGE_AWS_ACCESS_KEY_ID) AWS_SECRET_ACCESS_KEY=$(STAGE_AWS_SECRET_ACCESS_KEY)
AWS_PROD_CRED := AWS_ACCESS_KEY_ID=$(PROD_AWS_ACCESS_KEY_ID) AWS_SECRET_ACCESS_KEY=$(PROD_AWS_SECRET_ACCESS_KEY)

.PHONY: tf-stage-init tf-stage-plan tf-stage-apply tf-prod-init tf-prod-plan tf-prod-apply

tf-stage-init:
	@$(AWS_STAGE_CRED) terraformw -chdir=$(TF_STAGE_DIR) init
tf-stage-plan:
	@$(AWS_STAGE_CRED) terraformw -chdir=$(TF_STAGE_DIR) plan -var-file="terraform.tfvars"
tf-stage-apply-auto:
	@$(AWS_STAGE_CRED) terraformw -chdir=$(TF_STAGE_DIR) apply -var-file="terraform.tfvars" -auto-approve
tf-stage-destroy-auto:
	@$(AWS_STAGE_CRED) terraformw -chdir=$(TF_STAGE_DIR) destroy -var-file="terraform.tfvars" -auto-approve
tf-prod-init:
	@$(AWS_PROD_CRED) terraformw -chdir=$(TF_PROD_DIR) init
tf-prod-plan:
	@$(AWS_PROD_CRED) terraformw -chdir=$(TF_PROD_DIR) plan -var-file="terraform.tfvars"
tf-prod-apply-auto:
	@$(AWS_PROD_CRED) terraformw -chdir=$(TF_PROD_DIR) apply -var-file="terraform.tfvars" -auto-approve
tf-prod-destroy-auto:
	@$(AWS_PROD_CRED) terraformw -chdir=$(TF_PROD_DIR) destroy -var-file="terraform.tfvars" -auto-approve
