# mysql_data_masking
Funções para mascarar dados diretamente no MySQL<br>
parecido com o plug-in da versão enterprise que leva o mesmo nome.

basta rodar o arquivo sql por completo para criar as funções, depois é so chamar elas.

Funções substituição caracteres:
        mask_inner(nome,4,2)
        mask_outer(cep,0,3) 
        mask_email(email_cliente) 
        mask_tel(telefone,'$')
        
Funções de dados Aleatórios: 
        gen_range(1,100) 
        gen_decimal_range(1,100) 
        gen_tel() 
        gen_cep()
        gen_date('19/09/2000','19/09/2022','%Y-%m-%d %h:%i:%s') 
        gen_time('00:00:00','23:59:59','%H:%i:%s')
        
E quero dev mais, se tiver alguma sugestão ou quiser contrinbuir tmj!


