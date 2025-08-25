create database db_revenda_duda;

create table categorias (
    id_categoria serial primary key,
    nome varchar(100) not null unique,
    descricao text,
    ativo boolean not null default true,
    criado_em timestamp default current_timestamp
);

create table fornecedores (
    id_fornecedor serial primary key,
    nome varchar(100) not null,
    cnpj varchar(14) not null unique,
    telefone varchar(20),
    email varchar(100) unique,
    ativo boolean not null default true
);

create table clientes (
    id_cliente serial primary key,
    nome varchar(100) not null,
    cpf varchar(11) not null unique,
    telefone varchar(20),
    email varchar(100) unique,
    criado_em date default current_date
);

create table produtos (
    id_produto serial primary key,
    nome varchar(100) not null,
    preco numeric(10,2) not null check (preco > 0),
    estoque int not null check (estoque >= 0),
    id_categoria int not null references categorias(id_categoria),
    id_fornecedor int not null references fornecedores(id_fornecedor)
);

create table vendas (
    id_venda serial primary key,
    id_cliente int not null references clientes(id_cliente),
    data_venda timestamp default current_timestamp,
    valor_total numeric(10,2) not null check (valor_total >= 0),
    status varchar(20) not null default 'pendente'
);

create table venda_produto (
    id_venda int not null references vendas(id_venda),
    id_produto int not null references produtos(id_produto),
    quantidade int not null check (quantidade > 0),
    preco_unitario numeric(10,2) not null check (preco_unitario > 0),
    primary key (id_venda, id_produto)
);

create view vw_vendas_clientes as
select v.id_venda, c.nome as cliente, v.data_venda, v.valor_total, v.status
from vendas v
join clientes c on v.id_cliente = c.id_cliente;

create view vw_produtos_categoria as
select p.id_produto, p.nome as produto, p.preco, p.estoque, cat.nome as categoria, f.nome as fornecedor
from produtos p
join categorias cat on p.id_categoria = cat.id_categoria
join fornecedores f on p.id_fornecedor = f.id_fornecedor;

insert into categorias (nome, descricao) values
('maquiagem', 'produtos de maquiagem orgânica'),
('cabelos', 'shampoos e condicionadores naturais'),
('pele', 'cuidados faciais e corporais sustentáveis'),
('perfumes', 'fragrâncias veganas'),
('higiene', 'produtos de higiene pessoal ecológicos'),
('acessórios', 'pincéis e acessórios sustentáveis'),
('kits', 'combinações promocionais de produtos'),
('unhas', 'esmaltes veganos e removedores'),
('masculino', 'linha de cuidados masculinos naturais'),
('infantil', 'linha infantil hipoalergênica');

insert into fornecedores (nome, cnpj, telefone, email) values
('eco cosméticos', '12345678000101', '11999990001', 'eco@forn.com'),
('bio beleza', '12345678000102', '11999990002', 'bio@forn.com'),
('green skin', '12345678000103', '11999990003', 'skin@forn.com'),
('natura vida', '12345678000104', '11999990004', 'natura@forn.com'),
('veg beauty', '12345678000105', '11999990005', 'veg@forn.com'),
('beleza eco', '12345678000106', '11999990006', 'beleza@forn.com'),
('sustent cosmetics', '12345678000107', '11999990007', 'sustent@forn.com'),
('pura essência', '12345678000108', '11999990008', 'pura@forn.com'),
('bio aroma', '12345678000109', '11999990009', 'aroma@forn.com'),
('natural line', '12345678000110', '11999990010', 'line@forn.com');

insert into clientes (nome, cpf, telefone, email) values
('ana oliveira', '12345678901', '11988880001', 'ana@email.com'),
('joão silva', '12345678902', '11988880002', 'joao@email.com'),
('maria santos', '12345678903', '11988880003', 'maria@email.com'),
('carlos pereira', '12345678904', '11988880004', 'carlos@email.com'),
('beatriz almeida', '12345678905', '11988880005', 'bia@email.com'),
('fernanda costa', '12345678906', '11988880006', 'fernanda@email.com'),
('ricardo gomes', '12345678907', '11988880007', 'ricardo@email.com'),
('juliana rocha', '12345678908', '11988880008', 'juliana@email.com'),
('pedro martins', '12345678909', '11988880009', 'pedro@email.com'),
('larissa dias', '12345678910', '11988880010', 'larissa@email.com');

insert into produtos (nome, preco, estoque, id_categoria, id_fornecedor) values
('batom vegano', 29.90, 50, 1, 1),
('base orgânica', 59.90, 30, 1, 2),
('shampoo sólido', 24.90, 40, 2, 3),
('condicionador natural', 26.90, 35, 2, 4),
('hidratante facial', 39.90, 25, 3, 5),
('perfume floral', 89.90, 20, 4, 6),
('escova ecológica', 19.90, 60, 6, 7),
('kit skincare', 120.00, 15, 7, 8),
('esmalte vegano', 12.90, 70, 8, 9),
('sabonete infantil', 15.90, 40, 10, 10);

insert into vendas (id_cliente, valor_total, status) values
(1, 59.80, 'concluída'),
(2, 39.90, 'concluída'),
(3, 89.90, 'pendente'),
(4, 120.00, 'concluída'),
(5, 26.90, 'pendente'),
(6, 49.80, 'concluída'),
(7, 19.90, 'concluída'),
(8, 29.90, 'pendente'),
(9, 15.90, 'concluída'),
(10, 59.90, 'pendente');

insert into venda_produto (id_venda, id_produto, quantidade, preco_unitario) values
(1, 1, 2, 29.90),
(2, 5, 1, 39.90),
(3, 6, 1, 89.90),
(4, 8, 1, 120.00),
(5, 4, 1, 26.90),
(6, 3, 2, 24.90),
(7, 7, 1, 19.90),
(8, 1, 1, 29.90),
(9, 10, 1, 15.90),
(10, 2, 1, 59.90);

select * from vw_vendas_clientes;
select * from vw_produtos_categoria;