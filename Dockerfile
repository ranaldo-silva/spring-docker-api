# Etapa única: Apenas executa o JAR já compilado
FROM eclipse-temurin:17-jre

WORKDIR /app

# CORREÇÃO CRUCIAL: Usamos o caminho e nome de arquivo exatos do JAR gerado pelo Gradle:
# O arquivo é: spring-docker-api-0.0.1-SNAPSHOT.jar
# E o caminho é: build/libs/
COPY build/libs/spring-docker-api-0.0.1-SNAPSHOT.jar app.jar

# Deixamos as variáveis de ambiente fora, pois o docker-compose.yml as injeta.
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
