# ---- build ----
FROM eclipse-temurin:21-jdk AS build
WORKDIR /build
COPY Backend/src ./src
COPY Backend/lib ./lib
RUN mkdir out && javac -encoding UTF-8 -cp "lib/*" -d out $(find src -name "*.java")

# ---- run ----
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /build/out ./out
COPY Backend/lib ./Backend/lib
COPY Frontend ./Frontend
ENV PORT=8080
EXPOSE 8080
CMD ["sh", "-c", "java -cp 'out:Backend/lib/*' server.CauseConnectServer ${PORT}"]
