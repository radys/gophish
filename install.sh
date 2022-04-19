#!/bin/ash 

apk update
apk add wget git grep
apk add gcc musl-dev 

go_version="$(wget -qO- https://golang.org/dl/ | grep -oP 'go([0-9\.]+linux-amd64.tar.gz)' | head -n 1)"
echo $go_version

# https://golang.org/dl/
cd /tmp/
wget https://dl.google.com/go/$go_version
tar xvfz $go_version
mv go /usr/local/go
rm $go_version

export GOROOT=/usr/local/go
export GOPATH=$HOME/goProjects
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

cd /tmp
git clone https://github.com/gophish/gophish.git
cd /tmp/gophish
sed -i 's/f.SetAttr("action", "")/\/\/f.SetAttr("action", "")/' models/page.go
#### FROM golang:1.16 AS build-golang
#sed -i 's/golang:1.11/golang:1.16/' Dockerfile
# /usr/local/go/bin/go
go build

#docker build -t flabcz/gophish .
#rm -rf /tmp/gophish
