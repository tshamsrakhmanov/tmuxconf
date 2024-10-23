#! /usr/bin/env bash
set -euo pipefail

response=$(curl -s https://api.open-meteo.com/v1/forecast\?latitude\=56.863\&longitude\=53.1851\&current\=temperature_2m,apparent_temperature,weather_code,is_day\&timezone\=Europe%2FSamara)

weather_code=$(echo "$response" | jq -r ".current.weather_code")
temp=$(echo "$response" | jq -r ".current.temperature_2m" | cut -d '.' -f 1)
appr_temp=$(echo "$response" | jq -r ".current.apparent_temperature" | cut -d '.' -f 1)
is_day=$(echo "$response" | jq -r ".current.is_day")

THERMO="\U1F321"
rain_codes=(61 63 65 51 53 55 80 81 82)
overcast_codes=(1 2 3)
fog_codes=(45 48)
freezing_rain_codes=(56 57 66 67)
snow_codes=(71 73 75 77 85 86)
thunder_codes=(95 96 99)

if [[ ${rain_codes[@]} =~ $weather_code ]]; then
weather_sign="\U1F327"

elif [[ ${overcast_codes[@]} =~ $weather_code ]];then
weather_sign="\U26C5"

elif [[ ${fog_codes[@]} =~ $weather_code ]];then
weather_sign="\U1F32B"

elif [[ ${freezing_rain_codes[@]} =~ $weather_code ]];then
weather_sign="\U2744 \U1F327"

elif [[ ${snow_codes[@]} =~ $weather_code ]];then
weather_sign="\U1F328"

elif [[ ${thunder_codes[@]} =~ $weather_code ]];then
weather_sign="\U1F329"

elif [[ $weather_code -eq 0 ]];then
weather_sign="\U2600"

else
weather_sign="\U1F7E5"
fi

summary_string="$weather_sign $THERMO $temp($appr_temp)"

printf "%b\n" "$summary_string"
