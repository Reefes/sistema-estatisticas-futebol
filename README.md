# ⚽ Sistema de Estatísticas de Futebol (SQL)

Um projeto focado em modelagem relacional e construção de consultas estruturadas (Queries) utilizando SQL. O objetivo deste banco de dados é simular o back-end de um portal esportivo, registrando clubes, jogadores, histórico de partidas e eventos em campo (como gols).

## 🛠️ Tecnologias Utilizadas
* **SQL** (DDL, DML, DQL)
* Modelagem de Banco de Dados Relacional

## 🗂️ Estrutura do Banco de Dados
O esquema foi desenhado com quatro tabelas principais para garantir a integridade referencial dos dados:

1. **`Clubes`**: Armazena as informações dos times.
2. **`Jogadores`**: Tabela associada aos Clubes via Chave Estrangeira (`FOREIGN KEY`).
3. **`Partidas`**: Registra os confrontos. Utiliza duas chaves estrangeiras apontando para a tabela de Clubes (Mandante e Visitante).
4. **`Eventos`**: Registra as ações dentro do jogo (ex: Gols), cruzando dados do Jogador e da Partida.

## 🚀 Destaques Técnicos do Código
No script `banco_estatisticas.sql`, você encontrará a aplicação prática de:
* **Relacionamentos Complexos:** Uso de `JOIN` com *Aliases* (ex: conectando a mesma tabela duas vezes para definir quem é o time mandante e o visitante).
* **Funções de Agregação:** Utilização de `COUNT()` combinado com `GROUP BY` e `ORDER BY` para gerar relatórios analíticos dinâmicos, como a tabela de artilheiros do campeonato.

## ⚙️ Como Executar
Basta rodar o conteúdo do arquivo `banco_estatisticas.sql` em qualquer SGBD compatível com SQL padrão (como MySQL ou PostgreSQL). O script já inclui a criação estrutural, a inserção de dados de teste (Seed) e os relatórios de validação no final.
