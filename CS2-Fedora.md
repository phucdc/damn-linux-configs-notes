## Spec
- OS: Fedora 44 KDE Plasma Desktop Edition
- CPU: AMD Ryzen 7 7700
- RAM: 32Gb DDR5 (4800Mhz since EXPO disabled)
- VGA: Geforce RTX 5060
- BIOS Settings:
  - Disabled iGPU
  - Disabled Secureboot
  - Disabled EXPO

## Fedora setup
After finish installing Fedora, follow this post-installation setup: https://github.com/wz790/Fedora-Noble-Setup

## Steam & other utilities
```bash
sudo dnf install -y steam mangohud gamemoderun
```

Manual run `steam` on Terminal to see if there's some problem.

## GE-Proton
Don't know what is Proton and why GE-Proton? Read this sh*t:

<img width="739" height="206" alt="image" src="https://github.com/user-attachments/assets/39371565-6448-40b0-acb8-e530152d87cb" />

Step-by-step:
- Install [ProtonUp-Qt](https://davidotek.github.io/protonup-qt/) via Flathub or Appimage
- Select "Add version"
- In "Compatibility tool", select "GE-Proton"
- In "Version", select the latest version and hit "Install"
- Restart Steam
- Steam > Settings > Compatibility
- In "Default Compatibility tool", select `GE-Protonxx-y-zzzzz`
- When asked, hit "Restart"

## (Optional) Disable Shader Pre-caching
This is to prevent the "Vulkan loading... whatever fuck" when start the game. In Steam, select Steam > Settings > Download. Uncheck "Enable Shader Pre-caching (xxx MB pre-cached)".

<img width="636" height="195" alt="image" src="https://github.com/user-attachments/assets/e00c328c-35a0-47d5-b385-9ceca8cfd885" />

## Launch settings

```bash
SDL_VIDEODRIVER=wayland LD_PRELOAD="" gamemoderun mangohud %command% -fullscreen -novid -high -nojoy +fps_max 0 -console -sdlaudiodriver pipewire
```
