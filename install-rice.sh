#!/bin/bash

echo "=========================================="
echo "🍎 Empezando la transformación a macOS... 🍎"
echo "=========================================="

sudo dnf install -y ulauncher sushi gnome-tweaks git flatpak gnome-shell-extension-user-theme gnome-shell-extension-desktop-icons-ng cmatrix fastfetch cowsay btop

mkdir -p ~/Descargas/mac-rice
cd ~/Descargas/mac-rice

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -l
sudo flatpak override --filesystem=xdg-config/gtk-4.0
./tweaks.sh -F
cd ..

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh
cd ..

git clone https://github.com/vinceliuice/McMojave-cursors.git
cd McMojave-cursors
./install.sh
cd ..

git clone https://github.com/vinceliuice/WhiteSur-firefox-theme.git
cd WhiteSur-firefox-theme
./install.sh
cd ..

mkdir -p ~/.config/ulauncher/user-themes
git clone https://github.com/Raayib/WhiteSur-Dark-ulauncher.git ~/.config/ulauncher/user-themes/WhiteSur-Dark-ulauncher

git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git
mkdir -p ~/.local/share/fonts
cp -r San-Francisco-Pro-Fonts/*.otf ~/.local/share/fonts/
fc-cache -f -v

git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
cd WhiteSur-wallpapers
sudo ./install-wallpapers.sh
cd ..

gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Dark'
gsettings set org.gnome.desktop.wm.preferences theme 'WhiteSur-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'
gsettings set org.gnome.desktop.interface cursor-theme 'McMojave'
gsettings set org.gnome.desktop.interface font-name 'SF Pro Text Regular 10'
gsettings set org.gnome.desktop.interface document-font-name 'SF Pro Text Regular 10'

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable ding@rastersoft.com
gsettings set org.gnome.shell.extensions.user-theme name 'WhiteSur-Dark'

rm -rf ~/Descargas/mac-rice

echo "=========================================="
echo "✅ ¡Transformación completada con éxito! ✅"
echo "Por favor, cierra sesión y vuelve a entrar para ver todos los cambios."
echo "=========================================="