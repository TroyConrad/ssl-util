#!/bin/sh

# install.sh v1.0.0 03Nov2015

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root/sudo." 
   exit 1
fi

echo "Installing dependencies..."

perl -MCPAN -e 'install YAML::Tiny'

scriptName="ssl-util"
installPath="/opt/$scriptName"
binPath="/usr/local/bin/$scriptName"

echo "Installing $scriptName..."

rm -rf $installPath
mkdir -p $installPath
cp -r * $installPath
ln -fs $installPath/$scriptName $binPath
chmod ugo+rx $binPath

mkdir -p '/etc/ssl-util/'
touch '/etc/ssl-util/settings.yml'

mkdir -p '/etc/ssl_certificates'
chmod -R ugo+rw '/etc/ssl_certificates'

$binPath -V

echo "Installation complete. \n"



