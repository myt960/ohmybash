#!/bin/bash
set -e

REPO_BASE="https://raw.githubusercontent.com/myt960/ohmybash/main"
THEME_NAME="font"
THEME_DIR="/root/.oh-my-bash/themes/$THEME_NAME"
THEME_FILE="$THEME_DIR/$THEME_NAME.theme.sh"
BASHRC="/root/.bashrc"

echo "📦 1. Installiere Oh My Bash..."
export OSH="/root/.oh-my-bash"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo "📁 2. Erstelle Theme-Verzeichnis: $THEME_DIR"
mkdir -p "$THEME_DIR"

echo "⬇️ 3. Lade Theme-Datei herunter..."
curl -fsSL "$REPO_BASE/font.theme.sh" -o "$THEME_FILE"

if [[ -f "$THEME_FILE" ]]; then
  echo "✅ Theme-Datei erfolgreich unter $THEME_FILE gespeichert."
else
  echo "❌ Fehler: Theme-Datei wurde nicht heruntergeladen."
  exit 1
fi

echo "⚙️ 4. Setze Theme in $BASHRC..."
if grep -q '^OSH_THEME=' "$BASHRC"; then
  sed -i 's/^OSH_THEME=.*/OSH_THEME="font"/' "$BASHRC"
else
  echo 'OSH_THEME="font"' >> "$BASHRC"
fi

echo "🧹 5. Bereinige ggf. alte PROMPT_COMMANDs..."
sed -i '/^PROMPT_COMMAND=/d' "$BASHRC"

echo "✅ 6. Installation abgeschlossen."
echo "➡️  Starte eine neue Shell oder führe: source $BASHRC"
