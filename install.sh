#!/bin/sh

# Make sure only root can run our script
if (( $EUID != 0 )); then
    echo "This script must be run as root"
    exit
fi

cd /usr/syno/synoman/webman/resources/css

echo "Creating Backup"
cp desktop-business.css desktop-business.css.bak

echo "Downloading resource files"
wget -q -O desktop-business.css 'https://github.com/kohs100/dsm-amadeus/raw/main/desktop-business.css'

mkdir custom && cd custom
wget -q 'https://github.com/kohs100/dsm-amadeus/raw/main/custom/TakaoMincho_ascii.ttf'
wget -q 'https://github.com/kohs100/dsm-amadeus/raw/main/custom/customstyle.css'
wget -q 'https://github.com/kohs100/dsm-amadeus/raw/main/custom/login-button.png'
wget -q 'https://github.com/kohs100/dsm-amadeus/raw/main/custom/logo.png'
cd ..

gzip < desktop-business.css > desktop-business.css.gz

echo "Done. Please set DSM theme background to amadeus-background.png from DSM control panel."