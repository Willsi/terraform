.PHONY = pythonserver

server:
	@terraform apply -auto-approve -var-file=variables/vars.tfvars
