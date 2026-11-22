# swift-package-template ![Template](https://github.com/ahcodedev/swift-package-template/actions/workflows/template.yml/badge.svg?branch=main)

[Copier](https://copier.readthedocs.io) template for Swift packages

## Usage

```sh
brew install copier
copier copy gh:ahcodedev/swift-package-template my-package
cd my-package
make setup
```

Questions (see `copier.yml`):

| Question | Purpose | Default |
| --- | --- | --- |
| `project_name` | Package name (lower-kebab-case) | none |
| `package_name` | Library, target and directory names (PascalCase) | `project_name` in PascalCase |
| `description` | README description | `Package description here` |
| `github_repo` | `owner/name` for the README badge | `ahcodedev/<project_name>` |

Generated projects include `.copier-answers.yml`. Run `make update-template` in a generated project with a clean git tree to pull template changes. Updates are taken from the latest git tag, so tag each template release.

The example source and test files are only created on first copy; updates do not overwrite them.

## Layout

- `template/` - project skeleton rendered by Copier
- `copier.yml` - questions and template settings

## Generated Project

The generated package supports:

- `Makefile` commands for setup, build, test, format, lint, Markdown lint, gitleaks, zizmor and template updates
- GitHub Actions: build, unit tests, coverage threshold, format check, lint, Markdown lint, secret scanning (gitleaks), workflow audit (zizmor)
- Release Drafter, Dependabot, pull request template

See [template/README.md.jinja](template/README.md.jinja) for details.

## Commands

- Setup (installs [Homebrew](https://brew.sh) tools from `Brewfile` and git hooks) - `make setup`
- Generate an example project into `.build/template-test` from the working tree - `make generate`
- Generate and build, test, format check, lint and Markdown lint the example project - `make test-template`
- Scan git history for secrets ([gitleaks](https://github.com/gitleaks/gitleaks)) - `make gitleaks`
- Lint Markdown ([markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2), config in `.markdownlint-cli2.jsonc`) - `make markdownlint`
- Audit GitHub Actions workflows ([zizmor](https://docs.zizmor.sh)) - `make zizmor`

## Releases

Release notes are drafted automatically by [Release Drafter](https://github.com/release-drafter/release-drafter) as pull requests merge into `main`. Publishing a release creates the git tag that `copier update` uses.

The next version is calculated from pull request labels:

| Label | Release notes section | Version bump |
| --- | --- | --- |
| `breaking-change` | Breaking Changes | major |
| `enhancement` | New Features | minor |
| `bug` | Bug Fixes | patch |
| `dependencies` | Dependencies | patch |
| `ignore-for-release` | Excluded | none |
