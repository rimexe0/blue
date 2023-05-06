#!/bin/bash
wget https://github.com/hwsmm/OpenTabletDriver.Packaging/releases/download/test/OpenTabletDriver.rpm
rpm-ostree install OpenTabletDriver.rpm -y

systemctl --user daemon-reload
systemctl --user enable opentabletdriver --now
echo "blacklist wacom" | sudo tee -a /etc/modprobe.d/blacklist.conf
sudo rmmod wacom
