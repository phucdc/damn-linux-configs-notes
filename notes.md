# Notes

## Set up Wifi with NetworkManager and iwd

```console
sudo pacman -S networkmanager iwd
```

```conf
# /etc/NetworkManager/conf.d/wifi_backend.conf
[device]
wifi.backend=iwd
```

## No suspend when closing the lid

```conf
# /etc/systemd/logind.conf
[Login]
...
HandleLidSwitch=ignore
```

## Fix GNOME open folders in VSCode instead of File Manager

```conf
# ~/.config/mimeapps.list
[Default Applications]
...
inode/directory=org.gnome.Nautilus.desktop
```

## Bluetooth config to connect multiple devices:

```conf
# /etc/bluetooth/main.conf
...
MultipleProfile = multiple
...
```

## Reflector every time network is On

```conf 
# /etc/systemd/system/reflector.service

[Unit]
Description=Pacman mirrorlist update
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/bin/reflector --country VN,SG --age 12 --protocol http,https --sort rate -n 5 --save /etc/pacman.d/mirrorlist

[Install]
WantedBy=multi-user.target
```

## My zsh-syntax-highlighting color config

```bash
ZSH_HIGHLIGHT_STYLES[path]=fg=magenta
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
```

## Boost up DNF Fedora speed

Add this to `/etc/dnf/dnf.conf`:

```conf
[main]
fastestmirror=True
max_parallel_downloads=10
gpgcheck=True
installonly_limit=3
clean_requirements_on_remove=True
best=False
skip_if_unavailable=True
```

## GNOME blank screen after lockscreen

> Fuck this shit GNOME, my everything stops when lockscreen, thanks to "the greatest mechanism ever lived", fuck you GNOME

Just download and enable [this awesome extension](https://extensions.gnome.org/extension/1414/unblank/)

## Fucking annoying "Remote Desktop" pop up in GNOME

> Once again, fuck you GNOME

```bash
gsettings set org.gnome.mutter.wayland xwayland-disable-extension  '["Xtest"]'
```

Logout and login back, problem goes away
