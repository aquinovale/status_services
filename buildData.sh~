#!/bin/bash

##########################
# Criado por Vinicius Vale - 10/12/2015
# Faz a montagem dos arquivos em JSON
# Usado pela Heartbeat APP
##########################

DIR=/tmp/dados

for arq in $(ls $DIR); 
do
	ARQ=$(echo -e "$DIR/$arq")
 
	while read line 
	do  
		HOST=$(echo $line | cut -f1 -d'|')
		NAME=$(echo $line | cut -f2 -d'|')
		DATA=$(echo $line | cut -f3 -d'|')
		HORA=$(echo $line | cut -f4 -d'|')
		if [ -n "$NAME" ]
		then
			psql -c "INSERT INTO servicos(host, servico, data_return, time_return) VALUES ('$HOST', '$NAME', '$DATA'::date, '$HORA'::time);" heartbeatapp
		fi
	done < $ARQ
done
