/****************************   MACRO PARA LEITURA DO ARQUIVO DE PESSOAS   ***********************************************/

/* 	PAR�METROS DE ENTRADA	

		PASTA - caminho da pasta onde est� o arquivo com as informa��es das pessoas da UF desejada.
		UF - c�digo num�rico da UF desejada
	
	SAIDA 

		Arquivo PESSOAS no formato SAS

****************************************************************************************************************************/

%MACRO LE_PESSOAS(PASTA,UF);

FILENAME PESSOAS "&PASTA.\PES&UF..TXT" LRECL=390 ;

DATA PESSOAS;
INFILE PESSOAS MISSOVER;
INPUT
@1 	V0102 $2.	/*	"UNIDADE DA FEDERA��O
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
				53 - Distrito Federal"	*/
@3 	V1002 $4.	/*	"CODIGO DA MESORREGI�O
				A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@7 	V1003 $5.	/*	"CODIGO DA MICRORREGI�O
				A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@12 	V1103 $7.	/*	"CODIGO DO MUNICIPIO
				A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@19 	V0104 $9.	/*	"CODIDO DO DISTRITO
				A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@28 	V0105 $11.	/*	"CODIGO DO SUBDISTRITO
				A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@39 	V0300 8.	/*	CONTROLE	*/
@47 	V0400 2.	/*	> 00 (PESSOA)	*/
@49 	V1004 $2.	/*	"REGI�O METROPOLITANA
				VER ARQUIVO AUXILIAR"	*/
@51 	AREAP $13.	/*	"�REA DE PONDERA��O
					A RELA��O ENCONTRA-SE NO ARQUIVO �Munic�pios Com Mais de Uma �rea de Pondera��o.xls�"	*/
@64 	V1001 $1.	/*	"REGI�O GEOGR�FICA
					1- Regi�o Norte (uf = 11 a 17)
					2- Regi�o Nordeste (uf = 21 a 29)
					3- Regi�o Sudeste (uf = 31 a 35)
					4- Regi�o Sul (uf = 41 a 43)
					5- Regi�o Centro-Oeste (uf = 50 a 53)"	*/
@65 	V1005 $1.	/*	"SITUA��O DO SETOR
					1- �rea urbanizada de cidade ou vila
					2- �rea n�o urbanizada de cidade ou vila
					3- �rea urbanizada isolada
					4- Rural - de extens�o urbana
					5- Rural - povoado
					6- Rural - n�cleo
					7- Rural - outros aglomerados
					8- Rural - exclusive os aglomerados rurais"	*/
@66 	V1006 $1.	/*	"SITUA��O DO DOMIC�LIO
					1- Urbano, se V1005 = 1, 2, 3
					2- Rural, se V1005 = 4, 5, 6, 7, 8"	*/
@67 	V1007 $1.	/*	"TIPO DO SETOR
					0- Setor comum ou n�o especial
					1- Setor especial de aglomerado subnormal
					2- Setor especial de quart�is, bases militares, etc.
					3- Setor especial de alojamento, acampamentos, etc.
					4- Setor especial de embarca��es, barcos, navios, etc.
					5- Setor especial de aldeia ind�gena
					6- Setor especial de penitenci�rias, col�nias penais, pres�dios, cadeias, etc.
					7- Setor especial de asilos, orfanatos, conventos, hospitais, etc."	*/
@68 	MARCA $1.	/*	"SE A PR�PRIA PESSOA PRESTOU AS INFORMA��ES
					1- Se a pr�pria pessoa prestou as informa��es
					Branco- As informa��es foram prestadas por outra pessoa do domic�lio"	*/
@69 	V0401 $1.	/*	"SEXO
					1- Masculino
					2- Feminino"	*/
@70 	M0401 $1.	/*	"INDICADORA DE IMPUTA��O NA V0401
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@71 	V0402 $2.	/*	"RELA��O COM RESPONS�VEL PELO DOMIC�LIO
					01- Pessoa respons�vel
					02- C�njuge, companheiro(a)
					03- Filho(a), enteado(a)
					04- Pai, m�e, sogro(a)
					05- Neto(a), bisneto(a)
					06- Irm�o, irm�
					07- Outro parente
					08- Agregado(a)
					09- Pensionista
					10- Empregado(a) dom�stico(a)
					11- Parente do(a) empregado(a) dom�stico(a)
					12- Individual em domic�lio coletivo"	*/
@73 	M0402 $1.	/*	"INDICADORA DE IMPUTA��O NA V0402
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@74 	V0403 $2.	/*	"RELA��O COM RESPONS�VEL PELA FAM�LIA
					01- Pessoa respons�vel
					02- C�njuge, companheiro(a)
					03- Filho(a), enteado(a)
					04- Pai, m�e, sogro(a)
					05- Neto(a), bisneto(a)
					06- Irm�o, irm�
					07- Outro parente
					08- Agregado(a)
					09- Pensionista
					10- Empregado(a) dom�stico(a)
					11- Parente do(a) empregado(a) dom�stico(a)
					12- Individual em domic�lio coletivo"	*/
