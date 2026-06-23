# Hyprland + Catppuccin Mocha — dotfiles para Void Linux

Inspirado en el stack de [lawrab/nixos-config](https://github.com/lawrab/nixos-config), pero traducido
a configs planas para Void (sin Nix). Mismo look (Catppuccin Mocha), mismas herramientas
(Hyprland, Waybar, Kitty, Mako, Hyprlock).

## Contenido

```
hypr/
  hyprland.conf    -> config principal: keybindings, autostart, theming
  hyprlock.conf    -> pantalla de bloqueo
  hypridle.conf    -> bloqueo/suspensión automática por inactividad
  hyprpaper.conf   -> wallpaper (editá la ruta a tu imagen)
waybar/
  config.jsonc     -> módulos de la barra (workspaces, reloj, audio, red, etc.)
  style.css        -> estilos Catppuccin Mocha
kitty/
  kitty.conf       -> config de la terminal
  catppuccin-mocha.conf -> paleta de colores
mako/
  config           -> notificaciones
install.sh         -> instala paquetes + copia todo a ~/.config
```

## Uso

```bash
chmod +x install.sh
./install.sh
```

El script:
1. Instala los paquetes necesarios con `xbps-install`.
2. Habilita los servicios `seatd`, `dbus` y `polkit` (runit).
3. Copia los configs a `~/.config/{hypr,waybar,kitty,mako}`.

Después, reiniciá sesión y desde la TTY corré:
```bash
Hyprland
```

## Personalización

- **Wallpaper**: poné tu imagen en `~/Pictures/wallpaper.jpg`, o editá la ruta
  en `~/.config/hypr/hyprpaper.conf`.
- **Teclado**: en `hyprland.conf`, la línea `kb_layout = latam` — cambiala si usás otro layout.
- **Colores**: todo el esquema Catppuccin Mocha está definido al inicio de `waybar/style.css`
  como variables `@define-color`, y en `kitty/catppuccin-mocha.conf`. Cambiar el accent color
  (lavender/mauve por defecto) es buscar y reemplazar esos hex en ambos archivos.
- **Oh My Zsh + Starship** (como en el repo original): no vienen empaquetados en Void,
  instalalos con sus instaladores oficiales:
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  curl -sS https://starship.rs/install.sh | sh
  ```

## Atajos de teclado por defecto

| Atajo | Acción |
|---|---|
| `Super + Enter` | Abrir terminal (kitty) |
| `Super + Q` | Cerrar ventana activa |
| `Super + D` | Launcher (wofi) |
| `Super + E` | Gestor de archivos (Thunar) |
| `Super + V` | Toggle flotante |
| `Super + F` | Pantalla completa |
| `Super + L` | Bloquear pantalla |
| `Super + 1-0` | Cambiar de workspace |
| `Super + Shift + 1-5` | Mover ventana a workspace |
| `Print` | Captura de área (grim+slurp+swappy) |
