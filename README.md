# Keyport Technologies Helm Charts Repository

[![](https://github.com/keyporttech/helm-charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/keyporttech/helm-charts/actions)

Project that hosts a Helm Chart repository using GitHub Pages and Actions.

## Project Status

`master` supports Helm 3 only, i. e. both `v1` and `v2` [API version](https://helm.sh/docs/topics/charts/#the-apiversion-field) charts are installable.

## Sample Chart Sources

* `charts/test-chart-v2`: Sample chart with API version v2

## How to Use the Chart Repository

* Add your charts repository to your local machine with `helm repo add keyporttech https://keyporttech.github.io/helm-charts

## Actions

* [@helm/kind-action](https://github.com/helm/kind-action)
* [@helm/chart-testing-action](https://github.com/helm/chart-testing-action)
* [@helm/chart-releaser-action](https://github.com/helm/chart-releaser-action)

### Action Results

* The [Lint and Test Charts](/.github/workflows/lint-test.yaml) workflow uses [@helm/kind-action](https://www.github.com/helm/kind-action) GitHub Action to spin up a [kind](https://kind.sigs.k8s.io/) Kubernetes cluster, and [@helm/chart-testing-action](https://www.github.com/helm/chart-testing-action) to lint and test your charts on every Pull Request and push
* The [Release Charts](/.github/workflows/release.yaml) workflow uses [@helm/chart-releaser-action](https://www.github.com/helm/chart-releaser-action) to turn your GitHub project into a self-hosted Helm chart repo. It does this – during every push to `master` – by checking each chart in your project, and whenever there's a new chart version, creates a corresponding [GitHub release](https://help.github.com/en/github/administering-a-repository/about-releases) named for the chart version, adds Helm chart artifacts to the release, and creates or updates an `index.yaml` file with metadata about those releases, which is then hosted on GitHub Pages

