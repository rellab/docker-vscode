# docker-vscode-base

## example

docker run --rm -it \
  -h hostname \
  -p 8181:8181 \
  -e CODE_USER=codeuser \
  -e CODE_UID=1000 \
  -e CODE_PASSWORD=password \
  -e CODE_HOME=/home/codeuser \
  -e CODE_GROUP=codeuser \
  -e CODE_GID=1000 \
  -t okamumu/vscode-base

```
http://hostname:8181
```
with password `password`
