# instalando pacotes necessarios para a ingestao de dados

install.packages("summarytools")
library(summarytools)

# Definir o nome do arquivo
file_path <- "data/landing/2010/amostra/Amostra_Emigracao_14.txt"


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
                1,
                4,
                4,
                7,
                1,
                1,
                1,
                1,
                1
                )

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
               "V1006 ",
               "V0303",
               "V0304",
               "V0305",
               "V3061",
               "M0303",
               "M0304",
               "M0305",
               "M3061",
               "V1005"
               )

# Ler o arquivo usando read.fwf
data <- read.fwf(file_path, widths = col_widths, col.names = col_names)

# Visualizar os primeiros registros para verificar se os dados foram importados corretamente
head(data)

#faz uma breve descrição dos dados
# profile simples


dfSummary(data)

# salvando na camada sot - dado para ser usado

save(data, file = "data/raw/2010/amostra/emigracao_2010_14.RData")




