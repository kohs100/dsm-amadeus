#!/bin/sh

# Make sure only root can run our script
if (( $EUID != 0 )); then
    echo "This script must be run as root"
    exit
fi

cd /usr/syno/synoman/webman/resources/css

mv desktop-business.css.bak desktop-business.css
gzip < desktop-business.css > desktop-business.css.gz

rm -rf ./custom

echo "Done."