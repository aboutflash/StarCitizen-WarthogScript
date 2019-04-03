#!/bin/bash

screlease="3.5.0m"

version=$(git describe --abbrev=0 --tags)
outfile=$PWD/warthog-script-v$version-sc$screlease.zip

echo
echo "creating $outfile ..."
echo

cd ..
git archive -o "$outfile" HEAD ./sc-settings/ ./script/

read -p "Press any key to continue... " -n1 -s