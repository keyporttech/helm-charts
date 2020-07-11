# Keyport Technologies Helm Charts Repository

[![](https://github.com/keyporttech/helm-charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/keyporttech/helm-charts/actions)

This is the helm repository for keyporttech helm charts, and is for publishing and distribution purposes only. Unlike many helm chart repositories keyporttech does not use a mono repo design. All chart git repo names are prefixed with "helm-" and are linked as git submodules under the charts dir.

## Contributing
Please submit any pull requests to the individual chart repos themselves. Please see [keyporttech charts contribution guidelines](https://github.com/keyporttech/helm-charts/blob/CONTRIBUTING.md)

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
