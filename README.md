# revenda-cosmeticos 🌸🧴💖
# db_revenda_mariaeduarda

Este repositório contém a modelagem e o script em postgres sql de um banco de dados para minha loja de revenda de cosméticos.

A loja tem como objetivo revender cosméticos variados como perfumes, cremes, maquiagens e produtos de cuidados pessoais, oferecendo preços acessíveis e produtos de qualidade.

## estrutura do banco de dados

- O banco de dados foi criado com o nome **db_revenda_mariaeduarda**  
- Possui 6 tabelas principais, sendo uma delas de ligação (tabela venda_produto com chave primária composta)  
- Cada tabela contém pelo menos 5 atributos com restrições como not null, unique e default  
- Foram criadas 2 views para facilitar consultas de uso no sistema  

## tabelas criadas

- Categorias: armazena os tipos de cosméticos  
- Produtos: lista os cosméticos disponíveis para venda  
- Clientes: informações dos clientes  
- Vendedores: dados dos vendedores da loja  
- Vendas: informações de cada venda realizada  
- Venda_produto: tabela de ligação entre vendas e produtos  

## views

- vw_produtos_categoria: retorna produtos junto de suas categorias  
- vw_vendas_clientes: mostra vendas realizadas junto aos dados do cliente  

## inserts

Foram adicionados 10 registros em cada tabela para simular o funcionamento da loja.


<img width="729" height="854" alt="cosmeticos" src="https://github.com/user-attachments/assets/888afe38-c4c3-459b-a238-e74604e80817" />

