# Build
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean compile exec:java

# Runtime
FROM nginx:alpine

COPY --from=build /app/output /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]