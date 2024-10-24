#! /usr/bin/env bash
set -euo pipefail


function record_data {

response=$(curl -s https://api.open-meteo.com/v1/forecast\?latitude\=56.863\&longitude\=53.1851\&current\=temperature_2m,apparent_temperature,weather_code,is_day\&timezone\=Europe%2FSamara)

weather_code=$(echo "$response" | jq -r ".current.weather_code")
temp=$(echo "$response" | jq -r ".current.temperature_2m" | cut -d '.' -f 1)

THERMO="\U1F321"

rain_codes=(61 63 65 51 53 55 80 81 82)
overcast_codes=(1 2 3)
fog_codes=(45 48)
freezing_rain_codes=(56 57 66 67)
snow_codes=(71 73 75 77 85 86)
thunder_codes=(95 96 99)


if   [[ ${overcast_codes[@]}      =~ $weather_code ]];then
weather_sign="Облачно \U26C5"
elif [[ ${rain_codes[@]}          =~ $weather_code ]];then
weather_sign='Дождь \U1F327'
elif [[ ${fog_codes[@]}           =~ $weather_code ]];then
weather_sign="Туман \U1F32B"
elif [[ ${freezing_rain_codes[@]} =~ $weather_code ]];then
weather_sign="Ледяной дождь \U2744 \U1F327"
elif [[ ${snow_codes[@]}          =~ $weather_code ]];then
weather_sign="Снег \U2744"
elif [[ ${thunder_codes[@]}       =~ $weather_code ]];then
weather_sign="Гром \U1F329"
elif [[ $weather_code -eq 0 ]];then
weather_sign="Ясно \U2600"
else
weather_sign="\U1F7E5"
fi

echo "CURRENT_DATE $(date +"%d-%m-%y-%H")" >> ~/tmuxconf/.weather
echo "$weather_sign $THERMO $temp °C" >> ~/tmuxconf/.weather

}


function main {

if [[ -e ~/tmuxconf/.weather ]];then
	reader
else
	touch ~/tmuxconf/.weather
	record_data
	reader
fi
}


function reader {

if [[ "$(date +"%d-%m-%y-%H")" = "$(cat ~/tmuxconf/.weather | grep "CURRENT_DATE" | awk '{print$2}')" ]]; then
	printf '%b\n' "$(cat ~/tmuxconf/.weather)"
else
	rm ~/tmuxconf/.weather
	record_data
fi

}

main
