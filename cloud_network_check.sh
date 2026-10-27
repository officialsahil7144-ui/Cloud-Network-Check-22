#!/usr/bin/env bash 
echo "DNS resolution:" 
if getent ahosts example.com | head -n 3; then :; else echo "Resolution unavailable"; fi 
echo 
echo "Default route:" 
ip route show default 2>/dev/null || echo "ip route not available" 
echo 
echo "Firewall tooling status (no rules changed):" 
if command -v ufw >/dev/null 2>&1; then 
  ufw status 2>&1 | head -n 8 
elif command -v firewall-cmd >/dev/null 2>&1; then 
  firewall-cmd --state 2>&1 
else 
  echo "ufw/firewalld not found" 
fi 
echo 
echo "Cloud metadata is intentionally not queried; use your provider's approved console or CLI." 
