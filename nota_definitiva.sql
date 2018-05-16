DROP DATABASE prueba2
create DATABASE prueba2
use prueba2

use persona
create table alumno(
    codigo varchar(30) not null,,
    nombre varchar(30),
    apellidos varchar(30),
    programa varchar(30),
    correo varchar(30),
    direccion varchar(60),
    nota1 float,
    nota2 float,
    nota3 float,
    nota_definitiva float
    -- 10 campos
);

insert into alumno values (201513031601,'Nestor','Robayo Gomez','Ingenieria de Sistemas','narobayog@libertadores.edu.co','av 127 15 65',3.5,4.6,3.8);


create table alumno (
codigo varchar(30) not null,
nombre varchar(30),
apellidos varchar(30),
programa varchar(30),
correo varchar(30),
nota1 float,
nota2 float,
nota3 float
);

create function calcDefinitiva(@cod bigint)
	returns varchar(max)
	as 
	begin
	declare @nom varchar(30)
	declare @pn float
	declare @sn float
	declare @tn float
	declare @def varchar(max)
	declare @def2 varchar(max)
	declare @res float
	select @nom = nombre, @pn = nota1, @sn = nota2, @tn = nota2 from alumno where codigo = @cod
	set @res = (@pn*0.3) + (@sn*0.3) + (@tn*0.4)
	set @def = 'Nombre = '+ cast(@nom as varchar(max)) +'  Primera Nota = '+ cast(@pn as varchar(max)) +'  Segunda Nota = '+ cast(@sn as varchar(max))
				+'  Tercer Nota = '+ cast(@tn as varchar(max)) +'  Definitiva = '+ cast(@res as varchar(max))
	if @res >=3
		begin
		set @def2 = '  Estado = Aprobado'
		end
	else
		begin
		set @def2 = '  Estado = Reprobado'
		end
	set @def = @def + @def2
	return @def
	end

print dbo.calcDefinitiva(201513031601)
