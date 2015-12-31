#!/bin/bash

###########
# Criado por Vinicius Vale - 10/12/2015
# Pega informação de status do postgres
##########
COMPANY=2 ## Codigo empresa
WEB="is running" # "valeconsultoriati.com" 

HOST=$(hostname)
if [ "$1" = "postgresql" ]
then
	SERVICE=1 ## Codigo postgres
	psql -t -c "select $COMPANY, '$HOST', $SERVICE, 'running', now()" postgres
elif [ "$1" = "mysql" ]
then
	SERVICE=2 ## Codigo mysql
	mysql -e "select $COMPANY, '$HOST', $SERVICE, 'running', now()" --skip-column-names 
else
	SERVICE=3 ## Codigo web
#	WEB_RESULT=$(curl -X POST $WEB | grep -o "$WEB" | sort | uniq)
	WEB_RESULT=$(service apache2 status | grep -o 'is running')

	if [ "$WEB" = "$WEB_RESULT" ] 
	then
		echo -e "$COMPANY | $HOST | $SERVICE | running | $(date '+%Y/%m/%d %H:%M:%S')"

	fi
fi
