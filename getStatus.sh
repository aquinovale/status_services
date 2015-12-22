#!/bin/bash

###########
# Criado por Vinicius Vale - 10/12/2015
# Pega informação de status do postgres
##########
COMPANY=2 ## Codigo empresa
SERVICE=1 ## Codigo serviço

HOST=$(hostname)
psql -t -c "select $COMPANY, '$HOST', $SERVICE, 'running', now()" postgres
