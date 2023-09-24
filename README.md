# LIQUIBASE + MYSQL

## Requirements
- Docker and Docker Compose

## Getting Started

1. Clone the repository:
   ```sh
   git clone https://github.com/pkmitl205/mysql-liquibase
   ```
2. Change to the mysql-liquibase directory:
    ```sh
    cd mysql-liquibase
    ```
3. Start the environment using Docker Compose:
    ```sh
    docker-compose up -d
    ```
4. To stop the environment, run:
    ```sh
    docker-compose down
    ```

#### Updating the Database

1. Write your database changes in the Liquibase changelog located at:
    ```sh
    /mysql-liquibase/liquibase/src/main/resources/dbchangelog/changelog.xml
    ```

2. Run the update.sh script to apply your changes:
    ```sh
    ./update.sh
    ```

#### Rolling Back with rollbackCount
1. To roll back a specific number of changes, use the rollback.sh script with the desired count. For example, to roll back to changeset 1 (before a table was dropped), run:

```sh
./rollback.sh 1
```

> Replace <number count> with the desired rollback count.

This guide should help you get started with Liquibase and MySQL using Docker. You can make changes to the Liquibase changelog as needed, and the provided scripts will help you update and roll back your database changes.
