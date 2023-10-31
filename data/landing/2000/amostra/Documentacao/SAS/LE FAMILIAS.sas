/****************************   MACRO PARA LEITURA DO ARQUIVO DE FAMILIAS   ********************************************/

/* 	PAR�METROS DE ENTRADA	

	PASTA - caminho da pasta onde est� o arquivo com as informa��es das fam�lias da UF desejada.
	UF - c�digo num�rico da UF desejada
	
	SAIDA 

	Arquivo FAMILIAS no formato SAS

****************************************************************************************************************************/

%MACRO LE_FAMILIAS(PASTA,UF);

FILENAME FAMILIAS "&PASTA.\FAMI&UF..TXT" LRECL=118;

DATA FAMILIAS;
INFILE FAMILIAS MISSOVER;
INPUT
@1 	V0102 $2.		/*	"UNIDADE DA FEDERA��O
					11- Rond�nia
					12- Acre
					13- Amazonas
					14- Roraima
					15- Par�
					16- Amap�
					17- Tocantins
					21- Maranh�o
					22- Piau�
					23- Cear�
					24- Rio Grande do Norte
					25- Para�ba
					26- Pernambuco
					27- Alagoas
					28- Sergipe
					29- Bahia
					31- Minas Gerais
					32- Esp�rito Santo
					33- Rio de Janeiro
					35- S�o Paulo
					41- Paran�
					42- Santa Catarina
					43- Rio Grande do Sul
					50- Mato Grosso do Sul
					51- Mato Grosso
					52- Goi�s
					53- Distrito Federal"	*/
@3 	V1002 $4.		/*	"MESORREGI�O
						A rela��o encontra-se na pasta �Arquivos Auxiliares� no arquivo �Divis�o Territorial Brasileira.xls�"	*/
@7 	V1003 $5.		/*	"MICRORREGI�O
						A rela��o encontra-se na pasta �Arquivos Auxiliares� no arquivo �Divis�o Territorial Brasileira.xls�"	*/
@12 	V0103 $7.	/*	"MUNIC�PIO
						A rela��o encontra-se na pasta �Arquivos Auxiliares� no arquivo �Divis�o Territorial Brasileira.xls�"	*/
@19 	V0104 $9.	/*	"DISTRITO
						A rela��o encontra-se na pasta �Arquivos Auxiliares� no arquivo �Divis�o Territorial Brasileira.xls�"	*/
@28 	V0105 $11.	/*	"SUDISTRITO
						A rela��o encontra-se na pasta �Arquivos Auxiliares� no arquivo �Divis�o Territorial Brasileira.xls�"	*/
@39 	V0300 8.	/*	CONTROLE	*/
@47 	V0404 2.	/*	> 00 (N�MERO DE ORDEM DA FAMILIA NO DOMIC�LIO)	*/
@49 	V1001 $1.	/*	"REGI�O GEOGR�FICA
						1- Regi�o Norte
						2- Regi�o Nordeste
						3- Regi�o Sudeste
						4- Regi�o Sul
						5- Regi�o Centro-Oeste"	*/
@50 	V1004 $2.	/*	"REGI�O METROPOLITANA
						01- Bel�m
						02- Grande S�o Lu�s
						03- Fortaleza
						04- Natal
						05- Recife
						06- Macei�
						07- Salvador
						08- Belo Horizonte
						09- Colar Metropolitano da RM de Belo Horizonte
						10- Vale do A�o
						11- Colar Metropolitano da RM do Vale do A�o
						12- Grande Vit�ria
						13- Rio de Janeiro
						14- S�o Paulo
						15- Baixada Santista
						16- Campinas
						17- Curitiba
						18- Londrina
						19- Maring�
						20- Florian�polis
						21- �rea de Expans�o Metropolitana da RM de Florian�polis
						22- N�cleo Metropolitano da RM Vale do Itaja�
						23- �rea de Expans�o Metropolitana da RM Vale do Itaja�
						24- Norte/Nordeste Catarinense
						25- �rea de Expans�o Metropolitana da RM Norte/Nordeste Catarinense
						26- Porto Alegre
						27� Goi�nia
						28� RIDE (Regi�o Integrada de Desenvolvimento do Distrito Federal e Entorno)
						Branco - N�o aplic�vel"	*/
@52 	AREAP $13.	/*	"�REA DE PONDERA��O
						A rela��o encontra-se na pasta �Arquivos Auxiliares� no arquivo �MUNIC�PIOS COM MAIS DE UMA �REA DE PONDERA��O.xls�"	*/
@65 	CODV0404 $1.	/*	"TIPO DE FAM�LIA (1)
						0- �nica (uma s� fam�lia vive no domic�lio)
						1- Fam�lias conviventes: 1� fam�lia
						2- Fam�lias conviventes: 2� fam�lia
						3- Fam�lias conviventes: 3� fam�lia
						4- Fam�lias conviventes: 4� fam�lia
						5- Fam�lias conviventes: 5� fam�lia e mais
						9- Morador individual"	*/
@66 	CODV0404_2 $2./*	"TIPO DE FAM�LIA (2)
						01- Casal sem filhos
						02- Casal com filhos menores de 14 anos
						03- Casal com filhos de 14 anos ou mais
						04- Casal com filhos de idades variadas
						05- M�e com filhos menores de 14 anos
						06- M�e com filhos de 14 anos ou mais
						07- M�e com filhos de idades variadas
						08- Pai com filhos menores de 14 anos
						09- Pai com filhos de 14 anos ou mais
						10- Pai com filhos de idades variadas
						11- Outros tipos de fam�lias
						12- Morador individual"	*/
