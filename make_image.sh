#!/bin/bash

docker build . -t okamumu/vscode-base || exit 1
docker push okamumu/vscode-base
