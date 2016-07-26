#!/bin/bash

# compile docker registry binary

current_folder=$(pwd)

# clean up go folder
rm -fr $GOPATH/src/github.com/docker

# Checkout the Docker Distribution source tree
mkdir -p $GOPATH/src/github.com/docker
git clone https://github.com/docker/distribution.git $GOPATH/src/github.com/docker/distribution
cd $GOPATH/src/github.com/docker/distribution

# build
GOPATH=$(PWD)/Godeps/_workspace:$GOPATH make binaries

cd $current_folder
cp -f $GOPATH/src/github.com/docker/distribution/bin/registry ../docker_registry

# clean up go folder
rm -fr $GOPATH/src/github.com/docker