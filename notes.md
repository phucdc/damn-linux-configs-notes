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
