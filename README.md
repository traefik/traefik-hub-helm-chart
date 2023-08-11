<a name="readme-top"></a>

<br/>

<div align="center" style="margin: 30px;">
<a href="https://hub.traefik.io/">
  <img src="https://doc.traefik.io/traefik-hub/assets/img/traefik-hub-logo.svg"   style="width:250px;" align="center" />
</a>
<br />
<br />

<div align="center">
    <a href="https://traefik.io/traefik-hub/"> Website</a> |
    <a href="https://hub.traefik.io">Log In</a> |
    <a href="https://doc.traefik.io/traefik-hub/">Documentation</a>
</div>
</div>

<br />

<div align="center"><strong>Traefik Hub Helm Chart</strong>

<br />
<br />
</div>

## Introduction

This chart installs the Traefik Hub agent in *Ingress Controller* mode on a Kubernetes cluster.

## Installation

### Prerequisites

1. [x] Helm **v3** [installed](https://helm.sh/docs/using_helm/#installing-helm): `helm version`

### Deploying Hub Ingres Controller for Kubernetes

```shell
kubectl create secret generic hub-agent-token --from-literal=token=XXXX

helm upgrade --install traefik-hub traefik/traefik-hub
```

You can customize the installation with a `values` file.  
Find the complete documentation on all parameters in the [default value file](./traefik-hub/values.yaml).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Upgrading Hub Agent for Kubernetes

One can check what has changed in the [release](https://github.com/traefik/traefik-hub-helm-chart/releases) overview page.

Update the repository:

```shell
helm repo update
```

Check the current Chart & Traefik Hub version:

```shell
helm search repo traefik/traefik-hub
```

Upgrade Traefik Hub:

```shell
helm upgrade traefik-hub traefik/traefik-hub
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Upgrading CRDs

With Helm v3, CRDs created by this chart can not be updated, consult the [Helm Documentation on CRDs](https://helm.sh/docs/chart_best_practices/custom_resource_definitions) for more information.

> Please read carefully the [release notes](https://github.com/traefik/traefik-hub-helm-chart/releases) of this chart before upgrading CRDs!

```shell
kubectl apply --server-side --force-conflicts -k https://github.com/traefik/traefik-hub-helm-chart/traefik-hub/crds/
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Upgrading from v1.x.x

To upgrade from v1.x.x, a secret needs to be manually removed first:

```shell
kubectl delete secret hub-agent-cert -n traefik-hub
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Uninstall

```shell
helm uninstall traefik-hub
```

If Traefik Hub was installed in a specific namespace:

```shell
helm uninstall traefik-hub --namespace my-namespace
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

### Versioning

We use [Semantic Versioning](https://semver.org/).

Pull requests must bump the `version` of the chart specified in the [Chart.yaml](./traefik-hub/Chart.yaml) file:

- The new version must be an alpha pre-release (e.g. 1.6.0-alpha.1)
- The new version must reflect the nature of the change, according to the SemVer specification

A chart can be made available publicly by removing the pre-release suffix, this must be done on a separate PR by a maintainer.

Every version bump is published on the Helm Chart Registry.

The latest pre-release version of the Chart can be used by specifying `--devel` on the `install` and `upgrade` commands.

### Launch unit tests

```shell
make test
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the Apache v2 License.
See [LICENSE](./LICENSE) for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>