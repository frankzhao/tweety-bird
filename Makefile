
ROOT	:= $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
TAG 	:= frankzhao/birdtest
NAME	:= birdtest

.PHONY: all build

all: build

build:
	@docker build -t $(TAG) $(ROOT)
	@docker run -it -d --name $(NAME) $(TAG)

push/$(VERSION):
	@docker tag -f $(REPOSITORY):latest $(REPOSITORY):$(VERSION)
	@docker push $(REPOSITORY):$(VERSION)

push/latest:
	@docker push $(REPOSITORY):latest

push: | push/latest push/$(VERSION)

clean:
	@docker rm @(NAME)
	@docker rmi -f $(TAG)