@76 	M0403 $1.	/*	"INDICADORA DE IMPUTA��O NA V0403
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@77 	V0404 1.	/*	"N�MERO DA FAM�LIA
					0- Individual em domic�lio coletivo"	*/
@78 	M0404 $1.	/*	"INDICADORA DE IMPUTA��O NA V0404
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@79 	V4572 3.	/*	IDADE CALCULADA EM ANOS COMPLETOS - A PARTIR DE 1 ANO	*/
@82 	M4752 $1.	/*	"INDICADORA DE IMPUTA��O NA V4752
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@83 	V4754 2.	/*	"IDADE CALCULADA EM MESES - MENOS DE UM ANO (Valores de 00 a 11)
					00- Inclusive para as pessoas com idade em anos completos a partir de um ano"	*/
@85 	M4754 $1.	/*	"INDICADORA DE IMPUTA��O NA V4754
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@86 	V4070 $1.	/*	"INDICADORA DA FORMA DE DECLARA��O DA IDADE (DATA DE NASCIMENTO, IDADE INFORMADA OU IDADE ESTIMADA)
					1- Idade calculada
					2- Idade presumida/declarada"	*/
@87 	V0408 $1.	/*	"COR OU RA�A
					1-Branca
					2- Preta
					3- Amarela
					4- Parda
					5- Ind�gena
					9- Ignorado"	*/
@88 	M0408 $1.	/*	"INDICADORA DE IMPUTA��O NA V0408
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@89 	V4090 $3.	/*	"C�DIGO DA RELIGI�O
					CATEGORIAS NO ARQUIVO �Estrutura de Religi�o-V4090.doc�"	*/
@92 	M4090 $1.	/*	"INDICADORA DE IMPUTA��O NA V4090 (0 e 1)
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@93 	V0410 $1.	/*	"PROBLEMA MENTAL PERMANENTE
					1- Sim
					2- N�o
					9- Ignorado"	*/
@94 	M0410 $1.	/*	"INDICADORA DE IMPUTA��O NA V0410
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@95 	V0411 $1.	/*	"CAPACIDADE DE ENXERGAR
					1- Incapaz
					2- Grande dificuldade permanente
					3- Alguma dificuldade permanente
					4- Nenhuma dificuldade
					9- Ignorado"	*/
@96 	M0411 $1.	/*	"INDICADORA DE IMPUTA��O NA V0411
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@97 	V0412 $1.	/*	"CAPACIDADE DE OUVIR
					1- Incapaz
					2- Grande dificuldade permanente
					3- Alguma dificuldade permanente
					4- Nenhuma dificuldade
					9- Ignorado"	*/
@98 	M0412 $1.	/*	"INDICADORA DE IMPUTA��O NA V0412
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@99 	V0413 $1.	/*	"CAPACIDADE DE CAMINHAR/SUBIR ESCADAS
					1- Incapaz
					2- Grande dificuldade permanente
					3- Alguma dificuldade permanente
					4- Nenhuma dificuldade
					9- Ignorado"	*/
@100 	M0413 $1.	/*	"INDICADORA DE IMPUTA��O NA V0413
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@101 	V0414 $1.	/*	"DEFICI�NCIAS
					1- Paralisia permanente total
					2- Paralisia permanente das pernas
					3- Paralisia permanente de um dos lados do corpo
					4- Falta de perna, bra�o, m�o, p� ou dedo polegar
					5- Nenhuma das enumeradas
					9- Ignorado"	*/
@102 	M0414 $1.	/*	"INDICADORA DE IMPUTA��O NA V0414
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@103 	V0415 $1.	/*	"SEMPRE MOROU NESTE MUNIC�PIO
					1- Sim
					2- N�o"	*/
@104 	M0415 $1.	/*	"INDICADORA DE IMPUTA��O NA V0415
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@105 	V0416 2.	/*	"TEMPO DE MORADIA NESTE MUNIC�PIO
					Branco- para os n�o migrantes"	*/
@107 	M0416 $1.	/*	"INDICADORA DE IMPUTA��O NA V0416
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@108 	V0417 $1.	/*	"NASCEU NESTE MUNIC�PIO
					1- Sim
					2- N�o
					Branco- para os n�o migrantes"	*/
@109 	M0417 $1.	/*	"INDICADORA DE IMPUTA��O NA V0417
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@110 	V0418 $1.	/*	"NASCEU NESTA UF
					1- Sim
					2- N�o
					Branco- para os n�o migrantes e os naturais do munic�pio"	*/
