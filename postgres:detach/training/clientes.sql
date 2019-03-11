
create table clientes
	(num_clie int2 not null,
	empresa varchar(20) not null,
	rep_clie int2 not null,
	limite_credito numeric(8,2),
	primary key (num_clie));
