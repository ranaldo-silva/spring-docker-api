# Etapa única: Apenas executa o JAR já compilado
FROM eclipse-temurin:17-jre

WORKDIR /app

# CORREÇÃO: Copia o JAR do caminho CORRETO (build/libs)
# O Docker build busca no contexto local, onde a pasta build existe.
COPY build/libs/spring-docker-api-0.0.1-SNAPSHOT.jar app.jar

# As variáveis de ambiente não precisam ser declaradas aqui,
# pois você as está injetando via docker-compose.yml.
# Deixamos apenas o EXPOSE e o ENTRYPOINT.
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
