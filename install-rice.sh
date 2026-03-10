#!/bin/bash

echo "=========================================="
echo "🍎 Empezando la transformación a macOS... 🍎"
echo "=========================================="

# 1. Habilitar repositorios extra (Ulauncher y Flathub)
echo "📦 Preparando repositorios..."
sudo dnf install -y dnf-plugins-core
sudo dnf copr enable -y agriffis/ulauncher
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 2. Instalar programas y dependencias
echo "📦 Instalando herramientas base..."
sudo dnf install -y git flatpak gnome-tweaks gnome-extensions-app gnome-shell-extension-user-theme
echo "📦 Instalando utilidades..."
sudo dnf install -y ulauncher sushi cmatrix fastfetch cowsay btop
echo "📦 Instalando Gestor de Extensiones..."
flatpak install -y flathub com.mattjakeman.ExtensionManager

# 3. Crear carpeta de descargas
mkdir -p ~/Descargas/mac-rice
cd ~/Descargas/mac-rice

# 4. Descargar e instalar los temas visuales
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