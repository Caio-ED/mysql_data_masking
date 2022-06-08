# mysql_data_masking
<h2>Funções para mascarar dados diretamente no MySQL</h2><br>
parecido com o plug-in da versão enterprise que leva o mesmo nome.<br>
basta rodar o arquivo sql por completo para criar as funções, depois é so chamar elas.<br><br>

<h5>Funções substituição caracteres:</h4><br> * <p>
         &nbsp;&nbsp;&nbsp;mask_inner(coluna,4,2)<br>
         &nbsp;&nbsp;&nbsp;mask_outer(coluna,0,3)<br>
         &nbsp;&nbsp;&nbsp;mask_email(coluna_de_email)<br>
         &nbsp;&nbsp;&nbsp;mask_tel(coluna_de_tel,'$')<p><br><br>
        
<h5>Funções de dados Aleatórios:</h4><br><p>
        &nbsp;&nbsp;&nbsp;Inteiro: --------- gen_range(1,100) ------------------------------------ (numero minimo, numero maximo) <br>
        &nbsp;&nbsp;&nbsp;Decimal: --------- gen_decimal_range(1,100) ------------------------------------ (numero minimo, numero maximo)<br>
        &nbsp;&nbsp;&nbsp;Telefone: --------- gen_tel() <br>
        &nbsp;&nbsp;&nbsp;CEP: --------- gen_cep()<br>
        &nbsp;&nbsp;&nbsp;Data: --------- gen_date('19/09/2000','19/09/2022','%Y-%m-%d %h:%i:%s') --------------------------- (data minima, data maxima, formato retorno)<br> 
        &nbsp;&nbsp;&nbsp; Horario: --------- gen_time('00:00:00','23:59:59','%H:%i:%s') --------------------------------------------- (hora minima, hora maxima, formato retorno)</p><br><br>
        
 se tiver alguma sugestão ou quiser contribuir tmj!




