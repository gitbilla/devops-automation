FROM openjdk:8
EXPOSE 8080
ADD target/Abraham Augustine-devops-integration.jar Abraham Augustine-devops-integration.jar
ENTRYPOINT ["java","-jar","/Abraham Augustine-devops-integration.jar"]