@111 	M0418 $1.	/*	"INDICADORA DE IMPUTA��O NA V0418
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@112 	V0419 $1.	/*	"NACIONALIDADE
					1- Brasileiro nato
					2- Naturalizado brasileiro
					3- Estrangeiro
					Branco- para os n�o migrantes e os naturais da Unidade da Federa��o onde foi realizado o Censo 2000"	*/
@113 	M0419 $1.	/*	"INDICADORA DE IMPUTA��O NA V0419
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@114 	V0420 $4.	/*	"ANO QUE FIXOU RESID�NCIA NO BRASIL
					Branco- para os n�o migrantes e os brasileiros natos"	*/
@118 	M0420 $1.	/*	"INDICADORA DE IMPUTA��O NA V0420
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@119 	V4210 $2.	/*	"C�DIGO DA UF OU PA�S DE NASCIMENTO
					Branco- para os n�o migrantes e os naturais da Unidade da Federa��o onde foi realizado o Censo 2000
					CATEGORIAS NO ARQUIVO �Estrutura Migra��o V4210, V4260.xls�"	*/
@121 	M4210 $1.	/*	"INDICADORA DE IMPUTA��O NA V4210
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@122 	V0422 2.	/*	"TEMPO DE MORADIA NA UF
					Branco- para os n�o migrantes"	*/
@124 	M0422 $1.	/*	"INDICADORA DE IMPUTA��O NA V0422
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@125 	V4230 $2.	/*	"C�DIGO DA UF OU PA�S DE RESID�NCIA ANTERIOR
					Branco� para os n�o migrantes e os que moram na Unidade da Federa��o h� 10 anos ou mais. 
					CATEGORIAS NO ARQUIVO �Estrutura de Migra��o V4230.xls�"	*/
@127 	M4230 $1.	/*	"INDICADORA DE IMPUTA��O NA V4230
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@128 	V0424 $1.	/*	"RESID�NCIA EM 31 DE JULHO DE 1995
					1- Neste munic�pio, na zona urbana
					2- Neste munic�pio, na zona rural
					3- Em outro munic�pio, na zona urbana
					4- Em outro munic�pio, na zona rural
					5- Em outro pa�s
					6- N�o era nascido
					Branco- para os n�o migrantes"	*/
@129 	M0424 $1.	/*	"INDICADORA DE IMPUTA��O NA V0424
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@130 	V4250 $7.	/*	"C�DIGO DO MUNIC�PIO DE RESID�NCIA
					Branco- para os n�o migrantes, os moradores no munic�pio onde foi realizado o Censo 2000, os moradores em outro 
					pa�s e aos n�o nascidos em 31/07/1995.
					CATEGORIAS NO ARQUIVO �Munic�pios-V4250.xls�"	*/
@137 	M4250 $1.	/*	"INDICADORA DE IMPUTA��O NA V4250
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@138 	V4260 $2.	/*	"C�DIGO DA UF OU PA�S DE RESID�NCIA EM 31/07/1995
					Branco- para os n�o migrantes, os moradores no munic�pio onde foi realizado o Censo 2000 e os n�o nascidos em 31/07/1995.
					CATEGORIAS NO ARQUIVO �Estrutura de Migra��o V4210, V4260.xls�"	*/
@140 	M4260 $1.	/*	"INDICADORA DE IMPUTA��O NA V4260
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@141 	V4276 $7.	/*	"C�DIGO DO MUNIC�PIO E UF OU PA�S ESTRANGEIRO QUE TRABALHA OU ESTUDA
					CATEGORIAS NO ARQUIVO �Munic�pios e Pa�s Estrangeiro-V4276.xls�"	*/
@148 	M4276 $1.	/*	"INDICADORA DE IMPUTA��O NA V4276
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@149 	V0428 $1.	/*	"SABE LER E ESCREVER
					1- Sabe ler e escrever
					2- N�o sabe"	*/
@150 	M0428 $1.	/*	"INDICADORA DE IMPUTA��O NA V0428
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@151 	V0429 $1.	/*	"FREQ�ENTA ESCOLA OU CRECHE
					1- Sim, rede particular
					2- Sim, rede p�blica
					3- N�o, j� freq�entou
					4- Nunca freq�entou"	*/
