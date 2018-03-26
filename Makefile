.PHONY: default build run push clean

REPO_URL             := dockerhub.vilanet.fr
DOCKER_LOGIN         := kriss
DOCKER_IMG_NAME      := cloudbox
DOCKER_IMG_VERSION   := 1.0
DOCKER_IMG_FULL_NAME := $(REPO_URL)/$(DOCKER_LOGIN)/$(DOCKER_IMG_NAME):$(DOCKER_IMG_VERSION)
PTY_PREFIX           ?=

default: build

build:
	docker build -t "$(DOCKER_IMG_FULL_NAME)" .

run:
	${PTY_PREFIX} docker run -it --name "$(DOCKER_IMG_NAME)" --rm --mount type=bind,source=/c/Work,target=/mnt/work "$(DOCKER_IMG_FULL_NAME)"

push:
	docker push "$(DOCKER_IMG_FULL_NAME)"

clean:
	docker rmi "$(DOCKER_IMG_FULL_NAME)"
