# mysql_data_masking
<h2>Funções para mascarar dados diretamente no MySQL</h2><br>
parecido com o plug-in da versão enterprise que leva o mesmo nome.<br>
basta rodar o arquivo sql por completo para criar as funções, depois é so chamar elas.<br><br>

<h5>Funções substituição caracteres:</h4><br>
        * mask_inner(coluna,4,2)
        * mask_outer(coluna,0,3)
        * mask_email(coluna_de_email)
        * mask_tel(coluna_de_tel,'$')
        
<h5>Funções de dados Aleatórios:</h4><br><p>
       + &nbsp;&nbsp;&nbsp;gen_range(1,100) <br>
       + &nbsp;&nbsp;&nbsp;gen_decimal_range(1,100) <br>
       + &nbsp;&nbsp;&nbsp;gen_tel() <br>
       - &nbsp;&nbsp;&nbsp;gen_cep()<br>
       - &nbsp;&nbsp;&nbsp;gen_date('19/09/2000','19/09/2022','%Y-%m-%d %h:%i:%s')<br> 
       - <blockquote>gen_time('00:00:00','23:59:59','%H:%i:%s')</blockquote></p><br><br>
        
E quero dev mais, se tiver alguma sugestão ou quiser contrinbuir tmj!<br>


