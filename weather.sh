#! /usr/bin/env bash
set -euo pipefail

response=$(curl -s https://api.open-meteo.com/v1/forecast\?latitude\=56.863\&longitude\=53.1851\&current\=temperature_2m,apparent_temperature,weather_code,is_day\&timezone\=Europe%2FSamara)

weather_code=$(echo "$response" | jq -r ".current.weather_code")
temp=$(echo "$response" | jq -r ".current.temperature_2m" | cut -d '.' -f 1)
appr_temp=$(echo "$response" | jq -r ".current.apparent_temperature" | cut -d '.' -f 1)
is_day=$(echo "$response" | jq -r ".current.is_day")
thermo="\U1F321"



if [[ $weather_code -eq 61 ]]; then
# weather is rainy
weather_sign="\U1F327"
else
weather_sign="\U231B"
fi


summary_string="$weather_sign $thermo $temp($appr_temp)"

printf "%b\n" "$summary_string"