@68 	V4614B 7.	/*	RENDIMENTO NOMINAL FAMILIAR	*/
@75 	CODV4615B $2. /*	"CLASSE DE RENDIMENTO NOMINAL FAMILIAR
						01- At� 0,25 sal�rio m�nimo
						02- Mais de 0,25 a 0,5 sal�rio m�nimo
						03- Mais de 0,5 a 1 sal�rio m�nimo
						04- Mais de 1 a 2 sal�rios m�nimos
						05- Mais de 2 a 3 sal�rios m�nimos
						06- Mais de 3 a 5 sal�rios m�nimos
						07- Mais de 5 a 10 sal�rios m�nimos
						08- Mais de 10 a 15 sal�rios m�nimos
						09- Mais de 15 a 20 sal�rios m�nimos
						10- Mais de 20 a 30 sal�rios m�nimos
						11- Mais de 30 sal�rios m�nimos
						12- Sem rendimento"	*/
@77 	V4614C 7.	/*	RENDIMENTO NOMINAL, RESPONSAVEL/CASAL	*/
@84 	CODV4615C $2. /*	"CLASSE DE RENDIMENTO NOMINAL, RESPONSAVEL/CASAL
						01- At� 0,25 sal�rio m�nimo
						02- Mais de 0,25 a 0,5 sal�rio m�nimo
						03- Mais de 0,5 a 0,75 sal�rio m�nimo
						04- Mais de 0,75 a 1 sal�rio m�nimo
						05- Mais de 1 a 1,25 sal�rios m�nimos
						06- Mais de 1,25 a 1,5 sal�rios m�nimos
						07- Mais de 1,5 a 2 sal�rios m�nimos
						08- Mais de 2 a 3 sal�rios m�nimos
						09- Mais de 3 a 5 sal�rios m�nimos
						10- Mais de 5 a 10 sal�rios m�nimos
						11- Mais de 10 a 15 sal�rios m�nimos
						12- Mais de 15 a 20 sal�rios m�nimos
						13- Mais de 20 a 30 sal�rios m�nimos
						14- Mais de 30 sal�rios m�nimos
						15- Sem rendimento"	*/
@86 	V4616_7400 8.2 	/*	RENDIMENTO NOMINAL FAMILIAR PER-CAPITA	*/
@94 	CODV4615_7400 $2. /*	"CLASSE RENDIMENTO NOMINAL FAMILIAR PER-CAPITA
						01- At� 0,25 sal�rio m�nimo
						02- Mais de 0,25 a 0,5 sal�rio m�nimo
						03- Mais de 0,5 a 1 sal�rio m�nimo
						04- Mais de 1 a 2 sal�rios m�nimos
						05- Mais de 2 a 3 sal�rios m�nimos
						06- Mais de 3 a 5 sal�rios m�nimos
						07- Mais de 5 a 10 sal�rios m�nimos
						08- Mais de 10 a 15 sal�rios m�nimos
						09- Mais de 15 a 20 sal�rios m�nimos
						10- Mais de 20 a 30 sal�rios m�nimos
						11- Mais de 30 sal�rios m�nimos
						12- Sem rendimento"	*/
@96 	V7400 2.	/*	N�MERO DE COMPONENTES DA FAM�LIA	*/
@98 	CODV7400 $2.	/*	"CLASSE DE N�MERO DE COMPONENTES
					01- 1 pessoa
					02- 2 pessoas
					03- 3 pessoas
					04- 4 pessoas
					05- 5 pessoas
					06- 6 pessoas
					07- 7 pessoas
					08- 8 pessoas
					09- 9 pessoas
					10- 10 pessoas
					11- 11 pessoas
					12- 12 pessoas
					13- 13 pessoas
					14- 14 pessoas
					15- 15 ou mais pessoas"	*/
@100 	V7400A 2.	/*	N�MERO DE COMPONENTES HOMENS DA FAM�LIA	*/
@102 	CODV7400A $2. /*	"CLASSE DE N�MERO DE COMPONENTES HOMENS DA FAM�LIA
					00- nenhum
					01- 1 homem
					02- 2 homens
					03- 3 homens
					04- 4 homens
					05- 5 homens
					06- 6 homens
					07- 7 homens
					08- 8 homens
					09- 9 homens
					10- 10 homens
					11- 11 homens
					12- 12 homens
					13- 13 homens
					14- 14 homens
					15- 15 ou mais homens"	*/
@104 	V7400B 2.	/*	N�MERO DE COMPONENTES MULHERES DA FAM�LIA	*/
@106 	CODV7400B $2. /*	"CLASSE DE N�MERO DE COMPONENTES MULHERES DA FAM�LIA
						00- nenhum
						01- 1 mulher
						02- 2 mulheres
						03- 3 mulheres
						04- 4 mulheres
						05- 5 mulheres
						06- 6 mulheres
						07- 7 mulheres
						08- 8 mulheres
						09- 9 mulheres
						10- 10 mulheres
						11- 11 mulheres
						12- 12 mulheres
						13- 13 mulheres
						14- 14 mulheres
						15- 15 ou mais mulheres"	*/
@108 	P001 11.8	/*	PESO (Peso atribu�do ao domic�lio)	*/
;
RUN;

%MEND;

 /* Exemplo de chamada da macro para o Acre
	%LE_FAMILIAS(\\CHI00534610\PUBLICO_IBGE,12);*/
