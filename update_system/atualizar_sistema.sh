#!/bin/bash

# Script para atualizar e limpar o sistema.

echo "iniciando atualizacao do sistema..."

# Aqui ocorre a atualizacao de repositorios e pacotes do sistema.
sudo apt update && sudo apt upgrade -y

# Caso o usuario utilize snap.
if command -v snap &> /dev/null; then
	echo "Atualizando pacotes snap..."
	sudo snap refresh
fi

# Caso o usuario utilize flatpak.
if command -v flatpak &> /dev/null; then
	echo "Atualizando pacotes flatpak..."
	flatpak update -y
fi

# Aqui, os pacotes orfaos e desnecessarios sao removidos.
echo "Removendo pacotes orfaos e realizando a limpeza do sistema..."
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

echo "Sistema atualizado e limpo com sucesso."
