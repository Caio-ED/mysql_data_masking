SELECT SPECIFIC_NAME, DTD_IDENTIFIER, ROUTINE_DEFINITION FROM information_schema.routines;

SELECT * FROM information_schema.routines;
DELIMITER $$
CREATE DEFINER=`base_dev`@`%` PROCEDURE `acumula`(limite INT)
BEGIN
DECLARE contador INT DEFAULT 0;
DECLARE soma INT DEFAULT 0;
loop_teste: LOOP
    SET contador = contador + 1;
    SET soma = soma + contador;
    IF contador >= limite THEN
        LEAVE loop_teste;
    END IF;
END LOOP loop_teste;
SELECT soma;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `formatar`(val VARCHAR(100), mask VARCHAR(100)) RETURNS varchar(100) CHARSET latin1
    DETERMINISTIC
BEGIN
	 DECLARE maskared VARCHAR(100) DEFAULT "";
	 DECLARE k INT DEFAULT 0;
	 DECLARE i INT DEFAULT 0;
	 WHILE i < CHAR_LENGTH(mask) DO
	  SET i = i + 1;
	  IF SUBSTRING(mask, i, 1) = '#' THEN
	   IF k < CHAR_LENGTH(val) THEN
		SET k = k+1;
		SET maskared = CONCAT(maskared, SUBSTRING(val, k, 1));
	   END IF;
	  ELSE
	   IF i < CHAR_LENGTH(mask) THEN
		SET maskared = CONCAT(maskared, SUBSTRING(mask, i, 1));
				END IF;
			END IF;
	 END WHILE;
	 RETURN maskared;
	END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_cep`() RETURNS varchar(20) CHARSET latin1
begin
		declare dig5 varchar(5);
		declare dig3 varchar(3);
		set dig5 = concat(FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10));
		set dig3 = concat(FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10));
        return(concat(dig5,'-',dig3));
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_char`(formato varchar(5)) RETURNS char(1) CHARSET latin1
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
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_date`(datai varchar(10),dataf varchar(10), formato varchar(40)) RETURNS varchar(100) CHARSET latin1
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
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_decimal`(inicio int, limite int) RETURNS decimal(12,2)
begin
			return(RAND() * (limite - inicio + 1) + inicio);
        end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_email`() RETURNS varchar(50) CHARSET latin1
begin
		return(concat(gen_string(gen_int(6,20),'uln'),'@',elt(ceiling(rand() * 5) ,"gmail.com","hotmail.com","exemplo.com","yahoo.com","icloud.com")));
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_int`(inicio int, limite int) RETURNS int(11)
begin
			return(FLOOR(RAND() * (limite - inicio + 1)) + inicio);
        end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_list`(lista longtext) RETURNS longtext CHARSET latin1
begin
	declare elemento_sorteado varchar(255);
	declare qtd_elementos int;
    declare n_sorteado int;
    set qtd_elementos = LENGTH(TRIM(BOTH ',' FROM lista))- LENGTH(REPLACE(TRIM(BOTH ',' FROM lista), ',', '')) + 1;
    set n_sorteado = gen_int(1,qtd_elementos);
    set elemento_sorteado = SUBSTRING_INDEX(SUBSTRING_INDEX(lista,',',n_sorteado),',',-1);
	return(elemento_sorteado);
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_nome`() RETURNS varchar(50) CHARSET latin1
begin
		return(concat(elt(ceiling(rand() * 6), 'Fulano','Fulana','Cicrano','Cicrana','Beltrano','Beltrana'), ' ', gen_string(3,'un'), ' ',gen_string(3,'un')));
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_string`(tamanho int,formato varchar(5)) RETURNS varchar(100) CHARSET latin1
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
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_tel`() RETURNS varchar(20) CHARSET latin1
begin
			declare digitos1 varchar(4);
			declare digitos2 varchar(4);
            declare codigoarea varchar(2);
            set digitos1 = concat( FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10));
            set digitos2 = concat( FLOOR(RAND() * 10), FLOOR(RAND() * 10),FLOOR(RAND() * 10),FLOOR(RAND() * 10));
            set codigoarea = concat( FLOOR(RAND() * 10), FLOOR(RAND() * 10));
			return(concat('(',codigoarea,')', digitos1, '-', digitos2 ));
        end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_time`(timei varchar(10),timef varchar(10),formato varchar(50)) RETURNS varchar(100) CHARSET latin1
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
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `limpa_num`(documento varchar(30)) RETURNS varchar(30) CHARSET latin1
begin
    -- declare a varchar(30);
		return( replace(replace(replace(replace(replace(replace(replace(documento,'-',''),'.',''),'/',''),',',''),'\\',''),'(',''),')',''));
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `gen_tiposangue`() RETURNS varchar(3) CHARSET latin1
begin
		return(elt(ceiling(rand() * 8), 'A+','B+','AB+','O+','A-','B-','AB-','O-'));
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `MASK`(val VARCHAR(100), mask VARCHAR(100)) RETURNS varchar(100) CHARSET latin1
    DETERMINISTIC
BEGIN
 DECLARE maskared VARCHAR(100) DEFAULT "";
 DECLARE k INT DEFAULT 0;
 DECLARE i INT DEFAULT 0;
 WHILE i < CHAR_LENGTH(mask) DO
  SET i = i + 1;
  IF SUBSTRING(mask, i, 1) = 'A <> Z' THEN
   IF k < CHAR_LENGTH(val) THEN
    SET k = k+1;
    SET maskared = CONCAT(maskared, SUBSTRING(val, k, 1));
   END IF;
  ELSE
   IF i < CHAR_LENGTH(mask) THEN
    SET maskared = CONCAT(maskared, SUBSTRING(mask, i, 1));
            END IF;
        END IF;
 END WHILE;
 RETURN maskared;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `mask_email`(email varchar(100)) RETURNS varchar(100) CHARSET latin1
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
        end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `mask_inner`(frase varchar(100), esquerda int, direita int, simbolo char) RETURNS varchar(100) CHARSET latin1
begin
		declare qtd_nao_ocultos int;
		set qtd_nao_ocultos = esquerda + direita ;
		return(
			select concat(left(frase, esquerda),repeat(simbolo, char_length(frase) - qtd_nao_ocultos),right(frase, direita))
		);
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `mask_outer`(frase varchar(100), esquerda int, direita int, simbolo char) RETURNS varchar(100) CHARSET latin1
begin
		declare posicaoini int;
        declare qtdmostrando int;
        declare qtdescondidos int;
		set posicaoini = esquerda + 1 ;
        set qtdescondidos = esquerda + direita;
        set qtdmostrando = char_length(frase) - qtdescondidos;
		return(
			select concat(repeat(simbolo,esquerda), mid(frase, posicaoini, qtdmostrando), repeat(simbolo, direita))
		);
    end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`base_dev`@`%` FUNCTION `mask_tel`(tel_sem_mascara varchar(20), mask varchar(1)) RETURNS varchar(20) CHARSET latin1
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
		end$$
DELIMITER ;
