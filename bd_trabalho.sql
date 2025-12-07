
CREATE DATABASE trabalho_de_banco_de_dados;

USE trabalho_de_banco_de_dados;

CREATE TABLE Setor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Tipo_de_vaga (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Tipo_veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Portaria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Vaga (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL,
    id_setor INT NOT NULL,
    id_tipo_vaga INT NOT NULL,
    
    UNIQUE KEY uk_vaga_setor (numero, id_setor), 
    
    FOREIGN KEY (id_setor) REFERENCES Setor(id),
    FOREIGN KEY (id_tipo_vaga) REFERENCES Tipo_de_vaga(id)
);

CREATE TABLE Caixa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    id_funcionario INT NOT NULL UNIQUE, 
    
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id)
);

CREATE TABLE Porteiro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    id_portaria INT NOT NULL, 
    
    FOREIGN KEY (id_portaria) REFERENCES Portaria(id)
);

CREATE TABLE Veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    id_tipo_veiculo INT,
    
    FOREIGN KEY (id_tipo_veiculo) REFERENCES Tipo_veiculo(id)
);

CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    id_veiculo INT,
    
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id)
);


INSERT INTO Setor (nome) VALUES
('A - Térreo'), ('B - Subsolo 1'), ('C - Subsolo 2'), ('D - Cobertura'), ('E - Visitantes'),
('F - Entregas'), ('G - Cargas'), ('H - Motos'), ('I - Bicicletas'), ('J - Funcionários'),
('K - Vip'), ('L - Serviço'), ('M - Garagem 1'), ('N - Garagem 2'), ('O - Garagem 3'),
('P - Garagem 4'), ('Q - Comercial'), ('R - Residencial'), ('S - Lazer'), ('T - Administrativo'),
('U - Área Restrita'), ('V - Área de Manobra'); 

INSERT INTO Tipo_de_vaga (tipo) VALUES
('Padrão'), ('Carro Grande'), ('Moto'), ('Caminhonete'), ('Elétrica'), 
('PCD'), ('Carga/Descarga'), ('Rotativo'), ('Reservada A'), ('Reservada B'),
('Prioritária'), ('Privativa 1'), ('Privativa 2'), ('Premium'), ('Comum 1'),
('Comum 2'), ('Comum 3'), ('Emergência'), ('Manutenção'), ('Curta Duração'),
('Exclusiva'), ('Temporária'); 

INSERT INTO Tipo_veiculo (tipo) VALUES
('Sedan'), ('SUV'), ('Hatch'), ('Picape'), ('Van'),
('Moto'), ('Caminhão'), ('Ciclomotor'), ('Bicicleta'), ('Esportivo'),
('Elétrico'), ('Híbrido'), ('Utilitário'), ('Clássico'), ('Pequeno'),
('Médio'), ('Grande'), ('Luxo'), ('Popular'), ('Familiar'),
('Caminhão Baú'), ('Micro-Ônibus'); 

INSERT INTO Funcionario (nome, documento) VALUES
('Ana Clara Lima', '12345678901'), ('Bruno Costa', '23456789012'), ('Carla Dias', '34567890123'),
('Daniela Rocha', '45678901234'), ('Eduardo Souza', '56789012345'), ('Fernanda Gomes', '67890123456'),
('Gabriel Nunes', '78901234567'), ('Heloisa Braga', '89012345678'), ('Igor Mendes', '90123456789'),
('Juliana Alves', '01234567890'), ('Lucas Oliveira', '11234567890'), ('Mariana Pereira', '22234567890'),
('Nicolas Santos', '33234567890'), ('Olivia Ferreira', '44234567890'), ('Paulo Rodrigues', '55234567890'),
('Quiteria Barbosa', '66234567890'), ('Renato Castro', '77234567890'), ('Sofia Lima', '88234567890'),
('Thiago Mendes', '99234567890'), ('Ursula Viana', '00234567890'),
('Vitor Souza', '10234567890'), ('Wilson Neves', '20234567890');

INSERT INTO Portaria (nome) VALUES
('Principal'), ('Secundária'), ('Serviço'), ('Subsolo'), ('Cargas'),
('Entregas'), ('Bloco A'), ('Bloco B'), ('Bloco C'), ('Residencial'),
('Comercial'), ('Social'), ('Fundos'), ('Lateral A'), ('Lateral B'),
('Área de Lazer'), ('Garagem Principal'), ('Setor Leste'), ('Setor Oeste'), ('Entrada Externa'),
('Acesso Visitantes'), ('Acesso Funcionários'); 

