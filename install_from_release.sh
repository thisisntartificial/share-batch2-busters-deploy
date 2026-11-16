#!/bin/bash
set -euo pipefail
URL="https://github.com/thisisntartificial/share-batch2-busters-deploy/releases/download/batch2-2026-11-15/busters-share-batch2-deploy.tgz"
echo "Fetching $URL"
cd /tmp
rm -rf busters-share-batch2-deploy b2pack b2.tgz
curl -fsSL -o b2.tgz "$URL"
mkdir -p b2pack
tar -xzf b2.tgz -C b2pack
# find install script
SCR=$(find b2pack -name install_busters_batch2.sh | head -1)
test -n "$SCR"
bash "$SCR"
