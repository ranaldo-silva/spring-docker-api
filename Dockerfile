# --- STAGE 1: BUILD ---
# Usa uma imagem do Gradle que inclui o JDK, ideal para compilação.
FROM gradle:7.6-jdk17 AS builder

# Define o diretório de trabalho dentro do contêiner de build
WORKDIR /app

# Copia os scripts e arquivos de configuração do Gradle
COPY gradlew .
COPY gradle /app/gradle
COPY build.gradle settings.gradle .

# Copia o código-fonte
COPY src /app/src

# Dá permissão de execução ao gradlew
RUN chmod +x ./gradlew

# Compila o projeto e gera o JAR executável (bootJar)
# Note: Usamos o script gradlew dentro do contêiner.
RUN ./gradlew bootJar --no-daemon -x test

# --- STAGE 2: RUNTIME (IMAGEM FINAL) ---
# Usa uma imagem JRE leve, ideal para produção e mais segura
FROM eclipse-temurin:17-jre-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia o JAR do estágio de build
# Note: O JAR tem o nome completo do projeto + versão e está em build/libs
COPY --from=builder /app/build/libs/spring-docker-api-0.0.1-SNAPSHOT.jar app.jar

# Configurações de ambiente (Variáveis serão sobrescritas pelo Docker Compose)
# Deixamos as variáveis de ambiente aqui APENAS como fallback/documentação
ENV SPRING_DATASOURCE_URL=jdbc:mysql://db-559210:3306/springdb
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=123456
ENV SERVER_PORT=8080

# Expõe a porta
EXPOSE 8080

# Comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
