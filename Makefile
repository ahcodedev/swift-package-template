.PHONY: setup generate test-template gitleaks zizmor markdownlint

TEMPLATE_TEST_DIR ?= .build/template-test

setup:
	brew bundle
	prek install
generate:
	rm -rf $(TEMPLATE_TEST_DIR)
	copier copy --vcs-ref=HEAD --defaults --data project_name=example-package . $(TEMPLATE_TEST_DIR)
test-template: generate
	$(MAKE) -C $(TEMPLATE_TEST_DIR) build test ci-format ci-lint markdownlint
gitleaks:
	gitleaks git --redact --verbose
markdownlint:
	markdownlint-cli2 "**/*.md"
zizmor:
	zizmor .
