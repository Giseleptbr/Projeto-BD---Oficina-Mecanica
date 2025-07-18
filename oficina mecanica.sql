CREATE DATABASE oficina;
use oficina;

-- Cliente

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    tipo ENUM('PF', 'PJ') NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20)
);

CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    especialidade VARCHAR(100)
);

CREATE TABLE Equipe (
    idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    nome_equipe VARCHAR(100)
);

CREATE TABLE Equipe_Mecanico (
    idEquipe INT,
    idMecanico INT,
    PRIMARY KEY (idEquipe, idMecanico),
    FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe),
    FOREIGN KEY (idMecanico) REFERENCES Mecanico(idMecanico)
);

CREATE TABLE OrdemServico (
    idOrdemServico INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10,2),
    status VARCHAR(50),
    data_conclusao DATE,
    codigo_rastreamento VARCHAR(50),
    id_veiculo INT,
    id_equipe INT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Servico (
    idServico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(150) NOT NULL,
    preco_mao_obra DECIMAL(10,2)
);

CREATE TABLE OS_Servico (
    idOrdemServico INT,
    idServico INT,
    quantidade INT,
    valor_total DECIMAL(10,2),
    PRIMARY KEY (idOrdemServico, idServico),
    FOREIGN KEY (idOrdemServico) REFERENCES OrdemServico(idOrdemServico),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);

CREATE TABLE Peca (
    idPeca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(150) NOT NULL,
    preco_unitario DECIMAL(10,2)
);

CREATE TABLE OS_has_Peca (
    idOrdemServico INT,
    idPeca INT,
    quantidade INT,
    valor_total DECIMAL(10,2),
    PRIMARY KEY (idOrdemServico, idPeca),
    FOREIGN KEY (idOrdemServico) REFERENCES OrdemServico(idOrdemServico),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);

-- Tabela Cliente
INSERT INTO Cliente (nome, cpf_cnpj, tipo, endereco, telefone) VALUES
  ('Ana Sophia Araújo', '438.150.926-98', 'PF', 'Favela Dias, Santa Rita De Cássia, 83863794 da Cruz / RR', '(011) 5423-5116'),
  ('João Gabriel Monteiro', '940.538.716-20', 'PF', 'Vale de Moreira, 131, Vila Ecológica, 41316475 Moura / MS', '+55 (084) 4192-8327'),
  ('Emanuelly das Neves', '50.368.271/0001-72', 'PJ', 'Largo de da Rosa, 86, Concórdia, 23884-969 Moreira de Goiás / BA', '31 7101-2269'),
  ('João Pedro Nascimento', '974.805.231-14', 'PF', 'Esplanada Ana Vitória Almeida, 38, Santa Sofia, 48932528 Martins / PR', '+55 (031) 1543 0391'),
  ('Thomas Rodrigues', '182.953.647-82', 'PF', 'Vila de da Paz, 66, Ouro Minas, 13315-098 das Neves / AC', '+55 11 0310 5183'),
  ('Raul Rodrigues', '382.546.901-89', 'PF', 'Colônia Pinto, 76, Pirineus, 10651333 Cunha de Pereira / CE', '+55 84 7317-8108');

-- Tabela Veiculo
INSERT INTO Veiculo (placa, marca, modelo, ano, id_cliente) VALUES
  ('CYH-2677', 'Hyundai', 'Uno', 2022, 1),
  ('MBF-6064', 'Toyota', 'Gol', 2006, 1),
  ('JNW-8723', 'Fiat', 'Ka', 2012, 5),
  ('GBS-8050', 'Toyota', 'Uno', 2022, 2),
  ('SPQ-8208', 'Hyundai', 'HB20', 2022, 4),
  ('FCT-1361', 'Ford', 'Gol', 2023, 3);

-- Tabela Mecanico
INSERT INTO Mecanico (nome, endereco, especialidade) VALUES
  ('Elisa Barbosa', 'Pátio Silveira, 44', 'Motor'),
  ('Raquel Lopes', 'Passarela Francisco Jesus, 25', 'Freios'),
  ('Lorenzo Castro', 'Favela de Santos', 'Diagnóstico'),
  ('Cauê Monteiro', 'Núcleo Gomes', 'Transmissão'),
  ('Leonardo Viana', 'Vale Manuela Souza, 9', 'Suspensão'),
  ('Rafael Cavalcanti', 'Condomínio Enrico Vieira, 54', 'Suspensão');

