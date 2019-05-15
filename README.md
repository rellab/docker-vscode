docker run --rm -it \
  -h c9host \
  -p 80:80 \
  -p 8181:8181 \
  -e PM2PORT=80 \
  -e PM2PASSWORD=pm2 \
  -e CSUSER=c9user \
  -e CSUID=1000 \
  -e CSPASSWORD=c9user \
  -e CSHOME=/home/c9user \
  -e CSGROUP=c9user \
  -e CSGID=1000 \
  -t cs
# docker-vscode-base
