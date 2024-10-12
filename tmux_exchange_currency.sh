#!/usr/bin/env bash

input_flag=$1

if [[ $input_flag == 'eu' ]]; then
var1=$(curl -s https://www.cbr.ru/currency_base/daily/ | grep '<td>Евро</td>' -A 1 | tail -n 1 | awk '{print$1}' | sed 's/.\{6\}$//' | sed 's/^.\{4\}//')
var2="€ $(echo $var1 | cut -d ',' -f 1),$(echo $var1 | cut -d ',' -f 2 | cut -c -2)"
elif [[ $input_flag == 'usd' ]]; then
var1=$(curl -s https://www.cbr.ru/currency_base/daily/ | grep '<td>Доллар США</td>' -A 1 | tail -n 1 | awk '{print$1}' | sed 's/.\{6\}$//' | sed 's/^.\{4\}//')
var2="\$ $(echo $var1 | cut -d ',' -f 1),$(echo $var1 | cut -d ',' -f 2 | cut -c -2)"
elif [[ $input_flag == '' ]]; then
var2='/!\ ERROR - EMPTY REQUEST /!\'
else
var2='/!\ ERROR - NO SUCH CURRENCY /!\'
fi

echo " $var2 "
