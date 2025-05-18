#!/bin/bash
set -e

# Variablen
THEME_NAME="font"
THEME_URL="https://raw.githubusercontent.com/myt960/ohmybash/main/font.theme.sh"
THEME_DIR="/root/.oh-my-bash/themes/$THEME_NAME"
THEME_FILE="$THEME_DIR/${THEME_NAME}.theme.sh"
BASHRC="/root/.bashrc"

echo "📦 1. Installiere Oh My Bash..."
export OSH="/root/.oh-my-bash"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo "📁 2. Erstelle Theme-Verzeichnis: $THEME_DIR"
mkdir -p "$THEME_DIR"

echo "⬇️ 3. Lade Theme-Datei herunter von:"
echo "$THEME_URL"
curl -fsSL "$THEME_URL" -o "$THEME_FILE"

if [[ -f "$THEME_FILE" ]]; then
  echo "✅ Theme-Datei gespeichert unter: $THEME_FILE"
else
  echo "❌ Fehler: Theme-Datei wurde NICHT gespeichert!"
  exit 1
fi

echo "⚙️ 4. Setze Theme in $BASHRC..."
if grep -q '^OSH_THEME=' "$BASHRC"; then
  sed -i "s/^OSH_THEME=.*/OSH_THEME=\"$THEME_NAME\"/" "$BASHRC"
else
  echo "OSH_THEME=\"$THEME_NAME\"" >> "$BASHRC"
fi

echo "🧠 5. Inhalt der Theme-Datei (Vorschau):"
head -n 10 "$THEME_FILE"

echo "✅ Fertig! Starte eine neue Shell oder führe:"
echo "source ~/.bashrc"
