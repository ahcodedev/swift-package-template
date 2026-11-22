.PHONY: setup build test format ci-format lint ci-lint gitleaks zizmor update-template markdownlint

setup:
	brew bundle
	prek install
build:
	swift build
test:
	swift test
format:
	swift format --in-place --recursive --parallel .
ci-format:
	swift format lint --strict --recursive --parallel .
lint:
	swift package plugin --allow-writing-to-package-directory swiftlint --fix
ci-lint:
	swift package plugin --allow-writing-to-package-directory swiftlint --strict
gitleaks:
	gitleaks git --redact --verbose
markdownlint:
	markdownlint-cli2 "**/*.md"
zizmor:
	zizmor .
update-template:
	copier update
