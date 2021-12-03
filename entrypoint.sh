#!/usr/bin/env bash

#download wwi db
wget -P /var/opt/mssql/data/ https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak
chmod +x /var/opt/mssql/data/WideWorldImporters-Full.bak

# Run init-script with long timeout - and make it run in the background with "&"
# restore wwi db
/opt/mssql-tools/bin/sqlcmd -S localhost -l 60 -U SA -P ${MSSQL_SA_PASSWORD} -i /opt/mssql-scripts/restore.sql &

# the /var/opt/mssql/data directory was created by the mssql image
# create empty restore files as mssql user
touch /var/opt/mssql/data/WideWorldImporters.mdf
touch /var/opt/mssql/data/WideWorldImporters_UserData.ndf
touch /var/opt/mssql/data/WideWorldImporters.ldf

# restore demodb
#/opt/mssql-tools/bin/sqlcmd -S localhost -l 60 -U SA -P ${MSSQL_SA_PASSWORD} -i /opt/mssql-scripts/demodb.sql &

# Start SQL server
/opt/mssql/bin/sqlservr