# mysql_data_masking
### Funções para mascarar dados diretamente no MySQL
parecido com o plug-in da versão enterprise que leva o mesmo nome.<br>
basta rodar o arquivo sql por completo para criar as funções, depois é so chamar elas.<br><br>
##### Funções substituição caracteres:

* [mask_inner(coluna,4,2)](#Título-e-Imagem-de-capa)
* [mask_outer(coluna,0,3)](#badges)
* [mask_email(coluna_de_email)](#índice)
* [mask_tel(coluna_de_tel,'$')](#descrição-do-projeto)
        
##### Funções de dados Aleatórios:<br>
        * Inteiro: --------- gen_range(1,100) <br>
        * Decimal: --------- gen_decimal_range(1,100) <br>
        * Telefone: --------- gen_tel() <br>
        * CEP: --------- gen_cep()<br>
        * Data: --------- gen_date('19/09/2000','19/09/2022','%Y-%m-%d %h:%i:%s') 
        * Horario: --------- gen_time('00:00:00','23:59:59','%H:%i:%s') </p><br><br>
        
 se tiver alguma sugestão ou quiser contribuir tmj!




