#!/bin/bash
# Fetch Public IP script for Conky 

IP=$(curl -s 2ip.ru)

echo "Public IP: $IP"
