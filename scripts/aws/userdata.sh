#!/bin/bash
dd if=/dev/zero of=/swapfile bs=1024 count=4096000
chmod 0600 /swapfile
mkswap /swapfile
swapon /swapfile
sudo sed -i '$a/swapfile   none    swap    sw    0   0' /etc/fstab