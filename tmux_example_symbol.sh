#! /bin/bash

input_flag=$1

if [[ $input_flag == 'lh' ]]; then
	printf '%b\n' '\uE0B6'
elif [[ $input_flag == 'rh' ]]; then
	printf '%b\n' '\uE0B0'
fi
