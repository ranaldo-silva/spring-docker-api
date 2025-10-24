# Etapa única: apenas executar o JAR
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copia o JAR já gerado
COPY api.jar app.jar

# Configurações de ambiente (ajuste conforme seu banco)
ENV SPRING_DATASOURCE_URL=jdbc:mysql://db-559210:3306/springdb
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=123456
ENV SERVER_PORT=8080

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]