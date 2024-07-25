# Arch Linux Install

> Run in UEFI system with Btrfs for file systems

## Partitioning

My file systems:

- `/dev/nvme1n1p1` for EFI partition, have Windows inside
- `/dev/nvme0n1p2` for root, will be in subvol `@root`
- `/dev/nvme0n1p3` for /tmp, will be in subvol `@tmp`

Create & sizing partitions with `cfdisk`, a disk utility with nice UI for user

Create BTRFS filesystems:

```bash
mkfs.btrfs -f /dev/nvme0n1p2
mkfs.btrfs -f /dev/nvme0n1p3
```

Mount & create subvols:

```bash
mount /dev/nvme0n1p2 /mnt
btrfs subvolume create /mnt/@root
umount /mnt
```

```bash
mount /dev/nvme0n1p3 /mnt
btrfs subvolume create /mnt/@tmp
umount /mnt
```

Mount subvols:

```bash
mount -o subvol=@root /dev/nvme0n1p2 /mnt
mkdir /mnt/tmp
mount -o subvol=@tmp /dev/nvme0n1p3 /mnt/tmp
```

Mount EFI partition:

```bash
mkdir /mnt/boot/efi
mount /dev/nvme1n1p1 /mnt/boot/efi 
```

## Pacstrap

Install the base packages for new Linux system:

```bash
pacstrap -K /mnt base base-devel linux linux-firmware vim sudo curl wget
```

> Get the fastest mirrors for faster downloading with `reflector`

## Fstab

Generate fstab for new system:

```bash
genfstab -U /mnt >> /mnt/etc/fstab 
```

## Chroot

Now we change root to new system:

```bash
arch-chroot /mnt 
```

## Set up the timezone & sync with hardware

```bash
ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc
```

## Set up language and keymap

Use any kind of text editor to open `/etc/locale.gen` and uncomment the entry for your locale, in my case is `en_US.UTF-8 UTF-8`

Generate locale:

```bash 
locale-gen
```

Open `/etc/locale.conf` in text editor, add these line to it and save:

```conf 
LANG=en_US.UTF-8
```

## Set up hosts and hostname

Open 2 files bellow, and set hosts as bellow:

```text
# /etc/hostname

phucduong-arch
```

```text
# /etc/hosts

127.0.0.1   localhost
::1         localhost
127.0.1.1   phucduong-arch
```

## Set up users

Create a new user and set password for it:

```bash 
useradd -mG wheel phucdc 
passwd 
```

Allow `wheel` group to run command as root with `EDITOR=vim visudo`, uncomment this line:

```text
%wheel ALL=(ALL:ALL) ALL
```

## Grub configuration

Install some requirements

```bash 
pacman -Syu --noconfirm --needed grub efibootmgr os-prober
```

Enable `os-prober` in `/etc/default/grub` and add this line:

```text 
GRUB_DISABLE_OS_PROBER="false"
```

Install Grub to `/boot/efi`:

```bash 
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader=arch-linux
```

Generate grub configuration:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

## Final set up

Enable NetworkManager:

```bash
pacman -S networkmanager
systemctl enable NetworkManager 
```

For desktop set up (Optional):

- First, we need a Display server and GTK:

    ```bash
    pacman -S xorg xorg-server gtk4
    ```

- For GNOME:

    ```bash
    pacman -S gnome gdm
    systemctl enable gdm
    ```

- For KDE Plasma:

    ```bash 
    pacman -S plasma plasma-wayland-session kde-applications
    systemctl enable sddm
    ```

- For XFCE:

    ```bash 
    pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
    systemctl enable lightdm 
    ```

Now, we can exit and reboot

```bash
exit

umount -R /mnt/tmp
umount -R /mnt/boot/efi 
umount -R /mnt

reboot
```

Enjoy!

