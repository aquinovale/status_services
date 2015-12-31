#!/bin/bash

##########################
# Criado por Vinicius Vale - 10/12/2015
# Faz a montagem dos arquivos em JSON
# Usado pela Heartbeat APP
##########################

DIR=/home/ubuntu/status_services/arqs/
for arq in $(ls $DIR); 
do
	while read line 
	do  
		COMPANY=$(echo $line | cut -f1 -d'|')
		HOST=$(echo $line | cut -f2 -d'|')
		SERVICE=$(echo $line | cut -f3 -d'|')
		MESSAGE=$(echo $line | cut -f4 -d'|')
		DT_RECEIVE=$(echo $line | cut -f5 -d'|')
		if [ -n "$HOST" ]
		then
			INSERT="INSERT INTO tb_history(id_company, host, id_service, message, dt_receive) VALUES ($COMPANY, trim('$HOST'), $SERVICE, trim('$MESSAGE'), '$DT_RECEIVE');"
			# echo -e $INSERT
			psql -c "$INSERT"  heartbeatapp
		fi
	done < $DIR/$arq
done
