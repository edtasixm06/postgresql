#! /bin/bash
# install.sh
# @edt ASIX-M06 Curs 2017-2018
#
# Generar imatge postgres:base
# -----------------------------


mkdir /run/rpcbind
touch /run/rpcbind/rpcbind.lock
/usr/sbin/rpcbind

echo "jupiter" | passwd --stdin postgres
useradd edtasixm06
echo "edtasixm06" | passwd --stdin edtasixm06

cp /opt/docker/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
cp /opt/docker/postgresql.conf /var/lib/pgsql/data/postgresql.conf

su -l postgres
OOMScoreAdjust=-1000
PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
PG_OOM_ADJUST_VALUE=0
PGSTARTTIMEOUT=270
PGDATA=/var/lib/pgsql/data
export OOMScoreAdjust PG_OOM_ADJUST_FILE PG_OOM_ADJUST_VALUE PGSTARTTIMEOUT PGDATA 
pg_ctl initdb 
/usr/bin/pg_ctl -D /var/lib/pgsql/data -l logfile start
exit

# --------------------------
/usr/libexec/postgresql-ctl restart
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
# ------------------------------------------------------------

