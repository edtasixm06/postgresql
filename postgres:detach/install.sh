#! /bin/bash
# install.sh
# @edt ASIX-M06 Curs 2017-2018
#
# Generar imatge postgres:base
# -----------------------------


su -l postgres
/usr/bin/pg_ctl -D /var/lib/pgsql/data -l logfile start
exit

mkdir /run/rpcbind 
touch /run/rpcbind/rpcbind.lock
/usr/sbin/rpcbind 
### pendent: configurar ip pública amb nom de host!
cp /opt/docker/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
cp /opt/docker/postgresql.conf /var/lib/pgsql/data/postgresql.conf

# --------------------------
# Configurar compte postgres 
# --------------------------
echo "jupiter" | passwd --stdin postgres
useradd edtasixm06
echo "edtasixm06" | passwd --stdin edtasixm06

/usr/libexec/postgresql-ctl restart
/usr/libexec/postgresql-ctl reload
/usr/libexec/postgresql-ctl stop
/usr/libexec/postgresql-ctl start

su -l postgres
psql template1
CREATE USER edtasixm06;
#grant ALL ON DATABASE template1 TO edtasixm06;
create database training;
grant ALL ON DATABASE training to edtasixm06;
grant ALL on oficinas, pedidos, productos, repventas, clientes to edtasixm06;

\q
psql training
\i /opt/docker/training/pedidos.sql
\i /opt/docker/training/productos.sql
\i /opt/docker/training/clientes.sql
\i /opt/docker/training/repventas.sql

\copy pedidos from /opt/docker/training/pedidos.dat 
\copy productos from /opt/docker/training/productos.dat 
\copy clientes from /opt/docker/training/clientes.dat  
\copy repventas from /opt/docker/training/repventas.dat 
\copy oficinas from /opt/docker/training/oficinas.dat  

exit


