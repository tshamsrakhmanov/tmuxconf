#! /usr/bin/env bash
set -eou pipefail

hostname -I | awk '{print $1}'
