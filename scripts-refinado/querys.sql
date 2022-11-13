USE ecommercedio;

-- Quantos pedidos foram feitos por cada cliente?
select CONCAT(c.Fname, ' ', c.Lname) as 'Cliente', count(o.idOrderClient) as 'Quantidade de Pedidos'
from orders as o join clients as c on o.idOrderClient=c.idClient
group by c.idClient
order by count(o.idOrderClient) desc, c.Fname;

-- Quantidade de compras  feitas via aplicaitvo e pagamento feito em cartão de crédito
select count(*) as 'Quantidade'
from orders
where idOrderPayment=4 and orderDescription like 'compra via aplicativo';

-- Algum vendedor também é fornecedor?
select distinct v.socialName
from seller as v join supplier as f on v.idSellerCnpj = f.idSupplierCnpj
order by v.socialName;

-- Relação de produtos fornecedores e estoques
select p.pDescription as 'Produto'
	,s.socialName as 'Fornecedor'
    ,ps.quantity as 'Quantidade em estoque'
from productSupplier as ps join product as p on ps.idPsProduct=p.idProduct
	join supplier as s on ps.idPsSupplier=s.idSupplier
order by p.pDescription;

-- Relação de produtos fornecedores que possurm em estoque entre 130 e 160
select p.pDescription as 'Produto'
	,s.socialName as 'Fornecedor'
    ,ps.quantity as 'Quantidade em estoque'
from productSupplier as ps join product as p on ps.idPsProduct=p.idProduct
	join supplier as s on ps.idPsSupplier=s.idSupplier
group by p.pDescription,s.socialName
having ps.quantity >= 130 and ps.quantity <= 160
order by p.pDescription;

-- Relação de nomes dos fornecedores e nomes dos produtos
select s.socialName as 'Razão Social'
	,pj.abstName as 'Sigla'
	,p.pDescription as 'Produto'
from productSupplier as ps join product as p on ps.idPsProduct=p.idProduct
	join supplier as s on ps.idPsSupplier=s.idSupplier
    join pessoa_juridica as pj on pj.idPj = s.idSupplierCnpj
order by s.socialName;