@152 	M0429 $1.	/*	"INDICADORA DE IMPUTA��O NA V0429
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@153 	V0430 $2.	/*	"CURSO QUE FREQ�ENTA
					01- Creche
					02- Pr�-escolar
					03- Classe de alfabetiza��o
					04- Alfabetiza��o de adultos
					05- Ensino fundamental ou 1� grau - regular seriado
					06- Ensino fundamental ou 1� grau - regular n�o-seriado
					07- Supletivo (ensino fundamental ou 1� grau)
					08- Ensino m�dio ou 2� grau - regular seriado
					09- Ensino m�dio ou 2� grau - regular n�o-seriado
					10- Supletivo (ensino m�dio ou 2� grau)
					11- Pr�-vestibular
					12- Superior � gradua��o
					13- Superior � mestrado ou doutorado
					Branco- para os n�o estudantes"	*/
@155 	M0430 $1.	/*	"INDICADORA DE IMPUTA��O NA V0430
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@156 	V0431 $1.	/*	"S�RIE QUE FREQ�ENTA
					1- Primeira S�rie
					2- Segunda S�rie
					3- Terceira S�rie
					4- Quarta S�rie
					5- Quinta S�rie
					6- Sexta S�rie
					7- S�tima S�rie
					8- Oitava S�rie
					9- Curso n�o-seriado
					Branco- para os n�o estudantes"	*/
@157 	M0431 $1.	/*	"INDICADORA DE IMPUTA��O NA V0431
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@158 	V0432 $1.	/*	"CURSO MAIS ELEVADO QUE FREQ�ENTOU, CONCLUINDO PELO MENOS UMA S�RIE
					1- Alfabetiza��o de adultos
					2- Antigo prim�rio
					3- Antigo gin�sio
					4- Antigo cl�ssico, cient�fico, etc.
					5- Ensino fundamental ou 1� grau
					6- Ensino m�dio ou 2� grau
					7- Superior - gradua��o
					8- Mestrado ou doutorado
					9- Nenhum
					Branco- para os estudantes"	*/
@159 	M0432 $1.	/*	"INDICADORA DE IMPUTA��O NA V0432
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@160 	V0433 $2.	/*	"�LTIMA S�RIE CONCLU�DA COM APROVA��O
					01- Primeira S�rie
					02- Segunda S�rie
					03- Terceira S�rie
					04- Quarta S�rie
					05- Quinta S�rie
					06- Sexta S�rie
					07- S�tima S�rie
					08- Oitava S�rie
					09- Curso n�o-seriado
					10- Nenhuma
					Branco- para os estudantes"	*/
@162 	M0433 $1.	/*	"INDICADORA DE IMPUTA��O NA V0433
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@163 	V0434 $1.	/*	"CONCLUIU O CURSO NO QUAL ESTUDOU
					1- Sim
					2- N�o
					Branco- para os estudantes"	*/
@164 	M0434 $1.	/*	"INDICADORA DE IMPUTA��O NA V0434
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@165 	V4355 $2.	/*	"C�DIGO DO CURSO MAIS ELEVADO CONCLU�DO
					Branco- para os estudantes e os n�o estudantes que n�o conclu�ram curso.
					CATEGORIAS NO ARQUIVO �Cursos Superiores-Estrutura V4535.xls�"	*/
@167 	M0435 $1.	/*	"INDICADORA DE IMPUTA��O NA V0435
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@168 	V4300 $2.	/*	"ANOS DE ESTUDO
					00- Sem instru��o ou menos de 1 ano
					01- 1 ano
					02- 2 anos
					03- 3 anos
					04- 4 anos
					05- 5 anos
					06- 6 anos
					07- 7 anos
					08- 8 anos
					09- 9 anos
					10- 10 anos
					11- 11 anos
					12- 12 anos
					13- 13 anos
					14- 14 anos
					15- 15 anos
					16- 16 anos
					17- 17 anos ou mais
					20- N�o determinado
					30- Alfabetiza��o de adultos"	*/
@170 	V0436 $1.	/*	"VIVE EM COMPANHIA DE C�NJUGE OU COMPANHEIRO(A)
					1- Sim
					2- N�o, mas viveu
					3- Nunca viveu
					Branco- para as pessoas com menos de 10 anos de idade"	*/
@171 	M0436 $1.	/*	"INDICADORA DE IMPUTA��O NA V0436
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@172 	V0437 $1.	/*	"NATUREZA DA �LTIMA UNI�O
					1- Casamento civil e religioso
					2- S� casamento civil
					3- S� casamento religioso
					4- Uni�o consensual
					5- Nunca viveu
					Branco- para as pessoas com menos de 10 anos de idade"	*/
@173 	M0437 $1.	/*	"INDICADORA DE IMPUTA��O NA V0437
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@174 	V0438 $1.	/*	"ESTADO CIVIL
					1- Casado(a)
					2- Desquitado(a) ou separado(a) judicialmente
					3- Divorciado(a)
					4- Vi�vo(a)
					5- Solteiro(a)
					Branco- para as pessoas com menos de 10 anos de idade"	*/
