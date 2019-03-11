# Imatge postgres:base
## @edt ASIX-M06 Curs 2017-2018

Creació de la imatges postgres base amb la base de dades **training**

Imatge amb postgres amb la DB tarining:
 * productos
 * pedidos
 * clientes
 * repventas
 * oficinas

Cal activar el servei  com a usuari postgres
 * activar el servei
  * su -l postgres
  * /usr/bin/pg_ctl -D /var/lib/pgsql/data -l logfile start
 * disposa d'un usuari local edtasixm06 amb drets da la base de dades i a les taules.
 * configurada per acceptar connexions remotes de "*"

**pendent**
 * Generar el dockerfile
 * automatitzar la arrancada

