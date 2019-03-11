#! /bin/bash
# install.sh
# @edt ASIX-M06 Curs 2017-2018
#
# Generar imatge postgres:base
# -----------------------------

mkdir /opt/docker

# -------------------
# Instal·lar softwae
# -------------------
dnf -y update vi
dnf -y install vim postgresql postgresql-server postgresql-libs rpcbind passwd
dnf -y install findutils
dnf -y install nmap procps iputils iproute

mkdir /run/rpcbind 
touch /run/rpcbind/rpcbind.lock
/usr/sbin/rpcbind 

# --------------------------------------
# Configurar per permetre l'accés remo
# --------------------------------------
vim /var/lib/pgsql/data/pg_hba.conf
  # IPv4 local connections:
  host    all             all             127.0.0.1/32            trust
  host    all             all             172.17.0.2/32           trust
  host    all             all             0.0.0.0/0               trust

vim /var/lib/pgsql/data/postgresql.conf 
 listen_addresses='*'

# --------------------------
# Configurar compte postgres 
# --------------------------
echo "jupiter" | passwd --stdin postgres
useradd edtasixm06
echo "edtasixm06" | passwd --stdin edtasixm06

# ----------------------------
# Sessió com a usuari postgres
# engegar el servei
# ----------------------------
su -l postgres
OOMScoreAdjust=-1000
PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
PG_OOM_ADJUST_VALUE=0
PGSTARTTIMEOUT=270
PGDATA=/var/lib/pgsql/data
export OOMScoreAdjust PG_OOM_ADJUST_FILE PG_OOM_ADJUST_VALUE PGSTARTTIMEOUT PGDATA 
# Crear l'estructura de dades /var/libpgsql/data i engegar el servei 
pg_ctl initdb 
/usr/bin/pg_ctl -D /var/lib/pgsql/data -l logfile start

/usr/libexec/postgresql-ctl restart
/usr/libexec/postgresql-ctl reload
/usr/libexec/postgresql-ctl stop
/usr/libexec/postgresql-ctl start

# -----------------------------
# Valors del postgresql.service
# -----------------------------
#/usr/libexec/postgresql-check-db-dir %N
#/usr/libexec/postgresql-ctl start -D ${PGDATA} -s -w -t ${PGSTARTTIMEOUT}
#stop   /usr/libexec/postgresql-ctl stop -D ${PGDATA} -s -m fast
#reload /usr/libexec/postgresql-ctl reload -D ${PGDATA} -s

# -----------------------------------------
# Crear un compte d'usuari local edtasixm06
# -----------------------------------------
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


# --------------------------------------------
# Crear la BD training com a usuari edtasixm06
# --------------------------------------------
exit
su -l edtasixm01
psql template1
create database training;

# ----------------
# Exemples d'acces
# ----------------
psql -qtA -F ';' training
psql -qtA -F ';' training -c "select * from oficinas";
psql -U edtasixm06 training -c "select *  from clientes;"
psql -h localhost -U edtasixm06 training -c "select *  from clientes;"
psql -h 172.17.0.2 -U edtasixm06 training -c "select *  from clientes;"