INSERT INTO Caixa (nome, id_funcionario) VALUES
('Caixa 1 - Manhã', 1), ('Caixa 2 - Manhã', 2), ('Caixa 3 - Tarde', 3), ('Caixa 4 - Tarde', 4),
('Caixa 5 - Noite', 5), ('Caixa 6 - Noite', 6), ('Caixa 7 - Principal', 7), ('Caixa 8 - Reserva', 8),
('Caixa 9 - Setor A', 9), ('Caixa 10 - Setor B', 10), ('Caixa 11 - Portaria 1', 11), ('Caixa 12 - Portaria 2', 12),
('Caixa 13 - Expedição', 13), ('Caixa 14 - Administrativo', 14), ('Caixa 15 - Saída', 15), ('Caixa 16 - Entrada', 16),
('Caixa 17 - Cargas', 17), ('Caixa 18 - Financeiro', 18), ('Caixa 19 - Auxiliar', 19), ('Caixa 20 - Última Saída', 20),
('Caixa 21 - Novo', 21), ('Caixa 22 - Extra', 22); 

INSERT INTO Porteiro (nome, documento, id_portaria) VALUES
('Roberto Silva', '33344455501', 1), ('Aline Souza', '44455566602', 2), ('Marcos Pereira', '55566677703', 3),
('Leticia Gomes', '66677788804', 4), ('João Costa', '77788899905', 5), ('Maria Dias', '88899900006', 6),
('Pedro Rocha', '99900011107', 7), ('Julia Lima', '00011122208', 8), ('Guilherme Santos', '10121233309', 9),
('Bianca Oliveira', '20232344410', 10), ('Felipe Mendes', '30343455511', 11), ('Amanda Alves', '40454566612', 12),
('Rafael Nunes', '50565677713', 13), ('Camila Ferreira', '60676788814', 14), ('Vinicius Braga', '70787899915', 15),
('Larissa Castro', '80898900016', 16), ('Thiago Silva', '90909011117', 17), ('Giovanna Lima', '01020233318', 18),
('Matheus Santos', '12131344419', 19), ('Helena Oliveira', '23242455520', 20),
('André Gomes', '34353566621', 21), ('Beatriz Rocha', '45464677722', 22); 

INSERT INTO Vaga (numero, id_setor, id_tipo_vaga) VALUES
('A01', 1, 1), ('A02', 1, 2), ('B01', 2, 3), ('B02', 2, 4), ('C01', 3, 5),
('C02', 3, 6), ('D01', 4, 7), ('D02', 4, 8), ('E01', 5, 9), ('E02', 5, 10),
('F01', 6, 11), ('F02', 6, 12), ('G01', 7, 13), ('G02', 7, 14), ('H01', 8, 15),
('H02', 8, 16), ('I01', 9, 17), ('I02', 9, 18), ('J01', 10, 19), ('J02', 10, 20),
('K01', 11, 21), ('L01', 12, 22); 

INSERT INTO Veiculo (placa, modelo, id_tipo_veiculo) VALUES
('ABC1D23', 'Toyota Corolla', 1), ('XYZ9A87', 'Hyundai HB20', 3), ('GHI4J56', 'VW Saveiro', 4),
('KLM7N89', 'Ford Ranger', 4), ('OPQ0R12', 'Honda Civic', 1), ('STU3V45', 'Chevrolet Onix', 3),
('WXY6Z78', 'Nissan Kicks', 2), ('BCD9E01', 'Renault Kwid', 3), ('FGH2I34', 'Jeep Renegade', 2),
('JKL5M67', 'Fiat Strada', 4), ('NOP8Q90', 'Yamaha Fazer', 6), ('RST1U23', 'Volvo FH', 7),
('VWX4Y56', 'BMW X1', 2), ('ZAB7C89', 'Mercedes C180', 1), ('DEF0G12', 'Tesla Model 3', 11),
('HIJ3K45', 'VW T-Cross', 2), ('LMN6O78', 'Ford Ka', 3), ('PQR9S01', 'Fiat Toro', 4),
('TUV2W34', 'Hyundai Azera', 1), ('XYZ5A67', 'Kia Soul', 3),
('BCA1D2E', 'Kawasaki Ninja', 6), ('CDE3F4G', 'VW Gol', 3); 

