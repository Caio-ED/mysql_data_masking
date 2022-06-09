> :construction: Projeto em construção :construction:
# mysql_data_masking
### Funções para mascarar dados diretamente no MySQL
parecido com o plug-in da versão enterprise que leva o mesmo nome.<br>

### 🔧 Instalação
basta rodar o arquivo sql uma vez por completo para criar as funções dentro do seu banco, depois é so chamar elas onde precisar.<br>
Diga como essa etapa será:

## 📦 Recursos
##### Funções de Máscara:

* [mask_inner(coluna,4,2)](#Título-e-Imagem-de-capa)
* [mask_outer(coluna,0,3)](#badges)
* [mask_email(coluna_de_email)](#índice)
* [mask_tel(coluna_de_tel,'$')](#descrição-do-projeto)
        
##### Funções de dados Aleatórios:
* Inteiro: --------------------------- gen_int(1,100)
* Decimal: --------------------------- gen_decimal(1,100)
* Caractere: ------------------------- gen_char('uln*')
* String: ---------------------------- gen_string(10,'uln*')
* Telefone: -------------------------- gen_tel()
* CEP: ------------------------------- gen_cep()
* Data: ------------------------------ gen_date('19/09/2000','19/09/2022','%Y-%m-%d %h:%i:%s') 
* Horario: --------------------------- gen_time('00:00:00','23:59:59','%H:%i:%s')
        
 proximo passo que eu quero criar, é uma função que tras um valor aleatorio de uma lista. <br>
 a forma que pensei de fazer isso seria, criar uma tabela temporaria com uma coluna de tipo JSON (mysql 5.7.8 acima), lêr o JSON importado, jogalo na tabela temporaria, e usando o gen_range(), trazer um dos indices aleatoriamente. <br>
 Se tiver alguma sugestão e quiser contribuir tmj!
###### referencia para formatos de data: 
* [https://mysqlcode.com/mysql-date_format/](https://mysqlcode.com/mysql-date_format/)





