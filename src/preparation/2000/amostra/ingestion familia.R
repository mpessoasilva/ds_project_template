# apagando os data frames do enviroment

rm(list = ls())

# Definir o nome do arquivo
file_path <- "data/landing/2000/amostra/FAMI14.txt"


# Definir larguras das colunas conforme a descrição das variáveis
col_widths <- c(2,
                4,
                5,
                7,
                9,
                11,
                8,
                2,
                1,
                2,
                13,
                1,
                2,
                7,
                2,
                7,
                2,
                8,
                2,
                2,
                2,
                2,
                2,
                2,
                2,
                11
                )

# Nome das colunas
col_names <- c("V0102",
               "V1002",
               "V1003",
               "V0103",
               "V0104",
               "V0105",
               "V0300",
               "V0404",
               "V1001",
               "V1004",
               "AREAP",
               "CODV0404",
               "CODV0404_2",
               "V4614B",
               "CODV4615B",
               "V4614C",
               "CODV4615C",
               "V4616_7400",
               "CODV4615_7400",
               "V7400",
               "CODV7400",
               "V7400A",
               "CODV7400A",
               "V7400B",
               "CODV7400B",
               "P001"
               )

# Ler o arquivo usando read.fwf
data <- read.fwf(file_path, widths = col_widths, col.names = col_names)

# Visualizar os primeiros registros para verificar se os dados foram importados corretamente
head(data)

#faz uma breve descrição dos dados
# profile simples


dfSummary(data)

# salvando na camada sot - dado para ser usado

save(data, file = "data/raw/2000/amostra/familia_2000_14.RData")


