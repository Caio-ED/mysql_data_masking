-- Mascara bordas da String
    delimiter $$
	create function mask_outer (frase varchar(100), esquerda int, direita int)
	returns varchar(100)
    begin
		declare posicaoini int;
        declare qtdmostrando int;
        declare qtdescondidos int;
		set posicaoini = esquerda + 1 ;
        set qtdescondidos = esquerda + direita;
        set qtdmostrando = char_length(frase) - qtdescondidos;
		return(
			select concat(repeat('*',esquerda), mid(frase, posicaoini, qtdmostrando), repeat('*', direita))
		);
    end $$ 
    delimiter ;

-- Mascara centro da String    
	delimiter $$    
	create function mask_inner (frase varchar(100), esquerda int, direita int)
	returns varchar(100)
    begin
		declare qtd_nao_ocultos int;
		set qtd_nao_ocultos = esquerda + direita ;
		return(
			select concat(left(frase, esquerda),repeat('*', char_length(frase) - qtd_nao_ocultos),right(frase, direita))
		);
    end $$ 
    delimiter ;
    
-- Mascara Email
    delimiter $$
    create function mask_email (email varchar(100))
		returns varchar(100)
        begin
			declare qtdocultos int;
            declare position_arroba int;
            declare dominio varchar(50);
            declare tamanho_dominio int;
            select instr(email,'@') into position_arroba;
            set qtdocultos = position_arroba - 3;
            set tamanho_dominio = char_length(email) - qtdocultos;
            select substring(email, position_arroba, tamanho_dominio) into dominio;
			return(
				select concat(left(email,2 ), repeat('*', qtdocultos), dominio)
            );
        end $$
	delimiter ;
    
-- Mascara Telefone
    delimiter $$
		create function mask_tel (tel_sem_mascara varchar(20), mask varchar(1))
		returns varchar(20)
        begin
			declare tel_numeros varchar(20);
            declare tamanho_numero int;
            set tel_numeros = replace( replace( replace(tel_sem_mascara,'(',''), ')',''), '-','');
            set tamanho_numero = char_length(tel_numeros);
            if(tamanho_numero > 9) then
				return(select concat('(', substring(tel_numeros,1,2),')', repeat(mask, tamanho_numero - 2)));
			else
				return(select repeat(mask, tamanho_numero));
            end if;
		end $$
    delimiter ;

-- Inteiro Aleatorio
    delimiter $$
		create function gen_int(inicio int, limite int)
        returns int
        begin
			return(FLOOR(RAND() * (limite - inicio + 1)) + inicio);
        end $$
	delimiter ;
    
-- Decimal Aleatorio
    delimiter $$
		create function gen_decimal(inicio int, limite int)
        returns decimal(12,2)
        begin
			return(RAND() * (limite - inicio + 1) + inicio);
        end $$
	delimiter ;
    
-- Telefone Aleatorio
    delimiter $$
		create function gen_tel()
        returns varchar(20)
        begin
			declare digitos1 varchar(4);
			declare digitos2 varchar(4);
            declare codigoarea varchar(2);
            set digitos1 = concat( FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10));
            set digitos2 = concat( FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10));
            set codigoarea = concat( FLOOR(RAND() * 10), FLOOR(RAND() * 10));
			return(concat('(',codigoarea,')', digitos1, '-', digitos2 ));
        end $$
	delimiter ;
    
-- CEP Aleatorio
    delimiter $$
    create function gen_cep()
    returns varchar(20)
    begin
		declare dig5 varchar(5);
		declare dig3 varchar(3);
		set dig5 = concat(FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10));
		set dig3 = concat(FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10));
        return(concat(dig5,'-',dig3));
    end $$
    delimiter ;
    
-- Data Aleatoria
    delimiter $$
    create function gen_date(datai varchar(10),dataf varchar(10), formato varchar(40))
    returns varchar(100)
    begin
		declare ano_ini varchar(4); declare mes_ini varchar(2); declare dia_ini varchar(2);
        declare ano_fim varchar(4); declare mes_fim varchar(2); declare dia_fim varchar(2);
		declare stamp_inicio int; declare stamp_fim int; declare stamp_gerado int;
        set ano_ini = right(datai,4); set mes_ini = mid(datai,4,2); set dia_ini = left(datai,2);
        set ano_fim = right(dataf,4); set mes_fim = mid(dataf,4,2); set dia_fim = left(dataf,2);
		set stamp_inicio = unix_timestamp(concat(ano_ini,'-',mes_ini,'-',dia_ini));
        set stamp_fim = unix_timestamp(concat(ano_fim,'-',mes_fim,'-',dia_fim));
        set stamp_gerado = gen_int(stamp_inicio,stamp_fim);
        return(from_unixtime(stamp_gerado,formato));
    end $$
    delimiter ;
    
