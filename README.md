# mysql_data_masking
#Funções para mascarar dados diretamente no MySQL<br>
##parecido com o plug-in da versão enterprise que leva o mesmo nome.<br><br>

###basta rodar o arquivo sql por completo para criar as funções, depois é so chamar elas.<br><br>

####Funções substituição caracteres:<br><p>
        mask_inner(nome,4,2)<br>
        mask_outer(cep,0,3) <br>
        mask_email(email_cliente) <br>
        mask_tel(telefone,'$')</p><br><br>
        
####Funções de dados Aleatórios: <br><p>
        gen_range(1,100) <br>
        gen_decimal_range(1,100) <br>
        gen_tel() <br>
        gen_cep()<br>
        gen_date('19/09/2000','19/09/2022','%Y-%m-%d %h:%i:%s')<br> 
        gen_time('00:00:00','23:59:59','%H:%i:%s')</p><br><br>
        
E quero dev mais, se tiver alguma sugestão ou quiser contrinbuir tmj!<br>


