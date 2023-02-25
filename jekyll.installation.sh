#!/bin/bash
# This file is command line for install jekyll via WSL
# Jekyll installation: https://jekyllrb.com/docs/installation/windows/
# WSL manual installation: https://learn.microsoft.com/en-us/windows/wsl/install-manual

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.6 ruby2.6-dev build-essential dh-autoreconf

gem update

gem install jekyll bundler

# Test result
jekyll -v