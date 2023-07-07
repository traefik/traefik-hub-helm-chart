# Traefik Hub Helm Chart

## Introduction

This chart installs the Hub agent in a Kubernetes cluster.
The agent consists of two deployments: a controller and multiple authentication servers.

## Installation

### Prerequisites

1. [x] Helm **v3** [installed](https://helm.sh/docs/using_helm/#installing-helm): `helm version`

### Deploying Hub Ingres Controller for Kubernetes

```bash
helm install traefik-hub traefik/traefik-hub
```

You can customize the install with a `values` file. There are some [EXAMPLES](./EXAMPLES.md) provided.
Complete documentation on all parameters is in the [default file](./traefik-hub/values.yaml)

## Upgrading Hub Agent for Kubernetes

One can check what has changed in the [Releases](https://github.com/traefik/hub-helm-chart/releases).

```bash
# Update repository
helm repo update
# See current Chart & Traefik-Hub version
helm search repo traefik/traefik-hub
# Upgrade Traefik-Hub 
helm upgrade traefik-hub traefik/traefik-hub
```

### Upgrading CRDs

With Helm v3, CRDs created by this chart can not be updated, cf the [Helm Documentation on CRDs](https://helm.sh/docs/chart_best_practices/custom_resource_definitions). Please read carefully release notes of this chart before upgrading CRDs.

```bash
kubectl apply --server-side --force-conflicts -k https://github.com/traefik/traefik-hub-helm-chart/traefik-hub/crds/
```

## Uninstall

```bash
helm uninstall traefik-hub
```

If traefik-hub was installed in a specific namespace

```bash
helm uninstall traefik-hub --namespace my-namespace
```

## Contributing

### Versioning

We use [Semantic Versioning](https://semver.org/).

Pull requests must bump the `version` of the chart specified in [Chart.yaml](./Chart.yaml):
- The new version must be an alpha pre-release (e.g. 1.6.0-alpha.1)
- The new version must reflect the nature of the change, according to Semver specification.

A chart can be made available publicly by removing the pre-release suffix, this must be done on a separate PR by a maintainer.

Every version bump are published on the Helm Chart Registry.

The latest pre-release version of the Chart can be used by specifying `--devel` on the `install` and `upgrade` commands.

### Launch unit tests

```bash
make test
```
