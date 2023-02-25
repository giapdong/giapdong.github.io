#!/bin/bash
# This file is command line for install jekyll via WSL
# Jekyll installation: https://jekyllrb.com/docs/installation/windows/
# WSL manual installation: https://learn.microsoft.com/en-us/windows/wsl/install-manual

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.5 ruby2.5-dev build-essential dh-autoreconf

gem update

# gem install jekyll bundler
# Because versioning issue, we need install manual some packages before
gem install public_suffix -v 4.0.7
gem install google-protobuf --version=3.2.0.2 --platform=ruby
gem install bundler -v 2.3.26
gem install jekyll -v 3.9.2


# Test result
jekyll -v