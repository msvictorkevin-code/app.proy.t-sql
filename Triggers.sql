select * from compaņiasdeenvios


create table tm_Compaņias (
idCompaņia int primary key identity,
Nombre varchar(60) not null,
Telefono varchar(60) not null
);

go
create trigger tgr_HistorialCompaņias
on compaņiasdeenvios
instead of insert
as
begin
	insert into tm_Compaņias (Nombre,Telefono) 
	select nombreCompaņia,telefono from inserted
end
go

insert compaņiasdeenvios  values (20,'AAAAA','dasdsd');

select * from tm_Compaņias

go
create trigger tgr_DescontarStockProductos
on detallesdepedidos
instead of insert
as
begin
	update productos set unidadesEnExistencia = unidadesEnExistencia - (select cantidad from inserted)
	where idproducto = (select idproducto from inserted)

end
go

select * from productos
select * from detallesdepedidos

insert detallesdepedidos values ('11077',75,8,50,0);