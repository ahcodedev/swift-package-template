.PHONY: setup generate test-template gitleaks zizmor

TEMPLATE_TEST_DIR ?= .build/template-test

setup:
	brew bundle
	prek install
generate:
	rm -rf $(TEMPLATE_TEST_DIR)
	copier copy --vcs-ref=HEAD --defaults --data project_name=example-package . $(TEMPLATE_TEST_DIR)
test-template: generate
	$(MAKE) -C $(TEMPLATE_TEST_DIR) build test ci-format ci-lint
gitleaks:
	gitleaks git --redact --verbose
zizmor:
	zizmor .
