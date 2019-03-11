CREATE TABLE "productos" (
        "id_fab" character(3) NOT NULL,
        "id_producto" character(5) NOT NULL,
        "descripcion" character varying(20) NOT NULL,
        "precio" numeric(7,2) NOT NULL,
        "existencias" int4 NOT NULL,
	primary key (id_fab,id_producto)
);
