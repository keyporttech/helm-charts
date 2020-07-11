# Contributing to keyporttech Charts

Contributions are welcome, but all PRs must pass the CI check and code review. Please do not submit individual chart PRs to the keyporttech helm-repo. All Chart PRs should be submitted to the chart repos.

## ci/cd for charts in the keyporttech repo

All individual chart repos contain Makefile that get executed on our cicd system.

Keyporttech uses a custom implementation the offical helm tooling:

* ct - [@helm/chart-testing](https://github.com/helm/chart-testing)
* cr - [@helm/chart-releaser](https://github.com/helm/chart-releaser)

We have modified the [github actions workflow](https://github.com/helm/chart-testing-action) to run in a standard Makefile. The steps include:

* chart version check
* helm lint
* helm template - make sure the templates render
* ct lint (ensures official standards -more in depth than helm lint)
* ct install (installs the chart locally)
* helm test - runs any tests against the installed helm repo.

To run locally in a cloned chart repo:

```bash
make build
```

## Deployments

Once a PR passes CI and code review it is deployed using the [chart releaser tool](https://github.com/helm/chart-releaser). It does this – during every push to `master` – by checking each chart in your project, and whenever there's a new chart version, creates a corresponding [GitHub release](https://help.github.com/en/github/administering-a-repository/about-releases) named for the chart version, adds Helm chart artifacts to the release, and creates or updates an `index.yaml` file with metadata about those releases, which is then hosted on GitHub Pages

The cd process runs:

```bash
make deploy
```

## Prerequisites for running the keyporttech Makefiles.

The [chart testing tool](https://github.com/helm/chart-testing) has a number of dependencies itself which include below:

#### Install [ct](https://github.com/helm/chart-testing) and dependencies
 * Install [yamllint](https://github.com/adrienverge/yamllint) and [yamale](https://pypi.org/project/yamale/) python tools using pip:
 ```bash
 pip install yamale
 pip install --user yamllint
 ```
* Install the helm [chart testing tool](https://github.com/helm/chart-testing) following their instructions
* Copy [chart_schema.yaml](https://github.com/helm/chart-testing/blob/master/etc/chart_schema.yaml) to local /etc/ct/chart_schema.yaml
* Copy [lintconf.yaml](https://github.com/helm/chart-testing/blob/master/etc/lintconf.yaml) to local /etc/ct/lintconf.yamllint

#### Install [cr](https://github.com/helm/chart-releaser)
* Install the helm [chart releaser tool](https://github.com/helm/chart-releaserg) following their instructions

#### Other tools
* [yq](https://github.com/mikefarah/yq)
* helm 3
* kubectl
