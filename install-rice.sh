#!/bin/bash

echo "=========================================="
echo "🍎 Empezando la transformación a macOS (Fedora 43)... 🍎"
echo "=========================================="

rm -rf ~/Descargas/mac-rice
mkdir -p ~/Descargas/mac-rice

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf install -y git flatpak gnome-tweaks gnome-extensions-app gnome-shell-extension-user-theme gnome-shell-extension-just-perfection ulauncher sushi cmatrix fastfetch cowsay btop --skip-broken

flatpak install -y flathub com.mattjakeman.ExtensionManager

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

mkdir -p ~/.local/share/backgrounds
curl -L -o ~/.local/share/backgrounds/mac-wallpaper-light.jpg "https://raw.githubusercontent.com/vinceliuice/WhiteSur-wallpapers/master/1080p/Monterey/Monterey-1.jpg"
curl -L -o ~/.local/share/backgrounds/mac-wallpaper-dark.jpg "https://raw.githubusercontent.com/vinceliuice/WhiteSur-wallpapers/master/1080p/Monterey/Monterey-2.jpg"

gsettings set org.gnome.shell disable-user-extensions false
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable just-perfection-desktop@just-perfection

gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Dark'
gsettings set org.gnome.desktop.wm.preferences theme 'WhiteSur-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'
gsettings set org.gnome.desktop.interface cursor-theme 'McMojave'
gsettings set org.gnome.desktop.interface font-name 'SF Pro Text Regular 10'
gsettings set org.gnome.desktop.interface document-font-name 'SF Pro Text Regular 10'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.shell.extensions.user-theme name 'WhiteSur-Dark'

gsettings set org.gnome.desktop.background picture-uri "file://$HOME/.local/share/backgrounds/mac-wallpaper-light.jpg"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/.local/share/backgrounds/mac-wallpaper-dark.jpg"

gsettings set org.gnome.shell.extensions.just-perfection clock-menu-position 2

rm -rf ~/Descargas/mac-rice

echo "=========================================="
echo "✅ ¡Transformación completada con éxito! ✅"
echo "⚠️ OBLIGATORIO: Cierra la sesión y vuelve a entrar para cargar la barra superior."
echo "=========================================="