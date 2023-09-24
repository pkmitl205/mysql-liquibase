#!/bin/sh

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Check if the count parameter is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <count>"
    exit 1
fi

COUNT=$1

# Update the LIQUIBASE_DATABASE_URL with the actual port number and database name
LIQUIBASE_DATABASE_URL=$(echo $LIQUIBASE_DATABASE_URL | sed "s/\${MYSQL_PORT}/$MYSQL_PORT/" | sed "s/\${MYSQL_DATABASE}/$MYSQL_DATABASE/")

# Run Liquibase rollback using Docker exec
docker exec liquibase \
  mvn liquibase:rollback \
    -Dliquibase.rollbackCount=$COUNT \
    -Dliquibase.driver=$LIQUIBASE_DATABASE_DRIVER \
    -Dliquibase.url=$LIQUIBASE_DATABASE_URL \
    -Dliquibase.username=$MYSQL_USER \
    -Dliquibase.password=$MYSQL_PASSWORD \
    -Dliquibase.changeLogFile=app/src/main/resources/dbchangelog/changelog.xml \
    -Dliquibase.verbose=true
