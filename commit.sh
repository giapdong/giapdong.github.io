#!/bin/bash

# Commit to master
git add .
git commit -m "$1"
git push

# Trigger deploy process
bash deploy.sh