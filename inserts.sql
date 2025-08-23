-- Desabilitar checagens para facilitar a inserção em lote
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Desabilitar o modo de atualização segura para permitir DELETE sem WHERE
SET SQL_SAFE_UPDATES = 0;

-- Limpando as tabelas na ordem inversa de dependência para evitar erros de chave estrangeira
DELETE FROM PEDIDO_FUNCIONARIO;
DELETE FROM PAGAMENTOS;
DELETE FROM PEDIDOS_CLIENTE;
DELETE FROM STATUS_PEDIDO;
DELETE FROM CHECKOUT;
DELETE FROM CUPONS;
DELETE FROM CARRINHO_ITENS;
DELETE FROM PRODUTOS;
DELETE FROM PIZZA_SABORES;
DELETE FROM PIZZA_PERSONALIZADA;
DELETE FROM TAMANHOS;
DELETE FROM MASSAS;
DELETE FROM BORDAS;
DELETE FROM SABORES;
DELETE FROM ENDERECO_CLIENTE;
DELETE FROM ENDERECO;
DELETE FROM REGIOES_ATENDIDAS;
DELETE FROM CIDADES;
DELETE FROM CLIENTE;
DELETE FROM FUNCIONARIOS;

-- Reabilitar o modo de atualização segura
SET SQL_SAFE_UPDATES = 1;


-- Inserindo dados nas tabelas
-- -----------------------------------------------------
-- Tabela `CIDADES`
-- -----------------------------------------------------
INSERT INTO `CIDADES` (`nome`, `UF`) VALUES
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG');

-- -----------------------------------------------------
-- Tabela `REGIOES_ATENDIDAS`
-- -----------------------------------------------------
INSERT INTO `REGIOES_ATENDIDAS` (`id_cidade`, `bairro`) VALUES
(1, 'Pinheiros'),
(1, 'Vila Madalena'),
(2, 'Copacabana'),
(3, 'Savassi');

-- -----------------------------------------------------
-- Tabela `CLIENTE`
-- -----------------------------------------------------
INSERT INTO `CLIENTE` (`nome`, `sobrenome`, `cpf`, `telefone`, `email`) VALUES
('Carlos', 'Silva', '111.222.333-44', '11987654321', 'carlos.silva@email.com'),
('Mariana', 'Oliveira', '222.333.444-55', '21912345678', 'mariana.o@email.com'),
('João', 'Pereira', '333.444.555-66', '31955554444', 'joao.pereira@email.com');

-- -----------------------------------------------------
-- Tabela `ENDERECO`
-- -----------------------------------------------------
INSERT INTO `ENDERECO` (`rua`, `numero`, `complemento`, `id_regiao_atendida`) VALUES
('Rua dos Pinheiros', '100', 'Apto 10', 1),
('Rua Aspicuelta', '200', 'Casa', 2),
('Avenida Atlântica', '300', 'Apto 301', 3),
('Rua Fernandes Tourinho', '400', 'Loja B', 4);

-- -----------------------------------------------------
-- Tabela `ENDERECO_CLIENTE`
-- -----------------------------------------------------
INSERT INTO `ENDERECO_CLIENTE` (`id_endereco`, `id_cliente`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);

-- -----------------------------------------------------
-- Tabela `SABORES`
-- -----------------------------------------------------
INSERT INTO `SABORES` (`nome`, `descricao`, `valor_adicional`) VALUES
('Mussarela', 'Queijo mussarela e molho de tomate', 'NAO'),
('Calabresa', 'Calabresa fatiada com cebola', 'NAO'),
('Frango com Catupiry', 'Frango desfiado com Catupiry', 'SIM'),
('Portuguesa', 'Ovos, presunto, cebola, azeitona', 'NAO'),
('Quatro Queijos', 'Mussarela, provolone, parmesão', 'SIM');

-- -----------------------------------------------------
-- Tabela `BORDAS`
-- -----------------------------------------------------
INSERT INTO `BORDAS` (`nome`, `valor_adicional`) VALUES
('Sem Borda', 0.00),
('Catupiry', 8.00),
('Cheddar', 8.50);

-- -----------------------------------------------------
-- Tabela `MASSAS`
-- -----------------------------------------------------
INSERT INTO `MASSAS` (`nome`, `valor`) VALUES
('Tradicional', 0.00),
('Fina', 0.00),
('Integral', 5.00);

-- -----------------------------------------------------
-- Tabela `TAMANHOS`
-- -----------------------------------------------------
INSERT INTO `TAMANHOS` (`nome`, `preco_base`, `max_sabores`) VALUES
('Média', 45.00, 2),
('Grande', 55.00, 3),
('Família', 65.00, 4);

