#! /bin/bash
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
sudo apt-get update
mkdir ~/launchpad
cd ~/launchpad
curl https://git.launchpad.net/launchpad/plain/utilities/rocketfuel-setup > rocketfuel-setup
chmod a+x rocketfuel-setup
# specify a random non existing user to create a generic LXD image.
# we will do user-specific modifications in cloud-init of the dev profile
./rocketfuel-setup --assume-yes --lpusername lp-non-existing-user
pwd
ls -la
cd launchpad
# Allow connections from outside hosts to be able to access LP from host system
make LISTEN_ADDRESS='*' install
./utilities/launchpad-database-setup ubuntu
make schema

