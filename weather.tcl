#!/bin/tclsh

load tclrega.so

package require http

set lat 0.0000
set lon 0.0000
set apiKey 1234567890

set ccu3VarTemp OutsideTemperature
set ccu3VarWindSpeed WindSpeed

set url http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey
set handle [::http::geturl $url]
set response [::http::data $handle]

regexp {"temp":([\-0-9]{1,3}\.[0-9]{1,2})} $response a temp
regexp {"speed":([0-9]{1,3}\.[0-9]{1,2})} $response a windSpeed

set command "object tempVar=dom.GetObject('$ccu3VarTemp'); tempVar.Variable($temp); tempVar.State($temp);"
append command "object windSpeedVar=dom.GetObject('$ccu3VarWindSpeed'); windSpeedVar.Variable($windSpeed); windSpeedVar.State($windSpeed);"

rega_script $command
