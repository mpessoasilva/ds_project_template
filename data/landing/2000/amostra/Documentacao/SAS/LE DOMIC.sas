/****************************  MACRO PARA LEITURA DO ARQUIVO DE DOMIC�LIOS   ********************************************/

/* 	PAR�METROS DE ENTRADA	

		PASTA - caminho da pasta onde est� o arquivo com as informa��es dos domic�lios da UF desejada.
		UF - c�digo num�rico da UF desejada
	
	SAIDA 

		Arquivo DOMIC no formato SAS

****************************************************************************************************************************/

%MACRO LE_DOMIC(PASTA,UF);

FILENAME DOMIC "&PASTA.\DOM&UF..TXT" LRECL=170 ;

DATA DOMIC;
INFILE DOMIC MISSOVER;
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
					A RELA��O ENCONTRA-SE NO ARQUIVO Divis�o Territorial Brasileira.xls�"	*/
@12 	V0103 $7.	/*	"CODIGO DO MUNIC�PIO
					A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@19 	V0104 $9.	/*	"CODIGO DO DISTRITO
					A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@28 	V0105 $11.	/*	"CODIGO DO SUBDISTRITO
					A RELA��O ENCONTRA-SE NO ARQUIVO �Divis�o Territorial Brasileira.xls�"	*/
@39 	V0300 8.	/*	CONTROLE	*/
@47 	V0400 2.	/*	'= 00 (DOMIC�LIO) 	*/
@49 	V1001 $1.	/*	"REGI�O GEOGR�FICA
					1- Regi�o Norte
					2- Regi�o Nordeste
					3- Regi�o Sudeste
					4- Regi�o Sul
					5- Regi�o Centro-Oeste"	*/
@50 	V1004 $2.	/*	"REGI�O METROPOLITANA
						VER ARQUIVO AUXILIARES"	*/
@52 	AREAP $13.	/*	"�REA DE PONDERA��O
					CATEGORIAS NO ARQUIVO �Munic�pios Com Mais de Uma �rea de Pondera��o.xls�"	*/
@65 	V1005 $1.	/*	"SITUA��O DO SETOR
					1- �rea urbanizada de vila ou cidade
					2- �rea n�o urbanizada de vila ou cidade
					3- �rea urbanizada isolada
					4- Rural - extens�o urbana
					5- Rural - povoado
					6- Rural - n�cleo
					7- Rural - outros aglomerados
					8- Rural - exclusive os aglomerados rurais"	*/
@66 	V1006 $1.	/*	"SITUA��O DO DOMIC�LIO
					1- Urbano
					2- Rural"	*/
@67 	V1007 $1.	/*	"TIPO DO SETOR
					0- Setor comum ou n�o especial
					1- Setor especial de aglomerado subnormal
					2- Setor especial de quart�is, bases militares, etc.
					3- Setor especial de alojamento, acampamentos, etc.
					4- Setor especial de embarca��es, barcos, navios, etc.
					5- Setor especial de aldeia ind�gena
					6- Setor especial de penitenci�rias, col�nias penais, pres�dios, cadeias, etc.
					7- Setor especial de asilos, orfanatos, conventos, hospitais, etc."	*/
@68 	V0110 2.	/*	TOTAL DE HOMENS	*/
@70 	V0111 2.	/*	TOTAL DE MULHERES	*/
@72 	V0201 $1.	/*	"ESP�CIE DE DOMICILIO
					1- Particular permanente
					2- Particular improvisado
					3- Coletivo"	*/
@73 	M0201 $1.	/*	"INDICADORA DE IMPUTA��O NA V0201
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
@74 	V0202 $1.	/*	"TIPO DO DOMIC�LIO
					1- Casa
					2- Apartamento
					3- C�modo
					Branco- N�o aplic�vel"	*/
@75 	M0202 $1.	/*	"INDICADORA DE IMPUTA��O NA V0202
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
@76 	V0203 2.	/*	"TOTAL DE C�MODOS
					Branco- para particular improvisado e domic�lio coletivo"	*/
@78 	M0203 $1.	/*	"INDICADORA DE IMPUTA��O NA V0203
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
@79 	V0204 1.	/*	"TOTAL DE C�MODOS SERVINDO DE DORMIT�RIO
					Branco- para particular improvisado e domic�lio coletivo"	*/
