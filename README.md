# Validate Kubernetes manifests by kubeval

[<img src="https://github.com/makocchi-git/actions-k8s-manifests-validate-kubeval/workflows/Perform checks/badge.svg"/>](https://github.com/makocchi-git/actions-k8s-manifests-validate/actions)

Validate [Kubernetes](https://github.com/kubernetes/kubernetes) manifests in your repository.  
This action uses [Kubeval](https://kubeval.instrumenta.dev/) for validating.

<img src="./img/check.png" alt="sample comment" width="80%" />

## Usage

### Basic

```yaml
# .github/workflows/manifests-validation.yml
name: Pull Request Check

on: [pull_request]

jobs:
  validation:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: validate manifests in dir1 and dir2
        uses: andloh/actions-k8s-manifests-validate-kubeval@1.0.6
        with:
          files: dir1,dir2
          token: ${{ secrets.GITHUB_TOKEN }}
          ignored_path_patterns: .github/workflow/action.yaml,file2.yaml

```

### Input parameters

| Parameter                | Description                                                               | Default  |
| ------------------------ | ------------------------------------------------------------------------- | -------- |
| `files`                  | Files or directories to validate                                          | `.`      |
| `version`                | Version of Kubernetes to validate against                                 | `master` |
| `strict`                 | Whether to not to check for extra properties                              | `true`   |
| `openshift`              | Whether to use the schemas from OpenShift rather than Kubernetes          | `false`  |
| `ignore_missing_schemas` | Whether or not to skip custom resources                                   | `true`   |
| `comment`                | Write validation details to pull request comments                         | `true`   |
| `token`                  | Github token for api. This is required if `comment` is true               | `""`     |
| `ignored_path_patterns`  | A comma-separated list of regular expressions specifying paths to ignore  | `""`     |

