#!/bin/bash
useradd $1
(echo $1:$2) | chpasswd
(echo $2; echo $2) | smbpasswd -as $1
mkdir /home/$1
chmod -R 777 /home/$1

echo "${1} = \"${1}\"" >> /etc/samba/smbusers
