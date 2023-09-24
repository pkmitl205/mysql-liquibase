FROM maven:3-jdk-8-alpine

LABEL MANTEINER="Phakon Rujireksareekul <phakon.js@gmail.com>"

ENV LIQUIBASE_PROJECT_DIR=${LIQUIBASE_PROJECT_DIR:-.}\
  LIQUIBASE_DATABASE_DRIVER=${LIQUIBASE_DATABASE_DRIVER:-com.mysql.cj.jdbc.Driver}\
  LIQUIBASE_DATABASE_URL=${LIQUIBASE_DATABASE_URL:-jdbc:mysql://localhost:3306/default}\
  LIQUIBASE_DATABASE_USERNAME=${LIQUIBASE_DATABASE_USERNAME:-root}\
  LIQUIBASE_DATABASE_PASSWORD=${LIQUIBASE_DATABASE_PASSWORD:-root}

ADD ${LIQUIBASE_PROJECT_DIR} /app

WORKDIR /app

# RUN mvn install:install-file -Dfile=./lib/mysql-connector-java-8.0.26.jar -DgroupId=mysql -DartifactId=mysql-connector-java -Dversion=8.0.26 -Dpackaging=jar && \
#   mvn install:install-file -Dfile=./lib/liquibase-core-4.6.1.jar -DgroupId=org.liquibase -DartifactId=liquibase-core -Dversion=4.6.1 -Dpackaging=jar

# CMD mvn liquibase:update -Dliquibase.driver=$LIQUIBASE_DATABASE_DRIVER -Dliquibase.url=$LIQUIBASE_DATABASE_URL -Dliquibase.username=$LIQUIBASE_DATABASE_USERNAME -Dliquibase.password=$LIQUIBASE_DATABASE_PASSWORD -Dliquibase.changeLogFile=app/src/main/resources/dbchangelog/changelog.xml -Dliquibase.verbose=true && tail -f /dev/null
# CMD ["sh", "-c", "mvn liquibase:update -Dliquibase.driver=${LIQUIBASE_DATABASE_DRIVER} -Dliquibase.url=${LIQUIBASE_DATABASE_URL} -Dliquibase.username=${LIQUIBASE_DATABASE_USERNAME} -Dliquibase.password=${LIQUIBASE_DATABASE_PASSWORD} -Dliquibase.changeLogFile=app/src/main/resources/dbchangelog/changelog.xml -Dliquibase.verbose=true && tail -f /dev/null"]
CMD ["sh", "-c", "tail -f /dev/null"]