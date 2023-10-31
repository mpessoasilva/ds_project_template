# apagando os data frames do enviroment

rm(list = ls())


## lendo arquivos dos agregados dos setores censitarios 
## dados armanezados na landing

Basico_RR	<- read_excel("data/landing/2000/setor_censitario/Basico_RR.XLS")

Domicilio_RR	<- read_excel("data/landing/2000/setor_censitario/Domicilio_RR.XLS")
Instrucao1_RR	<- read_excel("data/landing/2000/setor_censitario/Instrucao1_RR.XLS")
Instrucao2_RR	<- read_excel("data/landing/2000/setor_censitario/Instrucao2_RR.XLS")
Instrucao3_RR	<- read_excel("data/landing/2000/setor_censitario/Instrucao3_RR.XLS")
Instrucao4_RR	<- read_excel("data/landing/2000/setor_censitario/Instrucao4_RR.XLS")
Instrucao5_RR	<- read_excel("data/landing/2000/setor_censitario/Instrucao5_RR.XLS")
Instrucao6_RR	<- read_excel("data/landing/2000/setor_censitario/Instrucao6_RR.XLS")
Morador_RR	  <- read_excel("data/landing/2000/setor_censitario/Morador_RR.XLS")
Pessoa1_RR	<- read_excel("data/landing/2000/setor_censitario/Pessoa1_RR.XLS")
Pessoa2_RR	<- read_excel("data/landing/2000/setor_censitario/Pessoa2_RR.XLS")
Pessoa3_RR	<- read_excel("data/landing/2000/setor_censitario/Pessoa3_RR.XLS")
Pessoa4_RR	<- read_excel("data/landing/2000/setor_censitario/Pessoa4_RR.XLS")
Pessoa5_RR	<- read_excel("data/landing/2000/setor_censitario/Pessoa5_RR.XLS")
Pessoa6_RR	<- read_excel("data/landing/2000/setor_censitario/Pessoa6_RR.XLS")
Pessoa7_RR	  <- read_excel("data/landing/2000/setor_censitario/Pessoa7_RR.XLS")
Responsavel1_RR	<- read_excel("data/landing/2000/setor_censitario/Responsavel1_RR.XLS")
Responsavel2_RR	<- read_excel("data/landing/2000/setor_censitario/Responsavel2_RR.XLS")
Responsavel3_RR	<- read_excel("data/landing/2000/setor_censitario/Responsavel3_RR.XLS")
Responsavel4_RR	<- read_excel("data/landing/2000/setor_censitario/Responsavel4_RR.XLS")
Responsavel5_RR	<- read_excel("data/landing/2000/setor_censitario/Responsavel5_RR.XLS")




# saldando os arquivos dos setores censitarios em formato R
# salvando dados brutos na raw

save(Basico_RR, file ="data/raw/2000/setor_censitario/Basico_RR.Rdata")
save(Domicilio_RR, file ="data/raw/2000/setor_censitario/Domicilio_RR.Rdata")
save(Instrucao1_RR, file ="data/raw/2000/setor_censitario/Instrucao1_RR.Rdata")
save(Instrucao2_RR, file ="data/raw/2000/setor_censitario/Instrucao2_RR.Rdata")
save(Instrucao3_RR, file ="data/raw/2000/setor_censitario/Instrucao3_RR.Rdata")
save(Instrucao4_RR, file ="data/raw/2000/setor_censitario/Instrucao4_RR.Rdata")
save(Instrucao5_RR, file ="data/raw/2000/setor_censitario/Instrucao5_RR.Rdata")
save(Instrucao6_RR, file ="data/raw/2000/setor_censitario/Instrucao6_RR.Rdata")
save(Morador_RR, file ="data/raw/2000/setor_censitario/Morador_RR.Rdata")
save(Pessoa1_RR, file ="data/raw/2000/setor_censitario/Pessoa1_RR.Rdata")
save(Pessoa2_RR, file ="data/raw/2000/setor_censitario/Pessoa2_RR.Rdata")
save(Pessoa3_RR, file ="data/raw/2000/setor_censitario/Pessoa3_RR.Rdata")
save(Pessoa4_RR, file ="data/raw/2000/setor_censitario/Pessoa4_RR.Rdata")
save(Pessoa5_RR, file ="data/raw/2000/setor_censitario/Pessoa5_RR.Rdata")
save(Pessoa6_RR, file ="data/raw/2000/setor_censitario/Pessoa6_RR.Rdata")
save(Pessoa7_RR, file ="data/raw/2000/setor_censitario/Pessoa7_RR.Rdata")
save(Responsavel1_RR, file ="data/raw/2000/setor_censitario/Responsavel1_RR.Rdata")
save(Responsavel2_RR, file ="data/raw/2000/setor_censitario/Responsavel2_RR.Rdata")
save(Responsavel3_RR, file ="data/raw/2000/setor_censitario/Responsavel3_RR.Rdata")
save(Responsavel4_RR, file ="data/raw/2000/setor_censitario/Responsavel4_RR.Rdata")
save(Responsavel5_RR, file ="data/raw/2000/setor_censitario/Responsavel5_RR.Rdata")


# apagando os data frames do enviroment

rm(list = ls())






