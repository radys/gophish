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

#cd /tmp
#git clone https://github.com/gophish/gophish.git
#cd /tmp/gophish

# sed -i 's/f.SetAttr("action", "")/\/\/f.SetAttr("action", "")/' models/page.go
# /usr/local/go/bin/go build

#export GOROOT=/usr/local/go
#export GOPATH=$HOME/goProjects
#export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#go build

#docker build -t flabcz/gophish .
#rm -rf /tmp/gophish
