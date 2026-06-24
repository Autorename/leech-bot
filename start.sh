#!/bin/bash

# Start aria2c RPC daemon (port 6800) before the bot connects to it
aria2c \
  --enable-rpc \
  --rpc-listen-all=false \
  --rpc-listen-port=6800 \
  --max-connection-per-server=10 \
  --rpc-max-request-size=1024M \
  --speed-limit-count=32 \
  --continue=true \
  --no-file-allocation-limit=0 \
  -x 10 -j 20 -s 10 \
  --quiet=true \
  --daemon=true 2>/dev/null || echo "[WARN] aria2c already running or failed to start, continuing..."

# Give aria2c a moment to bind its RPC port
sleep 2

# Run update script then launch the bot
python3 update.py && python3 -m bot
