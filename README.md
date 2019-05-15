# docker-vscode-base

## example

docker run --rm -it \
  -h c9host \
  -p 8181:8181 \
  -e C9USER=c9user \
  -e C9UID=1000 \
  -e C9PASSWORD=c9password \
  -e C9HOME=/home/c9user \
  -e C9GROUP=c9user \
  -e C9GID=1000 \
  -t cs

```
http://c9host:8181
```
with password c9password
