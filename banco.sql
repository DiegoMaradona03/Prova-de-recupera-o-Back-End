DROP DATABASE IF EXISTS StockCar;
CREATE DATABASE IF NOT EXISTS StockCar;
USE StockCar;

CREATE TABLE clientes(
    cliente_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    cpf varchar(11) NOT NULL UNIQUE,
    email varchar(255) NOT NULL UNIQUE,
    endereco varchar(255) NOT NULL,
    data_nascimento date NOT NULL,
    data_cadastro date NOT NULL   
);

CREATE TABLE telefone (
    telefone_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_id int(10) NOT NULL,
    numero varchar(20) NOT NULL,
    tipo enum('residencial', 'comercial', 'celular') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE carros (
    carros_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marca_veiculo VARCHAR(252) NOT NULL,
    modelo_veiculo VARCHAR(252) NOT NULL,
    ano_veiculo date NOT NULL,
    fabricacao_veiculo date NOT NULL,
    cliente_id int(10) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Dados da tabela 'clientes'
INSERT INTO clientes (nome, cpf, email, endereco, data_nascimento, data_cadastro) VALUES
('João Silva', '12345678901', 'joao.silva@email.com', 'Rua A, 123', '1985-04-10', '2023-01-15'),
('Maria Oliveira', '23456789012', 'maria.oliveira@email.com', 'Rua B, 456', '1990-07-20', '2023-02-25'),
('Carlos Souza', '34567890123', 'carlos.souza@email.com', 'Rua C, 789', '1982-11-05', '2023-03-30'),
('Ana Pereira', '45678901234', 'ana.pereira@email.com', 'Rua D, 101', '1995-01-15', '2023-04-10'),
('Fernando Costa', '56789012345', 'fernando.costa@email.com', 'Rua E, 202', '1987-03-12', '2023-05-05'),
('Patrícia Rocha', '67890123456', 'patricia.rocha@email.com', 'Rua F, 303', '1980-06-17', '2023-06-12'),
('Ricardo Almeida', '78901234567', 'ricardo.almeida@email.com', 'Rua G, 404', '1992-09-25', '2023-07-14'),
('Juliana Lima', '89012345678', 'juliana.lima@email.com', 'Rua H, 505', '1993-05-10', '2023-08-01'),
('Marcos Santos', '90123456789', 'marcos.santos@email.com', 'Rua I, 606', '1983-12-30', '2023-09-22'),
('Larissa Mendes', '11223344556', 'larissa.mendes@email.com', 'Rua J, 707', '1989-02-02', '2023-10-10');

-- Dados da tabela 'telefone'
INSERT INTO telefone (cliente_id, numero, tipo) VALUES
(1, '11987654321', 'celular'),
(2, '21987654321', 'residencial'),
(3, '31987654321', 'comercial'),
(4, '41987654321', 'celular'),
(5, '51987654321', 'residencial'),
(6, '61987654321', 'comercial'),
(7, '71987654321', 'celular'),
(8, '81987654321', 'residencial'),
(9, '91987654321', 'comercial'),
(10, '11987654321', 'residencial');


-- Dados da tabela 'carros'
INSERT INTO carros (marca_veiculo, modelo_veiculo, ano_veiculo, fabricacao_veiculo, cliente_id) VALUES
('Chevrolet', 'Onix', '2020-01-01', '2020-05-01', 1),
('Fiat', 'Argo', '2019-03-15', '2019-07-10', 2),
('Volkswagen', 'Gol', '2018-06-20', '2018-10-25', 3),
('Ford', 'Ka', '2021-11-10', '2021-12-15', 4),
('Honda', 'Civic', '2020-09-05', '2020-10-20', 5),
('Toyota', 'Corolla', '2022-01-30', '2022-03-10', 6),
('BMW', 'X1', '2021-08-22', '2021-09-15', 7),
('Audi', 'A3', '2020-11-10', '2020-12-05', 8),
('Nissan', 'Kicks', '2023-02-01', '2023-03-15', 9),
('Hyundai', 'HB20', '2022-07-15', '2022-09-10', 10);