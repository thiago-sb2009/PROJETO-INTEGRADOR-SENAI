-- 1. Criar o Banco de Dados (se ainda não existir)
CREATE DATABASE IF NOT EXISTS barbearia_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Selecionar o Banco de Dados
USE barbearia_db;

-- 3. Tabela de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 4. Tabela de Barbeiros (Pessoa 3)
CREATE TABLE IF NOT EXISTS barbeiros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ativo TINYINT(1) DEFAULT 1,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 5. Tabela de Serviços (Pessoa 3)
CREATE TABLE IF NOT EXISTS servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo TINYINT(1) DEFAULT 1,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 6. Tabela de Agendamentos (Pessoas 1 e 2)
CREATE TABLE IF NOT EXISTS agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    barbeiro_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_agendamento DATE NOT NULL,
    hora_agendamento TIME NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    status ENUM('Agendado', 'Concluído', 'Cancelado') DEFAULT 'Agendado',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (barbeiro_id) REFERENCES barbeiros(id) ON DELETE CASCADE,
    FOREIGN KEY (servico_id) REFERENCES servicos(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =======================================================
-- DADOS INICIAIS DE TESTE (Para conseguir agendar logo)
-- =======================================================

-- Inserir Clientes Iniciais
INSERT INTO clientes (nome, telefone, email) VALUES 
('Carlos Silva', '(11) 99999-1111', 'carlos@email.com'),
('Lucas Mendes', '(11) 98888-2222', 'lucas@email.com');

-- Inserir Barbeiros Iniciais
INSERT INTO barbeiros (nome, ativo) VALUES 
('João da Navalha', 1),
('Pedro Corte Fino', 1);

-- Inserir Serviços Iniciais
INSERT INTO servicos (nome, preco, ativo) VALUES 
('Corte de Cabelo', 35.00, 1),
('Barba Completa', 25.00, 1),
('Corte + Barba (Combo)', 50.00, 1);