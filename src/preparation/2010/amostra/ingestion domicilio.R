# apagando os data frames do enviroment

rm(list = ls())


# instalando pacotes necessarios para a ingestao de dados

install.packages("summarytools")
library(summarytools)


# Definir o nome do arquivo
file_path <- "data/landing/2010/amostra/Amostra_Domicilios_14.txt"

# Definir larguras das colunas conforme a descrição das variáveis
col_widths <- c(2,
                5,
                13,
                8,
                16,
                1,
                2,
                3,
                2,
                1,
                2,
                2,
                1,
                6,
                9,
                1,
                2,
                3,
                2,
                3,
                1,
                1,
                1,
                2,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                2,
                1,
                1,
                7,
                10,
                8,
                9,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                1)

# Nome das colunas
col_names <- c("V0001",
               "V0002",
               "V0011",
               "V0300",
               "V0010",
               "V1001",
               "V1002",
               "V1003",
               "V1004",
               "V1006",
               "V4001",
               "V4002",
               "V0201",
               "V2011",
               "V2012",
               "V0202",
               "V0203",
               "V6203",
               "V0204",
               "V6204",
               "V0205",
               "V0206",
               "V0207",
               "V0208",
               "V0209",
               "V0210",
               "V0211",
               "V0212",
               "V0213",
               "V0214",
               "V0215",
               "V0216",
               "V0217",
               "V0218",
               "V0219",
               "V0220",
               "V0221",
               "V0222",
               "V0301",
               "V0401",
               "V0402",
               "V0701",
               "V6529",
               "V6530",
               "V6531",
               "V6532",
               "V6600",
               "V6210",
               "M0201",
               "M2011",
               "M0202",
               "M0203",
               "M0204",
               "M0205",
               "M0206",
               "M0207",
               "M0208",
               "M0209",
               "M0210",
               "M0211",
               "M0212",
               "M0213",
               "M0214",
               "M0215",
               "M0216",
               "M0217",
               "M0218",
               "M0219",
               "M0220",
               "M0221",
               "M0222",
               "M0301",
               "M0401",
               "M0701",
               "V1005",
               "M0402")

# Ler o arquivo usando read.fwf
data <- read.fwf(file_path, widths = col_widths, col.names = col_names)

# Visualizar os primeiros registros para verificar se os dados foram importados corretamente
head(data)

#faz uma breve descrição dos dados
# profile simples

install.packages("summarytools")
library(summarytools)

dfSummary(data)

# salvando na camada sot - dado para ser usado

save(data, file = "data/raw/2010/amostra/dom_2010_14.RData")

