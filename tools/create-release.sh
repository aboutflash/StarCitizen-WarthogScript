#!/bin/bash

screlease="3.7.1"

version=$(git describe --abbrev=0 --tags)
outfile=$PWD/warthog-script-v$version-sc$screlease.zip

echo
echo "creating $outfile ..."
echo

cd ..
git archive -o "$outfile" HEAD ./sc-settings/ ./script/ ./README.md

read -p "Press any key to continue... " -n1 -s