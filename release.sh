#!/bin/bash

test -f ./banshee || abort "binary not found"
mkdir -p release
cp ./banshee release/
cp -r ./static/dist release/ || true
version=$(./banshee -v)
os=$(uname | awk '{print tolower($0)}')
arch=$(go env GOARCH)
filename=$(printf "banshee%s.%s-%s.tar.gz" ${version} ${os} ${arch})
tar cvzf ${filename} release
rm -rf release
du -h ${filename}