# Keyport Technologies Helm Charts Repository

[![](https://github.com/keyporttech/helm-charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/keyporttech/helm-charts/actions)

This is the helm repository for keyporttech helm charts, and is for publishing and distribution purposes only. Unlike many helm chart repositories keyporttech does not use a mono repo design. All chart git repo names are prefixed with "helm-" and are linked as git submodules under the charts dir.

## Contributing
Please submit any pull requests to the individual chart repos themselves.

## Project Status

Keyporttech supports Helm 3 only, i. e. both `v1` and `v2` [API version](https://helm.sh/docs/topics/charts/#the-apiversion-field) charts are installable.

## Chart Sources

Chart sources are linked git submoules in the charts dir.

## How to Use the Chart Repository

* Add the charts repository to your local repository list

```bash
helm repo add keyporttech https://keyporttech.github.io/helm-charts/
```

* List the repositories now configured

```bash
helm repo list
```

* Search for charts in the repository

```bash
helm search repo keyporttech"
```

## cicd for charts in this repo

Keyporttech uses the offical helm tooling with a few tweaks.

New chart versions may be submitted by doing a pull request on the individual chart.

* [@helm/chart-testing](https://github.com/helm/chart-testing)
* [@helm/chart-releaser](https://github.com/helm/chart-releaser)

The piplines are modified Versions of the following:

* The [Lint and Test Charts](/.github/workflows/lint-test.yaml) workflow uses [@helm/kind-action](https://www.github.com/helm/kind-action) GitHub Action to spin up a [kind](https://kind.sigs.k8s.io/) Kubernetes cluster, and [@helm/chart-testing-action](https://www.github.com/helm/chart-testing-action) to lint and test your charts on every Pull Request and push
* The [Release Charts](/.github/workflows/release.yaml) workflow uses [@helm/chart-releaser-action](https://www.github.com/helm/chart-releaser-action) to turn your GitHub project into a self-hosted Helm chart repo. It does this – during every push to `master` – by checking each chart in your project, and whenever there's a new chart version, creates a corresponding [GitHub release](https://help.github.com/en/github/administering-a-repository/about-releases) named for the chart version, adds Helm chart artifacts to the release, and creates or updates an `index.yaml` file with metadata about those releases, which is then hosted on GitHub Pages
