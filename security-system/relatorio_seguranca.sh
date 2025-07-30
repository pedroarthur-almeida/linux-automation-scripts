#!/bin/bash

# Primeiro, precisamos verificar se o script esta rodando como root, ou seja, superusuario, para ter as permissoes necessarias.

if [[ $EUID -ne 0 ]]; then
	echo"Por favor, execute este script como sudo ou como root."
	exit 1
fi

echo "Iniciando auditoria e atualizacao de seguranca"

echo -e "\n1) Atualizando lista de pacostes..."
apt update -qq

echo -e "\n2) Instalando atualizacoes de seguranca..."
unattended-upgrade -d

echo -e "\n3) Servicos habilitados para iniciar com o sistema:"
systemctl list-unit-files --type=service | grep enabled

echo -e "\n4) Servicos ativos no momento:"
systemctl list-units --type=service --state=running

echo =e "n5) Portas abertas e programas escutando:"
ss -tuln

echo -e "\n6) Usuarios com permissoes para login:"
awk -F: '$7 ~ /(bash|sh)/ { print $1 }' /etc/passwd

echo -e "\n7) Permissoes dos arquivos sensiveis do sistema:"
ls -l /etc/passwd /etc/shadow /etc/sudoers

echo -e "\n8) Usuarios com privilegios adminisrativos (sudo):"
getent group sudo | cut -d: -f4

echo -e "\n9) Servicos em execucao:"
systemctl list-units --type=service --state=running | grep ".service" | awk '{print $1}' | sort

echo -e "\nServicos sensiveis detectados:"
for servico in ssh apache2 vsftpd telnet samba cups ftp; do
	if systemctl is-active --quiet "$servico"; then
		echo "Servico em execucao: $servico"
	fi
done

echo "[$(date)] Verificando usuários com shell ativo..." | tee -a "$LOG"

awk -F: '($7 !~ /nologin|false/) { print $1 ": " $7 }' /etc/passwd | tee -a "$LOG"

echo "[$(date)] Verificacao de seguranca concluida com sucesso." | tee -a "$LOG"
echo "Relatorio salvo em: $LOG"
