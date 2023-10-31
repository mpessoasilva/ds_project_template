
### definindo diretorio de trabalho
setwd("D:/Projetos/20_Censo Demografico/0 data_censo")
  

## instalando bibliotecas necessarias

# Lista de pacotes que você deseja verificar e instalar, se necessário
pacotes <- c("summarytools", "readxl", "dplyr")

# Verifica se os pacotes não estão instalados e instala-os
pacotes_nao_instalados <- pacotes[!(pacotes %in% installed.packages()[,"Package"])]

if (length(pacotes_nao_instalados) > 0) {
  cat("Instalando os pacotes ausentes:", paste(pacotes_nao_instalados, collapse = ", "), "\n")
  install.packages(pacotes_nao_instalados)
} else {
  cat("Todos os pacotes necessários já estão instalados.\n")
}

# Carrega os pacotes
sapply(pacotes, require, character.only = TRUE)

