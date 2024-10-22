#!/usr/bin/env bash
set -eou pipefail

input_flag=$1

if [[ $input_flag == 'lh' ]]; then
	printf '%b\n' '\uE0B2'
elif [[ $input_flag == 'rh' ]]; then
	printf '%b\n' '\uE0B0'
elif [[ $input_flag == 'round_lh' ]]; then
	printf '%b\n' '\uE0B6'
elif [[ $input_flag == 'round_rh' ]]; then
	printf '%b\n' '\uE0B4'
fi
