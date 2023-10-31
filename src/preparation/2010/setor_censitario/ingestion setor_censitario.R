# apagando os data frames do enviroment

rm(list = ls())

## lendo arquivos dos agregados dos setores censitarios 
## dados armanezados na landing

Basico_RR	          <- read_excel("data/landing/2010/setor_censitario/Basico_RR.xls")
Domicilio01_RR	    <- read_excel("data/landing/2010/setor_censitario/Domicilio01_RR.XLS")
Domicilio02_RR	    <- read_excel("data/landing/2010/setor_censitario/Domicilio02_RR.xls")
DomicilioRenda_RR	  <- read_excel("data/landing/2010/setor_censitario/DomicilioRenda_RR.XLS")
Entorno01_RR	      <- read_excel("data/landing/2010/setor_censitario/Entorno01_RR.XLS")
Entorno02_RR	      <- read_excel("data/landing/2010/setor_censitario/Entorno02_RR.XLS")
Entorno03_RR		    <- read_excel("data/landing/2010/setor_censitario/Entorno03_RR.XLS")
Entorno04_RR		    <- read_excel("data/landing/2010/setor_censitario/Entorno04_RR.XLS")
Entorno05_RR		    <- read_excel("data/landing/2010/setor_censitario/Entorno05_RR.XLS")
Pessoa01_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa01_RR.xls")
Pessoa02_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa02_RR.xls")
Pessoa03_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa03_RR.xls")
Pessoa04_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa04_RR.xls")
Pessoa05_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa05_RR.xls")
Pessoa06_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa06_RR.xls")
Pessoa07_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa07_RR.xls")
Pessoa08_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa08_RR.xls")
Pessoa09_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa09_RR.xls")
Pessoa10_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa10_RR.xls")
Pessoa11_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa11_RR.xls")
Pessoa12_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa12_RR.xls")
Pessoa13_RR		      <- read_excel("data/landing/2010/setor_censitario/Pessoa13_RR.xls")
PessoaRenda_RR	    <- read_excel("data/landing/2010/setor_censitario/PessoaRenda_RR.XLS")
Responsavel01_RR	  <- read_excel("data/landing/2010/setor_censitario/Responsavel01_RR.xls")
Responsavel02_RR	  <- read_excel("data/landing/2010/setor_censitario/Responsavel02_RR.xls")
ResponsavelRenda_RR	<- read_excel("data/landing/2010/setor_censitario/ResponsavelRenda_RR.XLS")


# saldando os arquivos dos setores censitarios em formato R
# salvando dados brutos na raw

save(Basico_RR, file ="data/raw/2010/setor_censitario/Basico_RR.Rdata")
save(Domicilio01_RR, file ="data/raw/2010/setor_censitario/Domicilio01_RR.Rdata")
save(Domicilio02_RR, file ="data/raw/2010/setor_censitario/Domicilio02_RR.Rdata")
save(DomicilioRenda_RR, file ="data/raw/2010/setor_censitario/DomicilioRenda_RR.Rdata")
save(Entorno01_RR, file ="data/raw/2010/setor_censitario/Entorno01_RR.Rdata")
save(Entorno02_RR, file ="data/raw/2010/setor_censitario/Entorno02_RR.Rdata")
save(Entorno03_RR, file ="data/raw/2010/setor_censitario/Entorno03_RR.Rdata")
save(Entorno04_RR, file ="data/raw/2010/setor_censitario/Entorno04_RR.Rdata")
save(Entorno05_RR, file ="data/raw/2010/setor_censitario/Entorno05_RR.Rdata")
save(Pessoa01_RR, file ="data/raw/2010/setor_censitario/Pessoa01_RR.Rdata")
save(Pessoa02_RR, file ="data/raw/2010/setor_censitario/Pessoa02_RR.Rdata")
save(Pessoa03_RR, file ="data/raw/2010/setor_censitario/Pessoa03_RR.Rdata")
save(Pessoa04_RR, file ="data/raw/2010/setor_censitario/Pessoa04_RR.Rdata")
save(Pessoa05_RR, file ="data/raw/2010/setor_censitario/Pessoa05_RR.Rdata")
save(Pessoa06_RR, file ="data/raw/2010/setor_censitario/Pessoa06_RR.Rdata")
save(Pessoa07_RR, file ="data/raw/2010/setor_censitario/Pessoa07_RR.Rdata")
save(Pessoa08_RR, file ="data/raw/2010/setor_censitario/Pessoa08_RR.Rdata")
save(Pessoa09_RR, file ="data/raw/2010/setor_censitario/Pessoa09_RR.Rdata")
save(Pessoa10_RR, file ="data/raw/2010/setor_censitario/Pessoa10_RR.Rdata")
save(Pessoa11_RR, file ="data/raw/2010/setor_censitario/Pessoa11_RR.Rdata")
save(Pessoa12_RR, file ="data/raw/2010/setor_censitario/Pessoa12_RR.Rdata")
save(Pessoa13_RR, file ="data/raw/2010/setor_censitario/Pessoa13_RR.Rdata")
save(PessoaRenda_RR, file ="data/raw/2010/setor_censitario/PessoaRenda_RR.Rdata")
save(Responsavel01_RR, file ="data/raw/2010/setor_censitario/Responsavel01_RR.Rdata")
save(Responsavel02_RR, file ="data/raw/2010/setor_censitario/Responsavel02_RR.Rdata")
save(ResponsavelRenda_RR, file ="data/raw/2010/setor_censitario/ResponsavelRenda_RR.Rdata")

# apagando os data frames do enviroment

rm(list = ls())

