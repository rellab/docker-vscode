.PHONY: all build push

all: build push

build:
	docker build . -t okamumu/vscode-base

push:
	docker push okamumu/vscode-base

clean:
	docker rmi okamumu/vscode-base

testrun:
	docker run --rm -it -h hostname -p 8181:8181 -e CODE_USER=codeuser -e CODE_UID=1000 -e CODE_PASSWORD=password -e CODE_HOME=/home/codeuser -e CODE_GROUP=codeuser -e CODE_GID=1000 -t okamumu/vscode-base

testlogin:
	docker run --rm -it -h hostname -p 8181:8181 -e CODE_USER=codeuser -e CODE_UID=1000 -e CODE_PASSWORD=password -e CODE_HOME=/home/codeuser -e CODE_GROUP=codeuser -e CODE_GID=1000 -t okamumu/vscode-base /bin/bash
