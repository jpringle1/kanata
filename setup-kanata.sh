#!/bin/bash

mkdir -p ~/.local/share/bin
cp kanata ~/.local/share/bin/
chmod u+x ~/.local/share/bin/kanata



# 1
sudo groupadd uinput

# 2
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER

# 3
echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/99-input.rules > /dev/null

# 4
sudo udevadm control --reload && udevadm trigger --verbose --sysname-match=uniput

# 5
sudo modprobe uinput

mkdir -p ~/.config/systemd/user/
sudo cp ./kanata.service ~/.config/systemd/user/

systemctl --user enable kanata.service
systemctl --user start kanata.service