INSERT INTO Cliente (nome, documento, id_veiculo) VALUES
('Carlos Henrique', '11111111111', 1), ('Mariana Santos', '22222222222', 2), ('Ricardo Melo', '33333333333', 3),
('Patrícia Costa', '44444444444', 4), ('Fernando Lima', '55555555555', 5), ('Giovana Alves', '66666666666', 6),
('Marcelo Nunes', '77777777777', 7), ('Sabrina Rocha', '88888888888', 8), ('Elias Braga', '99999999999', 9),
('Laura Mendes', '00000000000', 10), ('Vinícius Sousa', '10101010101', 11), ('Beatriz Pereira', '20202020202', 12),
('Diego Ferreira', '30303030303', 13), ('Carla Rodrigues', '40404040404', 14), ('Alexandre Viana', '50505050505', 15),
('Sofia Barbosa', '60606060606', 16), ('Renato Castro', '70707070707', 17), ('Juliana Lima', '80808080808', 18),
('Thiago Oliveira', '90909090909', 19), ('Aline Gomes', '12312312312', 20),
('Márcia Cruz', '32132132132', 21), ('André Lemos', '43243243243', 22); 


SELECT 
    C.nome AS Cliente,
    V.placa AS Placa,
    TV.tipo AS Tipo_Veiculo
FROM 
    Cliente C
INNER JOIN 
    Veiculo V ON C.id_veiculo = V.id
INNER JOIN
    Tipo_veiculo TV ON V.id_tipo_veiculo = TV.id;


SELECT 
    P.nome AS Nome_Portaria,
    T.nome AS Nome_Porteiro
FROM 
    Portaria P
LEFT JOIN 
    Porteiro T ON P.id = T.id_portaria;


SELECT 
    F.nome AS Nome_Funcionario,
    C.nome AS Nome_Caixa
FROM 
    Caixa C
RIGHT JOIN 
    Funcionario F ON C.id_funcionario = F.id;


SELECT 
    CONCAT(S.nome, ' - ', V.numero) AS Vaga_Completa,
    T.tipo AS Classificacao_Vaga
FROM 
    Vaga V
LEFT JOIN 
    Setor S ON V.id_setor = S.id
LEFT JOIN 
    Tipo_de_vaga T ON V.id_tipo_vaga = T.id;


SELECT 
    T.documento AS Documento_Porteiro,
    P.nome AS Local_Trabalho
FROM 
    Porteiro T
INNER JOIN 
    Portaria P ON T.id_portaria = P.id;
    
    
    
    SELECT 
    nome, 
    documento
FROM 
    Cliente
WHERE 
    id_veiculo IN (
        SELECT id 
        FROM Veiculo 
        WHERE id_tipo_veiculo = (
            SELECT id 
            FROM Tipo_veiculo 
            WHERE tipo = 'SUV'
        )
    );


SELECT 
    nome, 
    documento
FROM 
    Funcionario
WHERE 
    id > (
        SELECT AVG(id) 
        FROM Funcionario
    );


SELECT 
    nome AS Setor_com_Vaga_PCD
FROM 
    Setor S
WHERE 
    EXISTS (
        SELECT 1
        FROM Vaga V
        WHERE V.id_setor = S.id AND V.id_tipo_vaga = 6
    );
    
    
    SELECT 
    P.nome AS Nome_Portaria,
    COUNT(T.id) AS Total_Porteiros
FROM 
    Portaria P
LEFT JOIN 
    Porteiro T ON P.id = T.id_portaria
GROUP BY 
    P.nome
ORDER BY 
    Total_Porteiros DESC;


SELECT 
    TV.tipo AS Tipo_Veiculo,
    COUNT(V.id) AS Total_Veiculos
FROM 
    Tipo_veiculo TV
INNER JOIN 
    Veiculo V ON TV.id = V.id_tipo_veiculo
GROUP BY 
    TV.tipo
HAVING 
    COUNT(V.id) > 3
ORDER BY 
    Total_Veiculos DESC;