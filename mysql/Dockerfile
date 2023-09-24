# Using MySQL version 8.0 as the base image
FROM mysql:8.0

# Maintainer of the Dockerfile
LABEL MAINTAINER="Phakon Rujireksareekul <phakon.js@gmail.com>"

# Creating a custom configuration file to override the bind-address setting.
# This allows connections from any IP address.
RUN echo "[mysqld]\nbind-address = 0.0.0.0" > /etc/mysql/conf.d/custom.cnf

# Running the MySQL server as the default command
CMD ["mysqld"]

# Exposing MySQL port 3306
EXPOSE 3306
