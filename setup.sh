#!/bin/bash

set -e  # Stop on error

# Optional: Debug-Ausgaben
echo "Starte Installation von Oh My Bash..."

# Installiere Oh My Bash als root
export OSH="/root/.oh-my-bash"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" || {
  echo "Fehler bei der Installation von Oh My Bash"
  exit 1
}

echo "Oh My Bash installiert."

# Theme-Datei kopieren
echo "Kopiere benutzerdefinierte Theme-Datei..."

THEME_SOURCE="$(dirname "$0")/custom/font.theme.sh"
THEME_TARGET="/root/.oh-my-bash/themes/font/font.theme.sh"

mkdir -p "$(dirname "$THEME_TARGET")"
cp "$THEME_SOURCE" "$THEME_TARGET"

echo "Theme-Datei erfolgreich kopiert."

# Optional: Theme in .bashrc aktivieren
if ! grep -q 'OSH_THEME="font"' /root/.bashrc; then
  echo 'OSH_THEME="font"' >> /root/.bashrc
  echo "Theme 'font' in /root/.bashrc gesetzt."
fi

echo "Setup abgeschlossen."
