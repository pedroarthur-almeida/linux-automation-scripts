#!/bin/bash

echo "Iniciando limpeza do sistema..."

echo "Limpando cache do APT..."
sudo apt-get clean

echo "Limpando cache do usuario (~/.cache)..."
rm -rf ~/.cache/*

echo "Limpando arquivos temporarios (/tmp e /var/tmp)..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "Limpando miniaturas antigas (~/cache/thumbnails)..."
rm -rf ~/.cache/thumbnails/*

echo "Limpeza concluida com sucesso."
