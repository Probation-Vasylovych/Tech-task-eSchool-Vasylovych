.PHONY: init plan apply destroy
ESCHOOL_ENV=stage-01
init:
	terraform init
	terraform workspace select -or-create ${ESCHOOL_ENV}

plan: init
	terraform plan -var-file=workspace_vars/${ESCHOOL_ENV}.tfvars

apply: init
	terraform apply -var-file=workspace_vars/${ESCHOOL_ENV}.tfvars

destroy: init
	terraform destroy -var-file=workspace_vars/${ESCHOOL_ENV}.tfvars