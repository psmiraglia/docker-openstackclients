DOCKER_IMAGE="psmiraglia/openstackclients"

build:
	docker build --tag $(DOCKER_IMAGE) .

run: build
	docker run --rm -ti --env-file openstack.env $(DOCKER_IMAGE) /usr/local/bin/openstack

run-insecure: build
	docker run --rm -ti --env-file openstack.env $(DOCKER_IMAGE) /usr/local/bin/openstack --insecure
