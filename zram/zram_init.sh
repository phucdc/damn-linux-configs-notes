#!/bin/bash
modprobe zram
zramctl /dev/zram0 --algorithm zstd --size $(($(grep MemTotal /proc/meminfo | tr -dc '0-9')/2))KiB
mkswap -U clear /dev/zram0
swapon --priority 100 /dev/zram0
