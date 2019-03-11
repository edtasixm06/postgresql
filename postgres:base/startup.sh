#!/bin/bash
# ----------------------------
# Sessió com a usuari postgres
# ----------------------------
su -l postgres
#OOMScoreAdjust=-1000
#PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
#PG_OOM_ADJUST_VALUE=0
#PGSTARTTIMEOUT=270
#PGDATA=/var/lib/pgsql/data
#export OOMScoreAdjust PG_OOM_ADJUST_FILE PG_OOM_ADJUST_VALUE PGSTARTTIMEOUT PGDATA
# Crear l'estructura de dades /var/libpgsql/data i engegar el servei
#pg_ctl initdb
/usr/bin/pg_ctl -D /var/lib/pgsql/data -l logfile start

# -----------------------------
# Valors del postgresql.service
# -----------------------------
#/usr/libexec/postgresql-check-db-dir %N
#/usr/libexec/postgresql-ctl start -D ${PGDATA} -s -w -t ${PGSTARTTIMEOUT}
#stop   /usr/libexec/postgresql-ctl stop -D ${PGDATA} -s -m fast
#reload /usr/libexec/postgresql-ctl reload -D ${PGDATA} -s

