CREATE TABLE "oficinas" (
        "oficina" int2 NOT NULL,
        "ciudad" character varying(15) NOT NULL,
        "region" character varying(10) NOT NULL,
        "dir" int2,
        "objetivo" numeric(9,2),
        "ventas" numeric(9,2) NOT NULL,
	 primary key (oficina)
);

