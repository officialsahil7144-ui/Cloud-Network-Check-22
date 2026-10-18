#!/usr/bin/env bash
set -u

echo "Cloud Network Checks"
echo "--------------------"

echo
echo "DNS lookup:"
if command -v getent >/dev/null 2>&1; then
    getent hosts example.com || echo "DNS lookup failed."
else
    echo "getent command is unavailable."
fi

echo
echo "Routing information:"
ip route || true

echo
echo "Network interfaces:"
ip -brief address || true

echo
echo "Listening TCP and UDP ports:"
if command -v ss >/dev/null 2>&1; then
    ss -tuln
else
    echo "ss command is unavailable."
fi

echo
echo "Cloud network checks completed."

