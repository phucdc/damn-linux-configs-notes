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