@175 	M0438 $1.	/*	"INDICADORA DE IMPUTA��O NA V0438
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@176 	V0439 $1.	/*	"NA SEMANA DE 23 A 29 DE JULHO DE 2000, TRABALHOU REMUNERADO
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade"	*/
@177 	M0439 $1.	/*	"INDICADORA DE IMPUTA��O NA V0439
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@178 	V0440 $1.	/*	"NA SEMANA, TINHA TRABALHO MAS ESTAVA AFASTADO
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que exerceram algum  
					trabalho remunerado na totalidade ou em parte da semana de refer�ncia do Censo"	*/
@179 	M0440 $1.	/*	"INDICADORA DE IMPUTA��O NA V0440
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@180 	V0441 $1.	/*	"NA SEMANA, AJUDOU SEM REMUNERA��O, NO TRABALHO EXERCIDO POR PESSOA MORADORA DO DOMIC�LIO, OU COMO APRENDIZ/ESTAGI�RIO
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que exerceram algum 
					trabalho remunerado na totalidade ou em parte da semana de refer�ncia do Censo ou tinham algum trabalho remunerado 
					na semana de refer�ncia do qual estava temporariamente afastado"	*/
@181 	M0441 $1.	/*	"INDICADORA DE IMPUTA��O NA V0441
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@182 	V0442 $1.	/*	"NA SEMANA, AJUDOU SEM REMUNERA��O, NO TRABALHO EXERCIDO POR PESSOA MORADORA DO DOMIC�LIO EM ATIVIDADE DE CULTIVO, 
					EXTRA��O VEGETAL...
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que exerceram algum 
					trabalho remunerado na totalidade ou em parte da semana de refer�ncia do Censo ou tinham algum trabalho remunerado 
					na semana de refer�ncia do qual estavam temporariamente afastado ou ajudaram sem remunera��o pessoa conta-pr�pria 
					ou empregadora moradora no domic�lio, ou como aprendiz ou estagi�rio"	*/
@183 	M0442 $1.	/*	"INDICADORA DE IMPUTA��O NA V0442
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@184 	V0443 $1.	/*	"NA SEMANA, TRABALHOU EM CULTIVO, ETC.,  PARA ALIMENTA��O DE PESSOAS MORADORAS NO DOMIC�LIO
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que exerceram 
					algum trabalho remunerado na totalidade ou em parte da semana de refer�ncia do Censo ou tinham algum trabalho 
					remunerado na semana de refer�ncia do qual estavam temporariamente afastado ou ajudaram sem remunera��o pessoa 
					conta-pr�pria ou empregadora moradora no domic�lio, ou como aprendiz ou estagi�rio ou ajudaram sem remunera��o 
					pessoa moradora no domic�lio empregada em atividade de produ��o de bens prim�rios"	*/
@185 	M0443 $1.	/*	"INDICADORA DE IMPUTA��O NA V0443
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@186 	V0444 $1.	/*	"QUANTOS TRABALHOS, TINHA NA SEMANA DE 23 A 29 DE JULHO DE 2000 ?
					1- Um
					2- Dois ou mais
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham 
					trabalho na semana de refer�ncia"	*/
@187 	M0444 $1.	/*	"INDICADORA DE IMPUTA��O NA V0444
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@188 	V4452 $4.	/*	"C�DIGO NOVO DA OCUPA��O
					Branco- para pessoa de menos de 10 anos de idade ou pessoa de 10 ou mais anos de idade que n�o tinha 
					trabalho na semana de refer�ncia CATEGORIAS NO ARQUIVO �Ocupa��o-Estrutura.doc�"	*/
@192 	M4452 $1.	/*	"INDICADORA DE IMPUTA��O NA V4452
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@193 	V4462 $5.	/*	"C�DIGO NOVO DA ATIVIDADE
					Branco- para pessoa de menos de 10 anos de idade ou pessoa de 10 ou mais anos de idade que n�o tinha trabalho 
					na semana de refer�ncia do Censo. CATEGORIAS NO ARQUIVO �CnaeDom-Estrutura.xls�"	*/
@198 	M4462 $1.	/*	"INDICADORA DE IMPUTA��O NA V4462
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@199 	V0447 $1.	/*	"NESSE TRABALHO ERA...
					1- Trabalhador dom�stico com carteira de trabalho assinada
					2- Trabalhador dom�stico sem carteira de trabalho assinada
					3- Empregado com carteira de trabalho assinada
					4- Empregado sem carteira de trabalho assinada
					5- Empregador
					6- Conta-pr�pria
					7- Aprendiz ou estagi�rio sem remunera��o
					8- N�o remunerado em ajuda a membro do domic�lio
					9- Trabalhador na produ��o para o pr�prio consumo
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham 
					trabalho na semana de refer�ncia"	*/
