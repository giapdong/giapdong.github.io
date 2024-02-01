#!/bin/bash
cd _site
git add .
git commit -m "Sync site"
git push -u origin gh-pages