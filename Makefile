.PHONY: default cookiecutter go_mod_tidy shim_go_mod_tidy

SKIP_EXISTING= -s

default: cookiecutter

cookiecutter:
	docker run -it -v ${PWD}:/provider pulumi-tf-provider-cookiecutter $(SKIP_EXISTING) --no-input

go_mod_tidy:
	docker run -it -v ${PWD}:/provider --entrypoint go -w "/provider/pulumi-harvester/provider" pulumi-tf-provider-cookiecutter mod tidy

shim_go_mod_tidy:
	docker run -it -v ${PWD}:/provider --entrypoint go -w "/provider/pulumi-harvester/provider/shim" pulumi-tf-provider-cookiecutter mod tidy