@200 	M0447 $1.	/*	"INDICADORA DE IMPUTA��O NA V0447
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@201 	V0448 $1.	/*	"ERA EMPREGADO PELO RJUOU COMO MILITAR
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo e as que n�o tenham sido classificadas como empregado sem carteira de trabalho 
					assinada no trabalho principal, posi��o na ocupa��o"	*/
@202 	M0448 $1.	/*	"INDICADORA DE IMPUTA��O NA V0448
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@203 	V0449 $1.	/*	"QUANTOS EMPREGADOS TRABALHAVAM NESSA FIRMA
					1- Um empregado
					2- Dois empregados
					3- Tr�s a cinco empregados
					4- Seis a dez empregados
					5- Onze ou mais empregados
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham 
					trabalho na semana de refer�ncia do Censo e as que n�o tenham sido classificadas como empregador no trabalho principal, 
					posi��o na ocupa��o"	*/
@204 	M0449 $1.	/*	"INDICADORA DE IMPUTA��O NA V0449
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@205 	V0450 $1.	/*	"ERA CONTRIBUINTE DE INSTITUTO DE PREVID�NCIA OFICIAL
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo e as que tenham sido classificadas como aprendiz ou estagi�rio sem remunera��o, 
					exerciam trabalho n�o remunerado em ajuda a membro do domic�lio, ou trabalhavam para o pr�prio consumo"	*/
@206 	M0450 $1.	/*	"INDICADORA DE IMPUTA��O NA V0450
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@207 	V4511 $1.	/*	"N�O TEM RENDIMENTO NO TRABALHO PRINCIPAL
					0- N�o tem
					1- Somente em benef�cios
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo e as que tinham rendimento do trabalho principal remunerado na semana de 
					refer�ncia do Censo"	*/
@208 	M4511 $1.	/*	"INDICADORA DE IMPUTA��O NA V4511
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@209 	V4512 6.	/*	"RENDIMENTO BRUTO NO TRABALHO PRINCIPAL
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham trabalho, 
					a pessoa que tinha trabalho principal remunerado recebendo somente em benef�cios e a pessoa que tinha trabalho principal n�o remunerado na semana de refer�ncia do Censo"	*/
@215 	M4512 $1.	/*	"INDICADORA DE IMPUTA��O NA V4512
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@216 	V4513 6.	/*	"TOTAL DE RENDIMENTOS NO TRABALHO PRINCIPAL
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@222 	V4514 6.2	/*	"TOTAL DE RENDIMENTOS NO TRABALHO PRINCIPAL, EM SAL�RIOS M�NIMOS
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@228 	V4521 $1.	/*	"N�O TEM RENDIMENTO NOS DEMAIS TRABALHOS
					0- N�o tem
					1- Somente em benef�cios
					Branco- para as pessoas com menos de 10 anos de idade e pessoas com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo e as que tinham rendimento de outro trabalho remunerado na semana de refer�ncia do Censo"	*/
@229 	M4521 $1.	/*	"INDICADORA DE IMPUTA��O NA V4521
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@230 	V4522 6.	/*	"RENDIMENTO BRUTO NOS DEMAIS TRABALHOS
					Branco- para a pessoa com menos de 10 anos de idade e pessoa com 10 anos ou mais de idade que n�o tinham trabalho, 
					a pessoa que tinha outro trabalho remunerado recebendo somente em benef�cios e a pessoa que tinha outro trabalho n�o remunerado na semana de refer�ncia do Censo"	*/
@236 	M4522 $1.	/*	"INDICADORA DE IMPUTA��O NA V4522
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@237 	V4523 6.	/*	"TOTAL DE RENDIMENTOS NOS DEMAIS TRABALHOS
					Branco- para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@243 	V4524 6.2	/*	"TOTAL DE RENDIMENTOS NOS DEMAIS TRABALHOS, EM SAL�RIOS M�NIMOS
					Branco- para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@249 	V4525 6.	/*	"TOTAL DE RENDIMENTOS EM TODOS OS TRABALHOS
					Branco- para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@255 	V4526 6.2	/*	"TOTAL DE RENDIMENTOS EM TODOS OS TRABALHOS, EM SAL�RIOS M�NIMOS
					Branco- para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@261 	V0453 2.	/*	"HORAS TRABALHADAS POR SEMANA NO TRABALHO PRINCIPAL
					Branco- para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@263 	M4523 $1.	/*	"INDICADORA DE IMPUTA��O NA V4523
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@264 	V0454 2.	/*	"HORAS TRABALHADAS NOS DEMAIS TRABALHOS
					Branco- para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@266 	M0454 $1.	/*	"INDICADORA DE IMPUTA��O NA V0454
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@267 	V4534 3.	/*	"TOTAL DE HORAS TRABALHADAS
					Branco- para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que n�o tinham trabalho 
					na semana de refer�ncia do Censo"	*/
