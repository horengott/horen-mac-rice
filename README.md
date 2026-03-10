# Fedora macOS Rice: Horengott's Personalized Setup

Este es mi "rice" (configuración de escritorio personalizada) de macOS para Fedora Linux. Reclona mi setup exacto para obtener el aspecto visual y el flujo de trabajo de un Mac en cuestión de minutos.

## Captura de pantalla

![Mi Rice Mac en Fedora](example.jpg)

**Descripción:** Un escritorio de Fedora Linux transformado en un clon de macOS. Muestra un fondo de pantalla degradado, un panel superior con la barra de menú global y el reloj centrados, y un Dock inferior flotante con iconos redondeados. En el centro de la pantalla, la terminal muestra `fastfetch` con detalles del sistema. Los botones de las ventanas (cerrar, minimizar, maximizar) están a la izquierda y tienen el diseño de semáforo de Mac.

## Lista de Componentes Instalados

El script de instalación automatiza la instalación y configuración de los siguientes elementos:

* **Entorno de Escritorio:** GNOME (Fedora Workstation).
* **Tema Base (Tema GTK):** WhiteSur GTK (Tema oscuro).
* **Temas Adicionales:** Tema de Firefox (Safari-style), Tema de Ulauncher (Spotlight-style).
* **Paquetes de Iconos:** Paquete de iconos WhiteSur.
* **Tema de Cursor:** McMojave cursors.
* **Tipografías (Fuentes):** Fuentes oficiales de Apple San Francisco Pro (SF Pro).
* **Extensiones de GNOME:** User Themes (para aplicar el tema base al sistema) y Desktop Icons (Ding, para iconos en el escritorio).
* **Programas Base:** Ulauncher (buscador), GNOME Sushi (Quick Look para previsualización de archivos).
* **Utilidades de Terminal:** `fastfetch` (información del sistema), `btop` (monitor de recursos), `cmatrix` y `cowsay`.
* **Herramientas:** Git, Flatpak.
* **Fondos de Pantalla:** Paquete completo de fondos de pantalla WhiteSur.
* **Configuraciones de GNOME:** Posiciona automáticamente los botones de la ventana a la izquierda y les aplica el diseño de semáforo de Mac.

## Instrucciones de Instalación

Sigue estos pasos en tu terminal para replicar este setup en cualquier Fedora Linux.

1. **Clonar este repositorio:**
   ```bash
   git clone [https://github.com/tu-usuario/tu-repo.git](https://github.com/tu-usuario/tu-repo.git)