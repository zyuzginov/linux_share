#!/bin/sh
#Скрипт подключения к терминальному серверу и запуска приложения Консультант
declare http_proxy=
declare https_proxy=
declare HTTP_PROXY=
declare HTTPS_PROXY=
xfreerdp /u:username /d:domain /v:server /clipboard /cert-ignore /drive:home,/home/username /network:auto /printer /sec:rdp +aero +fonts /w:1920 /h:950 /app:"||App" /p:$(zenity --entry --title="Domain Password" --text="Enter your password:" --hide-text)
exit