-- Tabela Equipe
INSERT INTO Equipe (nome_equipe) VALUES
  ('Equipe A'),
  ('Equipe B'),
  ('Equipe C'),
  ('Equipe D'),
  ('Equipe E'),
  ('Equipe F');

-- Tabela Equipe_Mecanico
INSERT INTO Equipe_Mecanico (idEquipe, idMecanico) VALUES
  (2, 2),
  (3, 1),
  (1, 4),
  (1, 3),
  (3, 5);

-- Tabela Servico
INSERT INTO Servico (descricao, preco_mao_obra) VALUES
  ('Troca de óleo', 100.0),
  ('Alinhamento', 120.0),
  ('Revisão de freios', 180.0),
  ('Balanceamento', 110.0),
  ('Diagnóstico eletrônico', 150.0),
  ('Substituição de bateria', 200.0);

-- Tabela Peca
INSERT INTO Peca (descricao, preco_unitario) VALUES
  ('Filtro de óleo', 30.0),
  ('Pastilha de freio', 90.0),
  ('Velas', 60.0),
  ('Correia dentada', 120.0),
  ('Bateria 60Ah', 350.0),
  ('Amortecedor', 210.0);

-- Tabela OrdemServico
INSERT INTO OrdemServico (data_emissao, valor_total, status, data_conclusao, codigo_rastreamento, id_veiculo, id_equipe) VALUES
  ('2025-07-17', 664.87, 'Concluída', '2025-07-19', 'R227BR58', 1, 5),
  ('2025-07-04', 446.59, 'Concluída', '2025-07-08', 'R733BR56', 5, 2),
  ('2025-06-30', 652.29, 'Pendente', NULL, 'R777BR39', 3, 1),
  ('2025-07-12', 727.66, 'Pendente', NULL, 'R489BR45', 4, 6),
  ('2025-07-11', 717.06, 'Pendente', NULL, 'R479BR55', 2, 6),
  ('2025-06-30', 433.49, 'Concluída', '2025-07-02', 'R763BR19', 5, 6);

-- Tabela OS_Servico
INSERT INTO OS_Servico (idOrdemServico, idServico, quantidade, valor_total) VALUES
  (2, 5, 1, 200.0),
  (2, 2, 1, 110.0),
  (4, 3, 1, 200.0),
  (6, 5, 1, 120.0),
  (6, 3, 1, 100.0),
  (3, 1, 1, 150.0);

-- Tabela OS_has_Peca
INSERT INTO OS_has_Peca (idOrdemServico, idPeca, quantidade, valor_total) VALUES
  (4, 3, 1, 90.0),
  (5, 6, 2, 90.0),
  (6, 4, 2, 210.0),
  (4, 2, 2, 90.0),
  (2, 6, 2, 210.0),
  (3, 1, 1, 60.0);

-- Recuperações simples com SELECT
SELECT nome, telefone FROM Cliente;

-- Filtros com WHERE
SELECT * FROM OrdemServico
WHERE status = 'Concluída';

-- Expressões para gerar atributos derivados (exemplo: valor médio por item da OS)
SELECT 
  idOrdemServico,
  quantidade,
  valor_total,
  (valor_total / quantidade) AS valor_unitario_estimado
FROM OS_has_Peca;

-- Ordenação dos dados com ORDER BY (ordena as ordens de serviço pelo valor total, do maior para o menor)
SELECT idOrdemServico, valor_total
FROM OrdemServico
ORDER BY valor_total DESC;

-- Condições de filtros aos grupos – HAVING (Exibir apenas OS com soma de peças superior a 300)
SELECT 
  idOrdemServico,
  SUM(valor_total) AS total_pecas
FROM OS_has_Peca
GROUP BY idOrdemServico
HAVING total_pecas > 300;

-- Junções entre tabelas – JOIN (Exibir dados da OS com nome do cliente, veículo e equipe)
SELECT 
  os.idOrdemServico,
  c.nome AS cliente,
  v.placa,
  e.nome_equipe,
  os.status,
  os.valor_total
FROM OrdemServico os
JOIN Veiculo v ON os.id_veiculo = v.idVeiculo
JOIN Cliente c ON v.id_cliente = c.idCliente
JOIN Equipe e ON os.id_equipe = e.idEquipe;