@270 	V0455 $1.	/*	"PROVID�NCIA PARA CONSEGUIR TRABALHO
					1� Sim
					2- N�o
					Branco� para a pessoa com menos de 10 anos de idade e a pessoa com 10 anos ou mais de idade que tinha trabalho 
					na semana de refer�ncia do Censo"	*/
@271 	M0455 $1.	/*	"INDICADORA DE IMPUTA��O NA V0455
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@272 	V0456 $1.	/*	"EM JULHO DE 2000, ERA APOSENTADO DE INSTITUTO DE PREVID�NCIA OFICIAL
					1- Sim
					2- N�o
					Branco- para as pessoas com menos de 10 anos de idade"	*/
@273 	M0456 $1.	/*	"INDICADORA DE IMPUTA��O NA V0456
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@274 	V4573 6.	/*	"RENDIMENTO DE APOSENTADORIA, PENS�O
					Branco- para a pessoa com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@280 	M4573 $1.	/*	"INDICADORA DE IMPUTA��O NA V4573
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@281 	V4583 6.	/*	"RENDIMENTO DE ALUGUEL
					Branco- para a pessoa com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@287 	M4583 $1.	/*	"INDICADORA DE IMPUTA��O NA V4583
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@288 	V4593 6.	/*	"RENDIMENTO DE PENS�O ALIMENT�CIA, MESADA, DOA��O
					Branco- para a pessoa com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@294 	M4593 $1.	/*	"INDICADORA DE IMPUTA��O NA V4593
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@295 	V4603 6.	/*	"RENDIMENTO DE RENDA M�NIMA, BOLSA-ESCOLA, SEGURO-DESEMPREGO
					Branco- para a pessoa com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@301 	M4603 $1.	/*	"INDICADORA DE IMPUTA��O NA V4603
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@302 	V4613 6.	/*	"OUTROS RENDIMENTOS
					Branco- para a pessoa com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@308 	M4613 $1.	/*	"INDICADORA DE IMPUTA��O NA V4613
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@309 	V4614 6.	/*	"TOTAL DE RENDIMENTOS
					Branco- para a pessoa com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@315 	V4615 6.2	/*	"TOTAL DE RENDIMENTOS, EM SAL�RIOS M�NIMOS
					Branco- para a pessoa com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@321 	V4620 2.	/*	"TOTAL DE FILHOS NASCIDOS VIVOS
					Branco- para os homens e as mulheres com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@323 	M4620 $1.	/*	"INDICADORA DE IMPUTA��O NA V4620
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@324 	V0463 2.	/*	"TOTAL DE FILHOS NASCIDOS VIVOS QUE ESTAVAM VIVOS
					Branco- para os homens, as mulheres com menos de 10 anos de idade e as mulheres com 10 anos ou mais de idade 
					que n�o tiveram filhos vivos at� a data de refer�ncia do Censo"	*/
@326 	V4654 2.	/*	"IDADE CALCULADA DO �LTIMO FILHO NASCIDO VIVO
					Branco- para os homens, as mulheres com menos de 10 anos de idade e as mulheres com 10 anos de idade ou mais 
					que n�o tiveram filhos vivos at� a data de refer�ncia do Censo"	*/
@328 	M4654 $1.	/*	"INDICADORA DE IMPUTA��O NA V4654
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@329 	V4670 2.	/*	"TOTAL DE FILHOS NASCIDOS MORTOS
					Branco- para os homens e as mulheres com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@331 	M4670 $1.	/*	"INDICADORA DE IMPUTA��O NA V4670
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@332 	V4690 2.	/*	"TOTAL DE FILHOS TIDOS
					Branco- para os homens e as mulheres com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@334 	M0463 $1.	/*	"INDICADORA DE IMPUTA��O NA V0463
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@335 	P001 11.8	/*	PESO (Peso atribu�do � pessoa)	*/
@346 	ESTR $2.	/*	ESTRATO DE IMPUTA��O DE RENDA	*/
@348 	ESTRP $2.	/*	ESTRATO DE IMPUTA��O DE RENDA PARCIAL	*/
@350 	V4621 2.	/*	"FILHOS NASCIDOS VIVOS: HOMENS
					Branco- para os homens e as mulheres com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@352 	M4621 $1.	/*	"INDICADORA DE IMPUTA��O NA V4621
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@353 	V4622 2.	/*	"FILHOS NASCIDOS VIVOS: MULHERES
					Branco- para os homens e as mulheres com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@355 	M4622 $1.	/*	"INDICADORA DE IMPUTA��O NA V4622
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@356 	V4631 2.	/*	"FILHOS QUE ESTAVAM VIVOS: HOMENS
					Branco- para os homens, as mulheres com menos de 10 anos de idade e as mulheres com 10 anos de idade ou mais 
					que n�o tiveram filhos vivos at� a data de refer�ncia do Censo"	*/