-- -----------------------------------------------------
-- Tabela `PIZZA_PERSONALIZADA`
-- -----------------------------------------------------
INSERT INTO `PIZZA_PERSONALIZADA` (`id_tamanho`, `id_massa`, `id_borda`, `max_sabores`, `observacao`) VALUES
(1, 1, 2, 2, 'Sem cebola, por favor.'),
(2, 2, 1, 3, NULL),
(3, 3, 3, 4, 'Bem passada.');

-- -----------------------------------------------------
-- Tabela `PIZZA_SABORES`
-- -----------------------------------------------------
INSERT INTO `PIZZA_SABORES` (`id_pizza_personalizada`, `id_sabor`) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5);

-- -----------------------------------------------------
-- Tabela `PRODUTOS`
-- -----------------------------------------------------
INSERT INTO `PRODUTOS` (`nome`, `descricao`, `preco_unitario`, `quantidade_estoque`) VALUES
('Coca-Cola 2L', 'Refrigerante de cola', 12.00, 50),
('Guaraná Antarctica 2L', 'Refrigerante de guaraná', 11.00, 45),
('Pudim de Leite', 'Fatia de pudim de leite condensado', 9.50, 20);

-- -----------------------------------------------------
-- Tabela `CARRINHO_ITENS`
-- -----------------------------------------------------
INSERT INTO `CARRINHO_ITENS` (`id_pizza_personalizada`, `id_produtos`, `id_cliente`, `quantidade`, `preco_unitario`, `data_adicionado`) VALUES
(1, 1, 1, 1, 53.00, '2025-08-22'), -- Pizza Média (45) + Borda (8)
(2, 2, 2, 1, 55.00, '2025-08-22'); -- Pizza Grande (55)

-- -----------------------------------------------------
-- Tabela `CUPONS`
-- -----------------------------------------------------
INSERT INTO `CUPONS` (`codigo`, `descricao`, `tipo_desconto`, `valor_desconto`, `limite_usuarios`, `data_expiracao`) VALUES
('BEMVINDO10', '10% de desconto no primeiro pedido', 'PERCENTUAL', 10.00, 100, '2025-12-31'),
('PIZZA5', 'R$5 de desconto em pizzas', 'FIXO', 5.00, 200, '2025-10-31');

-- -----------------------------------------------------
-- Tabela `CHECKOUT`
-- -----------------------------------------------------
INSERT INTO `CHECKOUT` (`id_carrinho`, `id_cupom`) VALUES
(1, 2),
(2, 1);

-- -----------------------------------------------------
-- Tabela `STATUS_PEDIDO`
-- -----------------------------------------------------
INSERT INTO `STATUS_PEDIDO` (`nome`) VALUES
('Recebido'),
('Em preparo'),
('Saiu para entrega'),
('Entregue'),
('Cancelado');

-- -----------------------------------------------------
-- Tabela `PEDIDOS_CLIENTE`
-- -----------------------------------------------------
INSERT INTO `PEDIDOS_CLIENTE` (`id_checkout`, `id_status`, `created_at`, `updated_at`) VALUES (1, 2, NOW(), NOW());
SET @last_pedido_id_1 = LAST_INSERT_ID();

INSERT INTO `PEDIDOS_CLIENTE` (`id_checkout`, `id_status`, `created_at`, `updated_at`) VALUES (2, 1, NOW(), NOW());
SET @last_pedido_id_2 = LAST_INSERT_ID();

-- -----------------------------------------------------
-- Tabela `PAGAMENTOS`
-- -----------------------------------------------------
INSERT INTO `PAGAMENTOS` (`id_checkout`, `metodo`, `valor`, `status`, `data_pagamento`) VALUES
(1, 'Cartão de Crédito', 48.00, 'Aprovado', '2025-08-22 19:30:00'), -- 53 - 5 do cupom
(2, 'PIX', 49.50, 'Aprovado', '2025-08-22 19:35:00'); -- 55 - 10%

-- -----------------------------------------------------
-- Tabela `FUNCIONARIOS`
-- -----------------------------------------------------
INSERT INTO `FUNCIONARIOS` (`nome`, `cargo`, `cpf`, `telefone`, `email`) VALUES
('Ana Souza', 'Atendente', '444.555.666-77', '11911112222', 'ana.souza@pizzaria.com'),
('Pedro Martins', 'Pizzaiolo', '555.666.777-88', '11933334444', 'pedro.martins@pizzaria.com'),
('Lucas Costa', 'Entregador', '666.777.888-99', '11955556666', 'lucas.costa@pizzaria.com');

-- -----------------------------------------------------
-- Tabela `PEDIDO_FUNCIONARIO`
-- -----------------------------------------------------
INSERT INTO `PEDIDO_FUNCIONARIO` (`id_pedido`, `id_funcionario`, `papel`) VALUES
(@last_pedido_id_1, 1, 'Atendente'),
(@last_pedido_id_1, 2, 'Pizzaiolo'),
(@last_pedido_id_1, 3, 'Entregador'),
(@last_pedido_id_2, 1, 'Atendente');

-- Habilitar checagens novamente
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
