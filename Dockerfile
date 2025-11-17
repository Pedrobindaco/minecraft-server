FROM eclipse-temurin:17

WORKDIR /server

# Copiar tudo do repo para o container
COPY . .

# Aceitar EULA automaticamente
RUN echo "eula=true" > eula.txt

# Instalar unzip (para descompactar seu mundo)
RUN apt-get update && apt-get install -y unzip

# Descompactar seu mundo, se existir o arquivo
RUN if [ -f "meu_mundo.zip" ]; then unzip meu_mundo.zip; fi

# Porta padrão do Minecraft
EXPOSE 25565

# Comando para iniciar o servidor
CMD ["java", "-Xms1G", "-Xmx2G", "-jar", "server.jar", "nogui"]
