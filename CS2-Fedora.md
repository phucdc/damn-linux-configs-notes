## Setup
Follow this post-installation setup: https://github.com/wz790/Fedora-Noble-Setup

## MangoHUD
```bash
sudo dnf install -y mangohud
```

## Launch settings

```bash
SDL_VIDEO_DRIVER=wayland LD_PRELOAD="" gamemoderun mangohud %command% -fullscreen -novid -high -nojoy +fps_max 0 -console -sdlaudiodriver pipewire
```
