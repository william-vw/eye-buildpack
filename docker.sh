#!/bin/bash

tarball=$(curl -s -L https://api.github.com/repos/eyereasoner/eye/releases/latest | sed -nr 's/"tarball_url": "(.*)",/\1/p')
name=$(echo $tarball | sed -nr 's/https:\/\/.*v(.*)/\1/p')
echo "downloading $tarball"
curl -s -L $tarball > $name.zip
tar -xzf $name.zip
cd eyereasoner*
sed -r 's/prefix=(\/opt\/eye)/prefix=opt\/eye/' install.sh > install2.sh
chmod +x install2.sh
echo "installing $name"
./install2.sh