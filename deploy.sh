#!/bin/bash
commit=$(git rev-parse --short HEAD)
message=$(git log --format=%B -n 1 $commit)

cd _site
git add .
git commit -m "[$commit] $message"
git push -u origin gh-pages