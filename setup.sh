#!/bin/bash
set -e

# 1. oh-my-bash installieren
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# 2. Custom Theme Ordner anlegen, falls nicht vorhanden
THEME_DIR="/root/.oh-my-bash/themes/font"
mkdir -p "$THEME_DIR"

# 3. Custom Theme downloaden (oder alternativ vom Repo klonen/kopieren)
curl -fsSL https://raw.githubusercontent.com/myt960/ohmybash/main/font.theme.sh -o "$THEME_DIR/font.theme.sh"

# 4. Theme in der .bashrc setzen
# Ersetze ggf. .bashrc durch .bash_profile oder .bash_aliases, je nach Setup

BASHRC="/root/.bashrc"

# Backup der .bashrc
cp "$BASHRC" "${BASHRC}.bak"

# Theme in der .bashrc setzen
# Sucht nach einer Zeile mit "OSH_THEME=" und ersetzt sie, oder fügt sie hinzu, falls nicht vorhanden

if grep -q '^OSH_THEME=' "$BASHRC"; then
    sed -i 's/^OSH_THEME=.*/OSH_THEME="font"/' "$BASHRC"
else
    echo 'OSH_THEME="font"' >> "$BASHRC"
fi

echo "Setup abgeschlossen. Bitte öffne ein neues Terminal oder lade die Konfiguration mit 'source $BASHRC' neu."
