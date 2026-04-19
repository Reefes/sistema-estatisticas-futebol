-- ==========================================
-- PROJETO: SISTEMA DE ESTATÍSTICAS DE FUTEBOL
-- ==========================================

-- 1. CRIAÇÃO DO BANCO E TABELAS (DDL)
CREATE DATABASE Clubes;
USE Clubes;

CREATE TABLE Clubes (
    id_clube INT PRIMARY KEY, 
    nome VARCHAR (100)
);

CREATE TABLE Jogadores (
    id_jogador INT PRIMARY KEY, 
    nome VARCHAR (100), 
    id_clube INT, 
    FOREIGN KEY (id_clube) REFERENCES Clubes(id_clube)
);

CREATE TABLE Partidas (
    id_partida INT PRIMARY KEY,
    id_clube_mandante INT,
    id_clube_visitante INT,
    gols_mandante INT,
    gols_visitante INT,
    FOREIGN KEY (id_clube_mandante) REFERENCES Clubes(id_clube),
    FOREIGN KEY (id_clube_visitante) REFERENCES Clubes(id_clube)
);

CREATE TABLE Eventos (
    id_evento INT PRIMARY KEY,
    id_partida INT,
    id_jogador INT,
    tipo_evento VARCHAR(30),
    minuto INT,              
    FOREIGN KEY (id_partida) REFERENCES Partidas(id_partida),
    FOREIGN KEY (id_jogador) REFERENCES Jogadores(id_jogador)
);

-- ==========================================
-- 2. POPULANDO O BANCO DE DADOS (DML)
-- ==========================================

INSERT INTO Clubes (id_clube, nome) VALUES 
(1, 'Clube de Regatas do Flamengo'), 
(2, 'Fortaleza Esporte Clube');

INSERT INTO Jogadores (id_jogador, nome, id_clube) VALUES 
(1, 'Pedro', 1), 
(2, 'Lucas Sasha', 2), 
(3, 'Jorginho', 1), 
(4, 'Pierre', 2);

INSERT INTO Partidas (id_partida, id_clube_mandante, id_clube_visitante, gols_mandante, gols_visitante) VALUES 
(1, 1, 2, 2, 1);

INSERT INTO Eventos (id_evento, id_partida, id_jogador, tipo_evento, minuto) VALUES  
(1, 1, 1, 'Gol', 15),  
(2, 1, 3, 'Gol', 82),  
(3, 1, 2, 'Gol', 40);

-- ==========================================
-- 3. CONSULTAS E RELATÓRIOS (DQL)
-- ==========================================

-- Verificação simples das tabelas base
SELECT * FROM Clubes;
SELECT * FROM Jogadores;

-- Relação Simples: Jogadores e seus respectivos times
SELECT 
    Jogadores.nome AS Nome_Jogador, 
    Clubes.nome AS Nome_Time 
FROM Jogadores 
JOIN Clubes ON Jogadores.id_clube = Clubes.id_clube;

-- Relatório de Partida: Placar com os nomes dos times
SELECT  
    Mandante.nome AS Time_Mandante,
    Partidas.gols_mandante AS Gols_Mandante,
    'X' AS Versus, 
    Partidas.gols_visitante AS Gols_Visitante,
    Visitante.nome AS Time_Visitante
FROM Partidas
JOIN Clubes AS Mandante ON Partidas.id_clube_mandante = Mandante.id_clube
JOIN Clubes AS Visitante ON Partidas.id_clube_visitante = Visitante.id_clube;

-- Relatório Analítico: Tabela de Artilheiros
SELECT  
    Jogadores.nome AS Artilheiro,
    Clubes.nome AS Time,
    COUNT(Eventos.id_evento) AS Total_Gols
FROM Jogadores
JOIN Clubes ON Jogadores.id_clube = Clubes.id_clube
JOIN Eventos ON Jogadores.id_jogador = Eventos.id_jogador
WHERE Eventos.tipo_evento = 'Gol'
GROUP BY Jogadores.nome, Clubes.nome
ORDER BY Total_Gols DESC;