@358 	M4631 $1.	/*	"INDICADORA DE IMPUTA��O NA V4631
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@359 	V4632 2.	/*	"FILHOS QUE ESTAVAM VIVOS: MULHERES
					Branco- para os homens, as mulheres com menos de 10 anos de idade e as mulheres com 10 anos de idade ou mais 
					que n�o tiveram filhos vivos at� a data de refer�ncia do Censo"	*/
@361 	M4632 $1.	/*	"INDICADORA DE IMPUTA��O NA V4632
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@362 	V0464 $1.	/*	"SEXO DO �LTIMO FILHO NASCIDO VIVO
					1- Masculino
					2- Feminino
					Branco- para os homens, as mulheres com menos de 10 anos de idade e as mulheres com 10 anos ou mais 
					que n�o tiveram  filhos vivos at� a data de refer�ncia do Censo"	*/
@363 	M0464 $1.	/*	"INDICADORA DE IMPUTA��O NA V0464
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@364 	V4671 2.	/*	"FILHOS NASCIDOS MORTOS: HOMENS
					Branco- para os homens e as mulheres com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@366 	M4671 $1.	/*	"INDICADORA DE IMPUTA��O NA V4671
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@367 	V4672 2.	/*	"FILHOS NASCIDOS MORTOS: MULHERES
					Branco- para os homens e as mulheres com menos de 10 anos de idade na data de refer�ncia do Censo"	*/
@369 	M4672 $1.	/*	"INDICADORA DE IMPUTA��O NA V4672
					0- Sem imputa��o
					1- NIM/IMPS
					2- PR�-DIA
					3- DIA
					4- PR�-DIA e DIA
					5- SPLUS
					6- DIA e SPLUS
					7- P�S-SPLUS
					8- PR�-DIA e P�S-SPLUS
					9- DIA e P�S-SPLUS
					A- PR�-DIA, DIA e P�S-SPLUS
					C- DIA, SPLUS e P�S-SPLUS"	*/
@370 	V4354 $3.	/*	"C�DIGO DO CURSO MAIS ELEVADO CONCLU�DO (CONCLA)
					Branco- para os estudantes que n�o conclu�ram curso CATEGORIAS NO ARQUIVO �Cursos Superiores-Estrutura V4534.xls�"	*/
@373 	V4219 $3.	/*	"C�DIGO DA UF OU PA�S DE NASCIMENTO (ONU)
					Branco- para os n�o migrantes e os naturais da Unidade da Federa��o onde foi realizado o Censo 2000. 	
					CATEGORIAS NO ARQUIVO �Estrutura ONU V4219, V4269.xls�"	*/
@376 	V4239 $3.	/*	"C�DIGO DA UF OU PA�S (ONU) DE RESID�NCIA ANTERIOR
					Branco- para os n�o migrantes e os que moram na Unidade da Federa��o h� 10 anos ou mais 
					CATEGORIAS NO ARQUIVO �Estrutura ONU  V4239.xls�"	*/
@379 	V4269 $3.	/*	"C�DIGO DA UF OU PA�S (ONU) DE RESID�NCIA EM 31/07/1995
					Branco- para os n�o migrantes, os moradores no munic�pio onde foi realizado o Censo 2000 e os nascidos em 31/07/1995.
					CATEGORIAS NO ARQUIVO �Estrutura ONU V4219, V4269.xls�"	*/
@382 	V4279 $3.	/*	C�DIGO DO PA�S ESTRANGEIRO (ONU) QUE TRABALHA OU ESTUDA CATEGORIAS NO ARQUIVO �Estrutura ONU V4279.xls�	*/
@385 	V4451 $3.	/*	"C�DIGO ANTIGO DA OCUPA��O
					Branco- para pessoa de 10 anos de idade ou pessoa de 10 ou mais anos de idade que n�o tinha trabalho 
					na semana de refer�ncia CATEGORIAS NO ARQUIVO �Ocupa��o91-Estrutura.xls�"	*/
@388 	V4461 $3.	/*	"C�DIGO ANTIGO DA ATIVIDADE
					Branco- para pessoa de 10 anos de idade ou pessoa de 10 ou mais anos de idade que n�o tinha trabalho 
					na semana de refer�ncia CATEGORIAS NO ARQUIVO �Atividade91-Estrutura.xls�"	*/
;
RUN;

%MEND;


 /* Exemplo de chamada da macro para o Acre
    %LE_PESSOAS(\\CHI00534610\PUBLICO_IBGE,12); */
