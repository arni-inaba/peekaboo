VERSION=$(shell cat VERSION)

DOCKER_TAG=arniinaba/peekaboo:$(VERSION)

.PHONY: build docker_tag

build:
	docker build . -t $(DOCKER_TAG)

push:
	docker push $(DOCKER_TAG)

docker_tag:
	@echo $(DOCKER_TAG)

deploy:
	sed "s/{{VERSION}}/$(VERSION)/g" peekaboo-tpl.yaml | kubectl apply -f -

peek:
	kubectl exec -it peekaboo /bin/bash
