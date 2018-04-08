-- Codigo Nestor Robayo
-- Ulibertadores
-- Admin Bases de datos - Clase martes
-- 2018

create database pruebas11;
use pruebas11;

create function valorfuturo( @inversionInicial int)
returns varchar (max)
as 
begin
declare @i int = 1
declare @j int = 1
declare @k int = 1
declare @tasai1 float = 0.05
declare @tasai2 float = 0.07
declare @tasai3 float = 0.09
declare @vfuturop varchar(max) = ''
declare @vfuturop1 varchar(max) = '---- Inversión...............Valor Futuro'+char(10)+char(10)

while @i <=5
	begin
		while @j <=5
			begin
				while @k <=5
					begin
					-- while para k
						set @vfuturop = 'VF = ' + cast(@inversionInicial as varchar(max)) + ' * ( 1 + '+ cast(@tasai1 as varchar(max))+' )^'+ cast(@k as varchar(max)) +' = ' + cast(@inversionInicial * power((1+ @tasai1),@k) as varchar(max)) + char(10)
						set @k = @k + 1
						set @vfuturop1 = @vfuturop1+ @vfuturop
					end
			-- while para j
				set @vfuturop = 'VF = ' + cast(@inversionInicial as varchar(max)) + ' * ( 1 + '+ cast(@tasai2 as varchar(max))+' )^'+ cast(@j as varchar(max)) +' = ' + cast(@inversionInicial * power((1+ @tasai2),@j) as varchar(max)) + char(10)
				set @j = @j + 1
				set @vfuturop1 = @vfuturop1+ @vfuturop
			end

		-- while para i
		set @vfuturop = 'VF = ' + cast(@inversionInicial as varchar(max)) + ' * ( 1 + '+ cast(@tasai3 as varchar(max))+' )^'+ cast(@i as varchar(max)) +' = ' + cast(@inversionInicial * power((1+ @tasai3),@i) as varchar(max)) + char(10)
		set @i = @i + 1
		set @vfuturop1 = @vfuturop1+ @vfuturop
	end
	return @vfuturop1
end

print dbo.valorfuturo(40000)
