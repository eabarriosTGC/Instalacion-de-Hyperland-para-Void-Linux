#!/bin/sh
# install.sh - instala dependencias y aplica los dotfiles de Hyprland (Catppuccin Mocha) en Void Linux
set -e

echo "==> Instalando paquetes con xbps (te va a pedir tu password de sudo)..."
sudo xbps-install -Su
sudo xbps-install hyprland hyprland-protocols xdg-desktop-portal-hyprland xdg-desktop-portal \
  xorg-server-xwayland wayland wayland-protocols polkit pipewire wireplumber \
  qt5-wayland qt6-wayland \
  hyprlock hypridle hyprpaper \
  waybar kitty zsh wofi mako thunar \
  grim slurp swappy pamixer brightnessctl \
  font-jetbrains-mono-nerd seatd dbus

echo "==> Habilitando servicios (seatd, dbus, polkit)..."
[ -e /var/service/seatd ] || sudo ln -s /etc/sv/seatd /var/service/
[ -e /var/service/dbus ] || sudo ln -s /etc/sv/dbus /var/service/
[ -e /var/service/polkit ] || sudo ln -s /etc/sv/polkit /var/service/
sudo usermod -aG _seatd "$(whoami)"

echo "==> Copiando dotfiles a ~/.config ..."
mkdir -p "$HOME/.config/hypr" "$HOME/.config/waybar" "$HOME/.config/kitty" "$HOME/.config/mako"

DIR="$(cd "$(dirname "$0")" && pwd)"

cp -r "$DIR/hypr/." "$HOME/.config/hypr/"
cp -r "$DIR/waybar/." "$HOME/.config/waybar/"
cp -r "$DIR/kitty/." "$HOME/.config/kitty/"
cp -r "$DIR/mako/." "$HOME/.config/mako/"

mkdir -p "$HOME/Pictures"
echo "==> Recordá poner un wallpaper en ~/Pictures/wallpaper.jpg (o editar hyprpaper.conf con tu ruta)."

echo ""
echo "Listo. Reiniciá la sesión (o la PC) para que el grupo _seatd y dbus tomen efecto."
echo "Después, desde la TTY, ejecutá: Hyprland"