@80 	M0204 $1.	/*	"INDICADORA DE IMPUTA��O NA V0204
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
@81 	V0205 $1.	/*	"CONDI��O DO DOMIC�LIO
					1- Pr�prio, j� pago
					2- Pr�prio, ainda pagando
					3- Alugado
					4- Cedido por empregador
					5- Cedido de outra forma
					6- Outra Condi��o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@82 	M0205 $1.	/*	"INDICADORA DE IMPUTA��O NA V0205
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
@83 	V0206 $1.	/*	"CONDI��O DO TERRENO
					1- Pr�prio
					2- Cedido
					3- Outra condi��o
					Branco- para domic�lio particular improvisado, domic�lio coletivo e domic�lio particular permanente 
					que n�o � pr�prio (V0205 = 3 a 6)"	*/
@84 	M0206 $1.	/*	"INDICADORA DE IMPUTA��O NA V0206
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
@85 	V0207 $1.	/*	"FORMA DE ABASTECIMENTO DE �GUA
					1- Rede geral
					2- Po�o ou nascente (na propriedade)
					3- Outra
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@86 	M0207 $1.	/*	"INDICADORA DE IMPUTA��O NA V0207
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
@87 	V0208 $1.	/*	"TIPO DE CANALIZA��O
					1- Canalizada em pelo menos um c�modo
					2- Canalizada s� na propriedade ou terreno
					3- N�o canalizada
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@88 	M0208 $1.	/*	"INDICADORA DE IMPUTA��O NA V0208
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
@89 	V0209 $1.	/*	"TOTAL DE BANHEIROS
					0- N�o tem
					1- 1 banheiro
					2- 2 banheiros
					3- 3 banheiros
					4- 4 banheiros
					5- 5 banheiros
					6- 6 banheiros
					7- 7 banheiros
					8- 8 banheiros
					9- 9 ou mais banheiros
					Branco� para domic�lio particular improvisado e domic�lio coletivo"	*/
@90 	M0209 $1.	/*	"INDICADORA DE IMPUTA��O NA V0209
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
@91 	V0210 $1.	/*	"EXIST�NCIA DE SANIT�RIO
					1- Sim
					2- N�o
					Branco- para domic�lio particular improvisado, domic�lio coletivo e domic�lio particular permanente que tinha banheiro(s)"	*/
@92 	M0210 $1.	/*	"INDICADORA DE IMPUTA��O NA V0210
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
@93 	V0211 $1.	/*	"TIPO DE ESCOADOURO
					1- Rede geral de esgoto ou pluvial
					2- Fossa s�ptica
					3- Fossa rudimentar
					4- Vala
					5- Rio, lago ou mar
					6- Outro escoadouro
					Branco- para domic�lio particular improvisado, domic�lio coletivo e domic�lio particular permanente 
					que tinha banheiro(s) ou sanit�rio"	*/
