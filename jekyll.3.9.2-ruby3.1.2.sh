#!/bin/bash
# This file is command line for install jekyll via WSL
# Jekyll installation: https://jekyllrb.com/docs/installation/windows/
# WSL manual installation: https://learn.microsoft.com/en-us/windows/wsl/install-manual
# Based on ruby latest version (3.2 when this script write), https://gorails.com/setup/windows/10
# Format file LF for ignore some error when run inside WSL
# sudo su before run all command

sudo apt-get update -y && sudo apt-get upgrade -y


# Cleanup enviroment
sudo apt-get remove ruby2.5 ruby2.5-dev ruby2.6 ruby2.6-dev -y
sudo apt autoremove -y


# Install Ruby dependencies
sudo apt-get install -y \
	git-core \
	curl \
	zlib1g-dev \
	build-essential \
	libssl-dev \
	libreadline-dev \
	libyaml-dev \
	libsqlite3-dev \
	sqlite3 \
	libxml2-dev \
	libxslt1-dev \
	libcurl4-openssl-dev \
	software-properties-common \
	libffi-dev


# Prepare rbenv and ruby-build
if grep -Fxq 'export PATH="$HOME/.rbenv/bin:$PATH"' ~/.bashrc
then
	echo "rbenv already";
else
	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	exec $SHELL # refresh /bin/bash process
fi

if grep -Fxq 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' ~/.bashrc
then
	echo "ruby-build already";
else
	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
	exec $SHELL # refresh /bin/bash process
fi


# Install Ruby, can change other version only by run two line command below
rbenv install 3.1.2
rbenv global 3.1.2


# Install jekyll and dependencies
gem install bundler jekyll
bundle add webrick
bundle install


# Test result
jekyll -v


echo "Install jekyll process is done";