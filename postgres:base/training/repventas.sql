CREATE TABLE "repventas" (
        "num_empl" int2 NOT NULL,
        "nombre" character varying(15) NOT NULL,
        "edad" int2,
        "oficina_rep" int2,
        "titulo" character varying(10),
        "contrato" date NOT NULL,
        "director" int2,
        "cuota" numeric(8,2),
        "ventas" numeric(8,2) NOT NULL,
	primary key (num_empl)
);
