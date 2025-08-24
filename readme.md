# Projeto Análise de Dados - Pizzaria Vesuvio 🍕🍕🍕

## 1. Visão Geral do Projeto

Este projeto simula um sistema de pedidos para a pizzaria fictícia "Vesuvio", com o objetivo de estruturar um banco de dados relacional e, futuramente, extrair insights de negócio através de análises.
Este é um projeto de portfólio desenvolvido para aplicar e demonstrar habilidades em **modelagem de dados**, **SQL** e, nas próximas fases, **Business Intelligence (BI)**.

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

## 6. Justificativa de Modelagem

A modelagem do banco de dados foi pensada para atender aos principais processos de um sistema de pedidos de pizzaria, garantindo organização, consistência e flexibilidade para futuras expansões.

### 6.1 Normalização e Integridade
- As tabelas foram criadas seguindo princípios de **normalização**, reduzindo redundâncias e facilitando a manutenção dos dados.  
- Foram aplicadas **chaves primárias** e **chaves estrangeiras** para assegurar a integridade referencial entre as entidades.  

### 6.2 Clientes e Endereços
- A tabela `CLIENTE` armazena informações básicas e únicas de cada cliente (com **restrição de unicidade no CPF**).  
- Endereços foram separados em `ENDERECO` e relacionados ao cliente via `ENDERECO_CLIENTE`, permitindo que um cliente tenha mais de um endereço cadastrado.  
- A ligação com `REGIOES_ATENDIDAS` garante que os pedidos só possam ser feitos em áreas de cobertura da pizzaria.  

### 6.3 Cardápio e Personalização
- O cardápio foi modelado em entidades específicas (`SABORES`, `BORDAS`, `MASSAS`, `TAMANHOS`), permitindo flexibilidade na gestão de produtos.  
- A tabela `PIZZA_PERSONALIZADA` permite que o cliente monte sua pizza com combinações personalizadas.  
- O relacionamento `PIZZA_SABORES` viabiliza múltiplos sabores por pizza, respeitando o limite definido pelo tamanho.  

### 6.4 Carrinho e Checkout
- A tabela `CARRINHO_ITENS` centraliza os itens escolhidos pelo cliente, sejam pizzas ou produtos adicionais.  
- O `CHECKOUT` conecta o carrinho com cupons de desconto e regiões de entrega, representando o fechamento do pedido.  

### 6.5 Pedidos e Pagamentos
- O histórico de pedidos é registrado em `PEDIDOS_CLIENTE`, vinculado ao checkout e a um `STATUS_PEDIDO` que controla o andamento da entrega.  
- A tabela `PAGAMENTOS` foi estruturada para armazenar diferentes métodos, valores e status de pagamento.  
- Foram adicionadas colunas `created_at` e `updated_at` para rastrear o ciclo de vida dos pedidos e pagamentos.  

### 6.6 Funcionários e Operações
- A tabela `FUNCIONARIOS` centraliza dados da equipe, garantindo **unicidade do CPF**.  
- A associação `PEDIDO_FUNCIONARIO` define a participação de atendentes, pizzaiolos e entregadores em cada pedido, refletindo a operação real da pizzaria.  

---

Essa modelagem oferece **equilíbrio entre simplicidade e escalabilidade**, podendo evoluir futuramente com funcionalidades como relatórios gerenciais, controle de estoque detalhado e integração com sistemas de delivery.


## 7. Melhorias Futuras

O projeto foi desenvolvido como um estudo de modelagem de banco de dados, mas pode ser expandido para contemplar novas funcionalidades e simular um sistema mais próximo da realidade. Algumas sugestões de evolução incluem:

### 7.1 Relatórios e Dashboards
- Criar consultas SQL para gerar relatórios de vendas, produtos mais pedidos e clientes mais frequentes.  
- Integrar o banco com ferramentas de visualização (ex: Power BI) para dashboards gerenciais.  

### 7.2 Controle de Estoque
- Implementar lógica de movimentação no estoque (entrada e saída de ingredientes e produtos).  
- Adicionar alerta para estoque mínimo e relatórios de compras necessárias.  

### 7.3 Sistema de Autenticação
- Criar tabelas de **usuários e permissões** (admin, atendente, cliente).  
- Relacionar clientes autenticados diretamente com seus pedidos e históricos.  

### 7.4 Gestão de Entregas
- Adicionar rastreamento de pedidos em tempo real, com atualização do status de entrega.  
- Criar relação entre funcionários (entregadores) e pedidos em rota.  

### 7.5 Integração com Aplicações
- Conectar o banco a uma aplicação web (ex: em **Java + Spring Boot**) ou API REST para manipulação dos dados.  
- Permitir que os clientes realizem pedidos online via front-end integrado.  

### 7.6 Pagamentos Avançados
- Incluir suporte a múltiplos métodos de pagamento por pedido.  
- Registrar logs de tentativas de pagamento para auditoria.  

### 7.7 Testes e Dados de Exemplo
- Criar um **script de inserção (seed)** com dados fictícios (clientes, pizzas, pedidos).  
- Preparar cenários de teste para validar a integridade da modelagem.  

---

Essas melhorias podem ser implementadas gradualmente, ampliando o escopo do projeto e gerando novos aprendizados tanto na parte de **banco de dados** quanto em **desenvolvimento de software**.





