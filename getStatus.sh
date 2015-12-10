#!/bin/bash

###########
# Criado por Vinicius Vale - 10/12/2015
# Pega informação de status do postgres
##########

HOST=$(hostname)
psql -t -c "select '$HOST', 'postgresql', now()::date, now()::time" postgres
