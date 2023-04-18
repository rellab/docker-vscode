# Makefile

IMAGE=rel/vscode

build-cuda11: Dockerfile-cuda11
	docker build -t ${IMAGE}:cuda11 -f Dockerfile-cuda11 .

build-cuda10: Dockerfile-cuda10
	docker build -t ${IMAGE}:cuda10 -f Dockerfile-cuda10 .

clean:
	docker images | grep ${IMAGE} | awk '{print $$3}' | xargs docker rmi

