# Projeto Análise de Dados - Pizzaria Vesuvio 🍕🍕🍕

## 1. Visão Geral do Projeto

Este projeto simula um sistema de pedidos para a pizzaria fictícia "Vesuvio", com o objetivo de estruturar um banco de dados relacional e, futuramente, extrair insights de negócio através de análises.
Este é um projeto de portfólio desenvolvido para aplicar e demonstrar habilidades em modelagem de dados, **SQL** e, nas próximas fases, **Business Intelligence (BI)**.

## 2. Tecnologias Utilizadas 

Banco de Dados: **MySQL**
Modelagem de Dados: **MySQL Workbench**

Versionamento: **Git & GitHub**

## 3. Estrutura do Projeto 

O repositório está organizado da seguinte forma:
### /database: Contém os scripts **SQL** para a criação do banco de dados **(DDL)** e inserção dos dados de teste **(DML)**.

### /documentation: Armazena a documentação do projeto, como o modelo de dados e o dicionário de dados.

### /analysis: Futuro local para armazenar as queries de análise de negócio.


## 4. Como Utilizar 
Para recriar este projeto em seu ambiente local, siga os passos abaixo:

Clone o repositório:

**Bash**

**git clone https://github.com/seu-usuario/analise-dados-pizzaria-vesuvio.git** 

Crie as tabelas: Em seu cliente **MySQL**, execute o script **database/schema.sql** para criar toda a estrutura do banco de dados.

Popule o banco: Em seguida, execute o script database/inserts.sql para popular as tabelas com os dados de teste.

## 5. Modelo de Dados
 
Abaixo está o **Diagrama Entidade-Relacionamento (DER)** que representa a estrutura do banco de dados.

![Diagrama do Banco de Dados](https://github.com/lucasrosa-rep/analise-dados-pizzaria-vesuvio/blob/main/Modelagem%20de%20Banco%20de%20Dados%20-%20Pizzaria%20Vesuvio.png?raw=true)

## 6. Próximos Passos

[ ] Elaborar e responder perguntas de negócio com queries **SQL**.

[ ] Conectar o banco de dados a uma ferramenta de BI (**Power BI, Looker Studio ou Tableau**).

[ ] Criar um dashboard interativo para visualização dos principais KPIs (**Key Performance Indicators**) da pizzaria.
