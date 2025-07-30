#!/bin/bash

arquivo="relatorio_sistema.txt"

echo "Relatorio do sistema gerado em: $(date)" > $arquivo

echo -e "\nInformacoes do sistema" >> $arquivo
uname -a >> $arquivo

echo -e "\nTempo ligado" >> $arquivo
uptime -p >> $arquivo

echo -e "\nUso do disco" >> $arquivo
df -h >> $arquivo

echo -e "\nUso da memoria RAM" >> $arquivo
free -h >> $arquivo

echo -e "\nTop 5 processos que mais usam CPU" >> $arquivo
ps -eo pid,command,%cpu --sort=-%cpu | head -n 6 >> $arquivo

echo -e "\nEnderecos IP" >> $arquivo
hostname -I >> $arquivo

echo -e "\nRelatorio gerado com sucesso no arquivo: $arquivo"
