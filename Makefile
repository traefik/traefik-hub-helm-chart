# Used for Helm Chart
IMAGE_HELM_UNITTEST=docker.io/helmunittest/helm-unittest:3.12.0-0.3.3
IMAGE_CHART_TESTING=quay.io/helmpack/chart-testing:v3.8.0

traefik-hub/tests/__snapshot__:
	@mkdir traefik-hub/tests/__snapshot__

test: traefik-hub/tests/__snapshot__
	docker run ${DOCKER_ARGS} --entrypoint /bin/sh --rm -v $(CURDIR):/charts -w /charts $(IMAGE_HELM_UNITTEST) /charts/hack/test.sh

lint:
	docker run ${DOCKER_ARGS} --env GIT_SAFE_DIR="true" --entrypoint /bin/sh --rm -v $(CURDIR):/charts -w /charts $(IMAGE_CHART_TESTING) /charts/hack/lint.sh