-- Horario Aleatorio
    delimiter $$
    create function gen_time(timei varchar(10),timef varchar(10),formato varchar(50))
    returns varchar(100)
    begin
		declare hora_ini varchar(2); declare min_ini varchar(2); declare seg_ini varchar(2);
        declare hora_fim varchar(2); declare min_fim varchar(2); declare seg_fim varchar(2);
		declare stamp_inicio int; declare stamp_fim int; declare stamp_gerado int;
        set hora_ini = left(timei,2); set min_ini = mid(timei,4,2); set seg_ini = right(timei,2);
        set hora_fim = left(timef,2); set min_fim = mid(timef,4,2); set seg_fim = right(timef,2);
		set stamp_inicio = unix_timestamp(concat('1970-01-01 ',hora_ini,':',min_ini,':',seg_ini));
        set stamp_fim = unix_timestamp(concat('1970-01-01 ',hora_fim,':',min_fim,':',seg_fim));
        set stamp_gerado = gen_int(stamp_inicio,stamp_fim);
        return(from_unixtime(stamp_gerado, formato));
    end $$
    delimiter ;
    
-- Letra aleatoria    
    delimiter $$
    create function gen_char(formato varchar(5))
    returns char
    begin
		declare chars_possiveis text default '';
			if instr(formato,'u') >= 1 then
				set chars_possiveis = concat(chars_possiveis, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
            end if;    
			if instr(formato,'l') >= 1 then
				set chars_possiveis = concat(chars_possiveis, 'abcdefghijklmnopqrstuvwxyz');
            end if;    
			if instr(formato,'*') >= 1 then
				set chars_possiveis = concat(chars_possiveis, '!@#$%&*+=');
			end if;
            if instr(formato,'n') >= 1 then
				set chars_possiveis = concat(chars_possiveis, '0123456789');
			end if;
       return (substring(chars_possiveis, gen_int(1,char_length(chars_possiveis)),1));
    end $$
    delimiter ;
    
-- String Aleatoria
	delimiter $$
    create function gen_string(tamanho int,formato varchar(5))
    returns varchar(100)
    begin
    DECLARE contador INT DEFAULT 0;	
    declare palavra varchar(100) default '';
    declare palavra2 varchar(100);
	loops: LOOP
		SET contador = contador + 1;
        set palavra2 = concat(gen_char(formato), palavra);
        set palavra = palavra2;
		IF contador >= tamanho THEN
			LEAVE loops;
		END IF;
	END LOOP loops;
		return (palavra);
    end $$
    delimiter ;
    
-- Tipo sanguineo aleatorio
	delimiter $$
	create function gen_tiposangue()
		returns varchar(3)
		begin
			return(elt(ceiling(rand() * 8), 'A+','B+','AB+','O+','A-','B-','AB-','O-'));
		end $$
	delimiter ;

-- Email aleatorio
	delimiter $$
	create function gen_email()
		returns varchar(50)
		begin
			return(concat(gen_string(gen_int(6,20),'uln'),'@',elt(ceiling(rand() * 5) ,"gmail.com","hotmail.com","exemplo.com","yahoo.com","icloud.com")));
		end $$
	delimiter ;
    
-- Nome aleatorio
	delimiter $$
	create function gen_nome()
		returns varchar(50)
		begin
			return(concat(elt(ceiling(rand() * 6), 'Fulano','Fulana','Cicrano','Cicrana','Beltrano','Beltrana'), ' ', gen_string(3,'un'), ' ',gen_string(3,'un')));
		end $$
	delimiter ;
    
-- Pega elemento aleatorio de uma lista separada por virgula
	delimiter $$
	create function gen_list(lista longtext)
	returns longtext
	begin
		declare elemento_sorteado varchar(255);
		declare qtd_elementos int;
		declare n_sorteado int;
		set qtd_elementos = LENGTH(TRIM(BOTH ',' FROM lista))- LENGTH(REPLACE(TRIM(BOTH ',' FROM lista), ',', '')) + 1;
		set n_sorteado = gen_int(1,qtd_elementos);
		set elemento_sorteado = SUBSTRING_INDEX(SUBSTRING_INDEX(lista,',',n_sorteado),',',-1);
		return(elemento_sorteado);
	end $$
	delimiter ;;
	select gen_list('RO,AC,AM,RR,PA,AP,TO,MA,PI,CE,RN,PB,PE,AL,SE,BA,MG,ES,RJ,SP,PR,SC,RS,MS,MT,GO,DF') as uf;
