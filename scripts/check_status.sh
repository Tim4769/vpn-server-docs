#!/bin/bash

echo "===== PUBLIC IP ====="
curl -s ifconfig.me
echo

echo "===== LISTENING PORTS ====="
sudo ss -ltnp | grep -E ':22|:443|:62050|:62051' || echo "No matching ports found"
echo

echo "===== DOCKER CONTAINERS ====="
sudo docker ps -a
echo

echo "===== XRAY STATUS ====="
sudo systemctl status xray --no-pager || true

