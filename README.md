# Linux-Automation-Scripts
Esses scripts foram desenvolvidos para automatizar algumas tarefas simples no Linux Ubuntu. Eles têm como objetivo facilitar o uso do sistema tanto para pessoas que já utilizam Linux habitualmente quanto para iniciantes, simplificando atividades do     dia a dia.

# Scripts disponíveis

## 📁 clean-system
- Realiza uma limpeza no sistema, removendo arquivos e pacotes desnecessários para liberar espaço e melhorar o desempenho.

## 📁 report-system
- Gera um relatório detalhado sobre diferentes áreas do sistema (como CPU, memória, disco etc.) e salva as informações em um arquivo `.txt`.

## 📁 security-system
- Analisa diversos aspectos relacionados à **segurança e integridade** do sistema, exibindo os resultados para o usuário de forma clara.

## 📁 update-system
- Atualiza o sistema e remove pacotes órfãos, mantendo o sistema limpo e em dia com as últimas versões dos pacotes instalados.

# Usando o cron
Caso queira automatizar a execução dos scripts, você pode utilizar o cron, que é nativo do Linux Ubuntu. Com ele, é possível definir exatamente quando cada script deve ser executado, como ao iniciar o sistema, em dias específicos ou em horários programados, tornando todo o processo ainda mais eficiente, prático e sem necessidade de intervenção manual.

## 🔁 Como automatizar os scripts no Ubuntu com CRON

Se você quer que seus scripts rodem **automaticamente**, sem precisar executá-los manualmente, pode usar o `cron`, o agendador de tarefas do Linux.

