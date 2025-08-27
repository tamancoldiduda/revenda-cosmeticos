select * from clientes
where nome like 'm%';

explain select * from clientes
where nome like 'm%';

drop index if exists idx_clientes_nome;

create index idx_clientes_nome on clientes(nome);

explain select * from clientes
where nome like 'm%';


alter table clientes
alter column telefone type int using telefone::integer;


alter table clientes
alter column telefone type bigint using telefone::bigint;

alter table clientes
alter column cpf type varchar;


do $$
begin
   if not exists (select from pg_catalog.pg_user where usename = 'duda') then
      create user duda with password '12345';
   end if;
end
$$;

do $$
begin
   if not exists (select from pg_catalog.pg_user where usename = 'colega') then
      create user colega with password '12345';
   end if;
end
$$;


grant all privileges on all tables in schema public to duda;
grant select on clientes to colega;


select * from clientes;

insert into clientes (nome, cpf) values ('teste', '00000000000');
update clientes set nome = 'erro' where id_cliente = 1;
delete from clientes where id_cliente = 1;


select * from clientes;
insert into clientes (nome, cpf, telefone) values ('teste', '00000000011', '11999990011');
update clientes set nome = 'teste2' where id_cliente = 1;
delete from clientes where id_cliente not in (select id_cliente from vendas);

--Consultas com JOINs

-- inner join
select c.nome, v.id_venda, v.valor_total
from clientes c
inner join vendas v on c.id_cliente = v.id_cliente;

-- left join
select c.nome, v.id_venda, v.valor_total
from clientes c
left join vendas v on c.id_cliente = v.id_cliente;

-- right join
select c.nome, v.id_venda, v.valor_total
from clientes c
right join vendas v on c.id_cliente = v.id_cliente;

-- inner join
select v.id_venda, vp.id_produto, vp.quantidade
from vendas v
inner join venda_produto vp on v.id_venda = vp.id_venda;

-- left join
select v.id_venda, vp.id_produto, vp.quantidade
from vendas v
left join venda_produto vp on v.id_venda = vp.id_venda;

-- right join
select v.id_venda, vp.id_produto, vp.quantidade
from vendas v
right join venda_produto vp on v.id_venda = vp.id_venda;

-- inner join
select p.nome as produto, c.nome as categoria
from produtos p
inner join categorias c on p.id_categoria = c.id_categoria;

-- left join
select p.nome as produto, c.nome as categoria
from produtos p
left join categorias c on p.id_categoria = c.id_categoria;

-- right join
select p.nome as produto, c.nome as categoria
from produtos p
right join categorias c on p.id_categoria = c.id_categoria;

-- inner join
select p.nome as produto, f.nome as fornecedor
from produtos p
inner join fornecedores f on p.id_fornecedor = f.id_fornecedor;

-- left join
select p.nome as produto, f.nome as fornecedor
from produtos p
left join fornecedores f on p.id_fornecedor = f.id_fornecedor;

-- right join
select p.nome as produto, f.nome as fornecedor
from produtos p
right join fornecedores f on p.id_fornecedor = f.id_fornecedor;


update clientes
set telefone = null
where id_cliente in (1,2,3);

