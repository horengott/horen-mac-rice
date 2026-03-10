#!/bin/bash

echo "=========================================="
echo "🍎 Empezando la transformación a macOS (Fedora 43)... 🍎"
echo "=========================================="

rm -rf ~/Descargas/mac-rice
mkdir -p ~/Descargas/mac-rice

echo "📦 Preparando repositorios de Flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "📦 Instalando herramientas base y utilidades..."
sudo dnf install -y git flatpak gnome-tweaks gnome-extensions-app gnome-shell-extension-user-theme ulauncher sushi cmatrix fastfetch cowsay btop --skip-broken

echo "📦 Instalando Gestor de Extensiones..."
flatpak install -y flathub com.mattjakeman.ExtensionManager

cd ~/Descargas/mac-rice

echo "🎨 Instalando temas e iconos..."
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

echo "🔍 Instalando tema de Ulauncher..."
mkdir -p ~/.config/ulauncher/user-themes
git clone https://github.com/Raayib/WhiteSur-Dark-ulauncher.git ~/.config/ulauncher/user-themes/WhiteSur-Dark-ulauncher

echo "🔤 Instalando tipografías..."
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git
mkdir -p ~/.local/share/fonts
cp -r San-Francisco-Pro-Fonts/*.otf ~/.local/share/fonts/
fc-cache -f -v

echo "🌄 Instalando fondos de pantalla..."
git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
cd WhiteSur-wallpapers
sudo ./install-wallpapers.sh
cd ..

echo "⚙️ Aplicando cambios de GNOME..."
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Dark'
gsettings set org.gnome.desktop.wm.preferences theme 'WhiteSur-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'
gsettings set org.gnome.desktop.interface cursor-theme 'McMojave'
gsettings set org.gnome.desktop.interface font-name 'SF Pro Text Regular 10'
gsettings set org.gnome.desktop.interface document-font-name 'SF Pro Text Regular 10'

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name 'WhiteSur-Dark'

rm -rf ~/Descargas/mac-rice

echo "=========================================="
echo "✅ ¡Transformación completada con éxito! ✅"
echo "⚠️ ATENCIÓN: Cierra sesión y vuelve a entrar para ver los cambios del panel y cursor."
echo "=========================================="