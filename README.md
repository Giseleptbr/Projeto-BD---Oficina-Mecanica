# Projeto-BD-Oficina-Mecanica
Este projeto foi desenvolvido como parte de um desafio da Digital Innovation One (DIO), com o objetivo de criar um **esquema conceitual e lógico de banco de dados relacional para um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica.

## 🎯 Objetivos do Projeto

- Modelar o banco de dados a partir de uma narrativa realista.
- Criar as tabelas no MySQL com as devidas chaves primárias e estrangeiras.
- Popular as tabelas com dados fictícios.
- Elaborar consultas SQL que representem diferentes operações de recuperação e manipulação de dados.

---

## 🧱 Estrutura de Entidades

As principais entidades do banco de dados são:

- **Cliente**: PF ou PJ que leva veículos à oficina.
- **Veículo**: associado a um cliente.
- **Equipe**: responsável por executar os serviços.
- **Mecânico**: integrante de uma equipe, com especialidade.
- **Ordem de Serviço (OS)**: descreve serviços e peças aplicadas a um veículo.
- **Serviço**: item da tabela de mão de obra.
- **Peça**: itens utilizados durante o conserto.
- **Associações**: Equipe_Mecanico, OS_Servico e OS_has_Peca para representar relacionamentos N:N.

---

## 🛠️ Tabelas Criadas

Foram criadas 10 tabelas no total:

1. `Cliente`
2. `Veiculo`
3. `Mecanico`
4. `Equipe`
5. `Equipe_Mecanico` (associativa)
6. `OrdemServico`
7. `Servico`
8. `Peca`
9. `OS_Servico` (associativa)
10. `OS_has_Peca` (associativa)

---

## 📥 População de Dados

Cada tabela foi populada com **6 registros fictícios**, utilizando dados coerentes com o cenário de uma oficina. Foram utilizadas informações como nomes, placas, datas, valores e status diversos para simular um ambiente real de dados.

---

## 🔍 Consultas SQL Criadas

Para validar o banco, foram criadas **consultas SQL com as cláusulas** abaixo:

### ✔️ `SELECT` simples:
```sql
SELECT nome, telefone FROM Cliente;

### ✔️ WHERE com filtro:
sql

SELECT * FROM OrdemServico WHERE status = 'Concluída';

### ✔️ Atributos derivados (expressão):
sql

SELECT idOrdemServico, (valor_total / quantidade) AS valor_unitario FROM OS_has_Peca;

### ✔️ ORDER BY:
sql
Copiar
Editar
SELECT idOrdemServico, valor_total FROM OrdemServico ORDER BY valor_total DESC;

### ✔️ GROUP BY + HAVING:
sql

SELECT idOrdemServico, SUM(valor_total) AS total_pecas
FROM OS_has_Peca
GROUP BY idOrdemServico
HAVING total_pecas > 300;

### ✔️ JOIN entre várias tabelas:
sql

SELECT os.idOrdemServico, c.nome AS cliente, v.placa, e.nome_equipe, os.status
FROM OrdemServico os
JOIN Veiculo v ON os.id_veiculo = v.idVeiculo
JOIN Cliente c ON v.id_cliente = c.idCliente
JOIN Equipe e ON os.id_equipe = e.idEquipe;

## 🛠️ Ferramentas Utilizadas
MySQL Workbench
MySQL Server
Python (para gerar dados fictícios com Faker)

