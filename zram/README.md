# ZRAM config

> Cautions: you must turn off/remove old swaps, to know if any swaps already enabled: `swapon -s`

### Setup:

```
# mkdir -p /opt/zram-config
# cp zram_init.sh /opt/zram-config/zram_init.sh
# chmod +x /opt/zram-config/zram_init.sh
# cp zram-swap.service /etc/systemd/system/zram-swap.service
```

