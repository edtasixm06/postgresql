CREATE TABLE "pedidos" (
        "num_pedido" int4 NOT NULL,
        "fecha_pedido" date NOT NULL,
        "clie" int2 NOT NULL,
        "rep" int2,
        "fab" character(3) NOT NULL,
        "producto" character(5) NOT NULL,
        "cant" int2 NOT NULL,
        "importe" numeric(7,2) NOT NULL,
	primary key (num_pedido)
);
