#!/bin/bash

set -e

REPO_URL="https://raw.githubusercontent.com/myt960/ohmybash/main"
THEME_NAME="font"
THEME_DIR="/root/.oh-my-bash/themes/$THEME_NAME"
THEME_FILE="$THEME_DIR/$THEME_NAME.theme.sh"

echo "📦 Installiere Oh My Bash..."
export OSH="/root/.oh-my-bash"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo "⏳ Warte auf Abschluss der .bashrc-Erstellung..."
sleep 2  # nur zur Sicherheit, da mv async laufen kann

echo "🎨 Kopiere benutzerdefiniertes Theme..."
mkdir -p "$THEME_DIR"
curl -fsSL "$REPO_URL/font.theme.sh" -o "$THEME_FILE"

echo "⚙️ Setze Theme in /root/.bashrc..."
# Wichtig: Jetzt existiert die neue .bashrc
if grep -q '^OSH_THEME=' /root/.bashrc; then
  sed -i 's/^OSH_THEME=.*/OSH_THEME="font"/' /root/.bashrc
else
  echo 'OSH_THEME="font"' >> /root/.bashrc
fi

echo "✅ Fertig. Starte eine neue Shell oder führe 'source ~/.bashrc' aus."
