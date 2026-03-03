-- Crie um banco de dados para o seu projeto, se ainda não tiver um
CREATE DATABASE IF NOT EXISTS blobom_db;

-- Use o banco de dados criado
USE blobom_db;

-- Desativa temporariamente a verificação de chaves estrangeiras para permitir o TRUNCATE
SET FOREIGN_KEY_CHECKS=0;

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    imagem VARCHAR(255),
    contem VARCHAR(255),
    permite_cobertura BOOLEAN DEFAULT false,
    novidade BOOLEAN DEFAULT false
);

-- Tabela de tamanhos e preços, com controle de estoque individual
CREATE TABLE IF NOT EXISTS tamanhos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 10, -- Estoque padrão de 10 para cada item
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);

-- Limpa os dados antigos para evitar duplicatas ao executar novamente
TRUNCATE TABLE tamanhos;
TRUNCATE TABLE produtos;

-- Reativa a verificação de chaves estrangeiras
SET FOREIGN_KEY_CHECKS=1;

-- Inserir todos os produtos do site
INSERT INTO produtos (id, nome, tipo, imagem, contem, permite_cobertura, novidade) VALUES
(1, 'Chocolate', 'Bolo', 'images/bolodechocolate.png', 'Glúten, Lactose', true, false),
(2, 'Cenoura', 'Bolo', 'images/bolodecenoura.png', 'Glúten, Lactose', true, true),
(4, 'Banana', 'Bolo', 'images/bolobanana.png', 'Lactose', true, false),
(6, 'Fubá com Goiabada', 'Bolo', 'images/bolodefuba.jpeg', 'Derivado de milho, Lactose', true, false),
(7, 'Fubá', 'Bolo', 'images/bolofuba.png', 'Derivado de milho, Lactose', true, false),
(8, 'Paçoca', 'Bolo', 'images/bolomandioca.png', 'Amendoim', true, true),
(9, 'Milho', 'Bolo', 'images/bolodemilho.png', 'Derivado de milho, Lactose', true, false),
(10, 'Arroz', 'Bolo', 'images/arroz.jpeg', 'Glúten, Lactose', true, true),
(11, 'Pão Caseiro Tradicional', 'Pão', 'images/paocaseiro.png', 'Glúten, Lactose', false, false),
(12, 'Pão Caseiro Integral', 'Pão', 'images/paointegral.png', 'Glúten, Lactose', false, false),
(13, 'Pão Recheado com Calabresa', 'Pão', 'images/calabresa.png', 'Glúten, Lactose', false, false),
(14, 'Pão Recheado com Queijo Coalho', 'Pão', 'images/paocaseiro.png', 'Glúten,Lactose', false, false);

-- Inserir todos os tamanhos e preços correspondentes
INSERT INTO tamanhos (produto_id, nome, preco, quantidade_estoque) VALUES
(1, '700g', 25.00, 10), (1, '350g', 14.00, 15),
(2, '700g', 25.00, 8),  (2, '350g', 14.00, 12),
(4, '700g', 25.00, 10), (4, '350g', 14.00, 15),
(6, '700g', 27.00, 7),  (6, '350g', 15.00, 10),
(7, '700g', 25.00, 10), (7, '350g', 14.00, 15),
(8, '700g', 27.00, 8),  (8, '350g', 15.00, 12),
(9, '700g', 27.00, 9),  (9, '350g', 15.00, 14),
(10, '700g', 30.00, 6), (10, '350g', 16.00, 10),
(11, '700g', 20.00, 20),(11, '400g', 13.00, 25),
(12, '700g', 25.00, 18),(12, '400g', 15.00, 22),
(13, '700g', 35.00, 10),(13, '400g', 18.00, 15),
(14, '700g', 35.00, 10),(14, '400g', 18.00, 15);
