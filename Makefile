# Copyright 2020 Keyporttech Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

REGISTRY=registry.keyporttech.com:30243
DOCKERHUB_REGISTRY="keyporttech"
CHART=dynamodb
VERSION = $(shell yq r Chart.yaml 'version')
REGISTRY_TAG=${REGISTRY}/${CHART}:${VERSION}

SSH_PRIVATE_KEY := $(shell cat ~/.ssh/id_bot )

lint:
	@echo "linting..."
	helm lint
	helm template test ./
.PHONY: lint

test:
	@echo "testing..."
	helm test
	@echo "OK"
.PHONY: test

build: lint

.PHONY: build

run-github-actions-local:

	docker run -it -v $$home/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/workdir -w /workdir -e CR_TOKEN="$$GITHUB_TOKEN" registry.keyporttech.com:30243/github-actions:0.1.0 act -s CR_TOKEN=$$GITHUB_TOKEN -s SSH_PRIVATE_KEY="$(SSH_PRIVATE_KEY)" -P ubuntu-latest=nektos/act-environments-ubuntu:18.04
.PHONY: run-github-actions-local

publish-registry:
	REGISTRY_TAG=${REGISTRY}/${CHART}:${VERSION}
	@echo "publishing to ${REGISTRY_TAG}"
	HELM_EXPERIMENTAL_OCI=1 helm chart save ./ ${REGISTRY_TAG}
	# helm chart export  ${REGISTRY_TAG}
	HELM_EXPERIMENTAL_OCI=1 helm chart push ${REGISTRY_TAG}
	@echo "OK"
.PHONY: publish-local-registry

deploy: publish-local-registry

.PHONY: build
