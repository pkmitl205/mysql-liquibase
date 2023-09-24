#!/bin/bash
set -e

# This script is a workaround for permission errors encountered with docker-machine/boot2docker on OSX.
# Reference: https://github.com/docker-library/mysql/issues/99

echo '* Adjusting permission errors locally by ensuring that "mysql" user uses the same uid and gid as the host volume'
# Fetching the UID of the owner of /var/lib/mysql
TARGET_UID=$(stat -c "%u" /var/lib/mysql)
echo '-- Setting mysql user to use uid '$TARGET_UID
# Changing the UID of mysql user to the TARGET_UID
usermod -o -u $TARGET_UID mysql || true

# Fetching the GID of the group owning /var/lib/mysql
TARGET_GID=$(stat -c "%g" /var/lib/mysql)
echo '-- Setting mysql group to use gid '$TARGET_GID
# Changing the GID of mysql group to the TARGET_GID
groupmod -o -g $TARGET_GID mysql || true
echo

echo '* Starting MySQL'
# Adjusting ownership for the mysql runtime directory
chown -R mysql:root /var/run/mysqld/
# Starting the MySQL server with the adjusted user
/entrypoint.sh mysqld --user=mysql --console
