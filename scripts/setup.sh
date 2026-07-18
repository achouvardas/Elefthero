#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
python3 -m venv .venv
.venv/bin/pip install --upgrade pip
.venv/bin/pip install -r requirements.txt
cp deploy/systemd/myaade.service /tmp/myaade.service
cp deploy/systemd/myaade-cloudflared.service /tmp/myaade-cloudflared.service
echo "Dependencies are installed. Configure cloudflared/config.yml, then run:"
echo "  sudo cp /tmp/myaade*.service /etc/systemd/system/"
echo "  sudo systemctl daemon-reload"
echo "  sudo systemctl enable --now myaade.service myaade-cloudflared.service"
echo "Open the app and complete the one-time secure setup wizard."
