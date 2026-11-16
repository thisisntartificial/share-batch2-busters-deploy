#!/bin/bash
# Install Buster's Flooring share-card batch2 (SEO-named WebP + JPG)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
HOST=$(hostname)
echo "HOST=$HOST ROOT=$ROOT"

DOCROOTS=(
  "/var/www/bustersflooring.com/frontend/build"
  "/var/www/bustersflooring.com/frontend/public"
  "/var/www/bustersflooring.com/frontend/build-next"
)
for d in /var/www/bustersflooring.com /var/www/bustersflooring.com/public_html; do
  [[ -d "$d" ]] && DOCROOTS+=("$d")
done

count=0
for DOC in "${DOCROOTS[@]}"; do
  if [[ ! -d "$DOC" ]]; then
    echo "skip missing $DOC"
    continue
  fi
  DEST="$DOC/img/share"
  mkdir -p "$DEST"
  if [[ -d "$ROOT/webp" ]]; then
    for f in "$ROOT"/webp/*.webp; do
      [[ -f "$f" ]] || continue
      cp -f "$f" "$DEST/$(basename "$f")"
      count=$((count+1))
    done
  fi
  if [[ -d "$ROOT/jpg" ]]; then
    for f in "$ROOT"/jpg/*.jpg; do
      [[ -f "$f" ]] || continue
      cp -f "$f" "$DEST/$(basename "$f")"
      count=$((count+1))
    done
  fi
  chown -R www-data:www-data "$DEST" 2>/dev/null || true
  chmod -R a+rX "$DEST" 2>/dev/null || true
  echo "wrote into $DEST"
  ls "$DEST"/daltile-adventuro-journey.* 2>/dev/null || true
done

echo "TOTAL_WRITES=$count"
if command -v curl >/dev/null; then
  curl -sI "https://bustersflooring.com/img/share/daltile-adventuro-journey.webp" | head -5 || true
  curl -sI "https://bustersflooring.com/img/share/daltile-adventuro-journey.jpg" | head -5 || true
fi
echo "DONE"
