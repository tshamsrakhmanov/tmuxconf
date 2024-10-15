#!/usr/bin/env bash
set -euo pipefail


result=$(who | head -n 1 | awk '{print$5}')

#echo "$result"

if [[ -z $(who | head -n 1 | awk '{print$5}') ]]; then
	echo "SELF HOST"
else
	echo "SSH DETECTED"
fi
