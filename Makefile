help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install pre-commit hooks + configure TF+TG versions
	@pre-commit install
	@tfenv install
	@tgswitch

uninstall: ## Uninstall hooks
	@pre-commit uninstall

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files
