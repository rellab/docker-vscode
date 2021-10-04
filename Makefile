# Makefile

IMAGE=rel/vscode

build: build-cuda11

build-cuda11: Dockerfile-cuda11
	docker build -t ${IMAGE}:cuda11 -f Dockerfile-cuda11 .

clean:
	docker images | grep ${IMAGE} | awk '{print $$3}' | xargs docker rmi