@94 	M0211 $1.	/*	"INDICADORA DE IMPUTA��O NA V0211
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
@95 	V0212 $1.	/*	"COLETA DE LIXO
					1- Coletado por servi�o de limpeza
					2- Colocado em ca�amba de servi�o de limpeza
					3- Queimado (na propriedade)
					4- Enterrado (na propriedade)
					5- Jogado em terreno baldio ou logradouro
					6- Jogado em rio, lago ou mar
					7- Tem outro destino
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@96 	M0212 $1.	/*	"INDICADORA DE IMPUTA��O NA V0212
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
@97 	V0213 $1.	/*	"ILUMINA��O EL�TRICA
					1- Sim
					2- N�o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@98 	M0213 $1.	/*	"INDICADORA DE IMPUTA��O NA V0213
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
@99 	V0214 $1.	/*	"EXIST�NCIA DE R�DIO
					1- Sim
					2- N�o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@100 	M0214 $1.	/*	"INDICADORA DE IMPUTA��O NA V0214
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
@101 	V0215 $1.	/*	"EXIST�NCIA DE GELADEIRA OU FREEZER
						1- Sim
						2- N�o
						Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@102 	M0215 $1.	/*	"INDICADORA DE IMPUTA��O NA V0215
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
@103 	V0216 $1.	/*	"EXIST�NCIA DE VIDEOCASSETE
					1- Sim
					2- N�o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@104 	M0216 $1.	/*	"INDICADORA DE IMPUTA��O NA V0216
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
@105 	V0217 $1.	/*	"EXIST�NCIA DE M�QUINA DE LAVAR ROUPA
					1- Sim
					2- N�o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@106 	M0217 $1.	/*	"INDICADORA DE IMPUTA��O NA V0217
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
@107 	V0218 $1.	/*	"EXIST�NCIA DE FORNO DE MICROONDAS
					1- Sim
					2- N�o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@108 	M0218 $1.	/*	"INDICADORA DE IMPUTA��O NA V0218
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
@109 	V0219 $1.	/*	"EXIST�NCIA DE LINHA TELEF�NICA INSTALADA
					1- Sim
					2- N�o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@110 	M0219 $1.	/*	"INDICADORA DE IMPUTA��O NA V0219
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
@111 	V0220 $1.	/*	"EXIST�NCIA DE MICROCOMPUTADOR
					1- Sim
					2� N�o
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@112 	M0220 $1.	/*	"INDICADORA DE IMPUTA��O NA V0220
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
@113 	V0221 $1.	/*	"QUANTIDADE EXISTENTE DE TELEVISORES
					0- N�o tem
					1- 1 televisor
					2- 2 televisores
					3- 3 televisores
					4- 4 televisores
					5- 5 televisores
					6- 6 televisores
					7- 7 televisores
					8- 8 televisores
					9- 9 ou mais televisores
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@114 	M0221 $1.	/*	"INDICADORA DE IMPUTA��O NA V0221
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
@115 	V0222 $1.	/*	"QUANTIDADE EXISTENTE DE AUTOM�VEIS PARA USO PARTICULAR
					0- N�o tem
					1- 1 autom�vel
					2- 2 autom�veis
					3- 3 autom�veis
					4- 4 autom�veis
					5- 5 autom�veis
					6- 6 autom�veis
					7- 7 autom�veis
					8- 8 autom�veis
					9- 9 ou mais autom�veis
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@116 	M0222 $1.	/*	"INDICADORA DE IMPUTA��O NA V0222
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
@117 	V0223 $1.	/*	"QUANTIDADE EXISTENTE DE APARELHOS DE AR CONDICIONADO
					0- N�o tem
					1- 1 aparelho
					2- 2 aparelhos
					3- 3 aparelhos
					4- 4 aparelhos
					5- 5 aparelhos
					6- 6 aparelhos
					7- 7 aparelhos
					8- 8 aparelhos
					9- 9 ou mais aparelhos
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@118 	M0223 $1.	/*	"INDICADORA DE IMPUTA��O NA V0223
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
@119 	V7100 2.	/*	TOTAL DE MORADORES NO DOMIC�LIO	*/
@121 	V7203 3.1	/*	"DENSIDADE DE MORADORES POR C�MODO
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@124 	V7204 3.1	/*	"DENSIDADE DE MORADORES POR DORMIT�RIO
					Branco- para domic�lio particular improvisado e domic�lio coletivo"	*/
@127 	V7401 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 01
					Branco- para domic�lio coletivo"	*/
@129 	V7402 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 02
					Branco- para domic�lio coletivo"	*/
@131 	V7403 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 03
					Branco- para domic�lio coletivo"	*/
@133 	V7404 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 04
					Branco- para domic�lio coletivo"	*/
@135 	V7405 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 05
					Branco- para domic�lio coletivo"	*/
@137 	V7406 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 06
					Branco- para domic�lio coletivo"	*/
@139 	V7407 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 07
					Branco- para domic�lio coletivo"	*/
@141 	V7408 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 08
					Branco- para domic�lio coletivo"	*/
@143 	V7409 2.	/*	"N�MERO DE COMPONENTES DA FAM�LIA 09
					Branco- para domic�lio coletivo"	*/
@145 	V7616 6.	/*	TOTAL DE RENDIMENTOS DO DOMIC�LIO PARTICULAR	*/
@151 	V7617 6.2	/*	TOTAL DE RENDIMENTOS DO DOMIC�LIO PARTICULAR, EM SAL�RIOS M�NIMOS	*/
@157 	P001 11.8	/*	PESO (Peso atribu�do ao domic�lio)	*/
@168 	V1111 $1.	/*	"EXIST�NCIA DE IDENTIFICA��O
					1- Sim
					2- N�o
					9- Ignorado
					Branco- para domic�lio coletivo"	*/
@169 	V1112 $1.	/*	"EXIST�NCIA DE ILUMINA��O P�BLICA
					1- Sim
					2- N�o
					9- Ignorado
					Branco- para domic�lio coletivo"	*/
@170 	V1113 $1.	/*	"EXIST�NCIA DE CAL�AMENTO/PAVIMENTA��O
					1- Total
					2- Parcial
					3- N�o Existe
					9- Ignorado
					Branco- para domic�lio coletivo"	*/
;
RUN;

%MEND;

 /* Exemplo de chamada da macro para o Acre
	%LE_DOMIC(\\CHI00534610\Publico_IBGE,12)*/
