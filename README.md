# mysql_data_masking
<h2>Funções para mascarar dados diretamente no MySQL</h2><br>
parecido com o plug-in da versão enterprise que leva o mesmo nome.<br>
basta rodar o arquivo sql por completo para criar as funções, depois é so chamar elas.<br><br>

<h5>Funções substituição caracteres:</h4><br><p>
         &nbsp;&nbsp;&nbsp;mask_inner(coluna,4,2)<br>
         &nbsp;&nbsp;&nbsp;mask_outer(coluna,0,3)<br>
         &nbsp;&nbsp;&nbsp;mask_email(coluna_de_email)<br>
         &nbsp;&nbsp;&nbsp;mask_tel(coluna_de_tel,'$')<p><br><br>
        
<h5>Funções de dados Aleatórios:</h4><br><p>
        Inteiro: &nbsp;&nbsp;&nbsp;gen_range(1,100) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(numero minimo, numero maximo) <br>
        Decimal:&nbsp;&nbsp;&nbsp;gen_decimal_range(1,100) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(numero minimo, numero maximo)<br>
        Telefone: &nbsp;&nbsp;&nbsp;gen_tel() <br>
        CEP: &nbsp;&nbsp;&nbsp;gen_cep()<br>
        Data: &nbsp;&nbsp;&nbsp;gen_date('19/09/2000','19/09/2022','%Y-%m-%d %h:%i:%s') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(data minima, data maxima, formato retorno)<br> 
        Horario: &nbsp;&nbsp;&nbsp;gen_time('00:00:00','23:59:59','%H:%i:%s') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(hora minima, hora maxima, formato retorno)</p><br><br>
        
 se tiver alguma sugestão ou quiser contribuir tmj!




