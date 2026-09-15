## Spec
- CPU: AMD Ryzen 7 7700
- RAM: 32Gb DDR5 Dual-channel
- VGA: Asus Geforce RTX5060 8Gb
- Disabled iGPU
- Disabled Secureboot

## Fedora setup
After finish installing Fedora, follow this post-installation setup: https://github.com/wz790/Fedora-Noble-Setup

## Steam & other utilities
```bash
sudo dnf install -y steam mangohud gamemoderun
```

## Launch settings

```bash
SDL_VIDEO_DRIVER=wayland LD_PRELOAD="" gamemoderun mangohud %command% -fullscreen -novid -high -nojoy +fps_max 0 -console -sdlaudiodriver pipewire
```
