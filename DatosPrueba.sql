insert into empleado values (0,'Gerente Principal', 'Activo');
insert into empleado values (1,'Cocinero Principal', 'Activo');
insert into empleado values (2,'Camarero Principal', 'Activo');

insert into gerente values (0);
insert into cocinero values (1);
insert into camarero values (2);

insert into da_alta values(1, 0);
insert into da_alta values(2, 0);

insert into mesa values ('M1');
insert into mesa values ('M2');
insert into mesa values ('M3');
insert into mesa values ('M4');

insert into ingrediente values('I1', 'Cebolla');
insert into ingrediente values('I2', 'Tomate');
insert into ingrediente values('I3', 'Huevo');
insert into ingrediente values('I4', 'Atun');
insert into ingrediente values('I5', 'Lechuga');
insert into ingrediente values('I6', 'Patata');
insert into ingrediente values('I7', 'Sal');
insert into ingrediente values('I8', 'Agua');
insert into ingrediente values('I9', 'Refresco');
insert into ingrediente values('I10', 'Cerveza');

insert into producto values('P1', 'Tortilla', 3.5, 'Tortilla de patatas', 'primer plato');
insert into producto values('P2', 'Ensalada', 2, 'Ensalada mixta', 'entrante');
insert into producto values('P3', 'Agua', 3.5, 'Agua mineral', 'bebida');
insert into producto values('P4', 'Refresco', 1, 'Refresco con gas', 'bebida');
insert into producto values('P5', 'Cerveza', 2.25, 'Cerveza con alcohol', 'bebida');

insert into contiene_ing values('I1','P1');
insert into contiene_ing values('I3','P1');
insert into contiene_ing values('I6','P1');
insert into contiene_ing values('I1','P2');
insert into contiene_ing values('I2','P2');
insert into contiene_ing values('I5','P2');
insert into contiene_ing values('I8','P3');
insert into contiene_ing values('I9','P4');
insert into contiene_ing values('I10','P5');


insert into pedido_hace values(1, trunc(SYSDATE), 'M1', NULL, 'solicitado');
insert into pedido_hace values(2, trunc(SYSDATE), 'M2', NULL, 'aceptado');
insert into pedido_hace values(3, trunc(SYSDATE), 'M3', NULL, 'finalizado');
insert into pedido_hace values(4, trunc(SYSDATE), 'M4', NULL, 'servido');

insert into prepara values(2, trunc(SYSDATE), 1);
insert into prepara values(3, trunc(SYSDATE), 1);
insert into prepara values(4, trunc(SYSDATE), 1);

insert into sirve values(4, trunc(SYSDATE), 2);

insert into contiene_prod values(1, trunc(SYSDATE), 'P1', 4);
insert into contiene_prod values(2, trunc(SYSDATE), 'P2', 1);
insert into contiene_prod values(3, trunc(SYSDATE), 'P3', 3);
insert into contiene_prod values(4, trunc(SYSDATE), 'P4', 2);

insert into factura values(1, trunc(SYSDATE), NULL, 4);

insert into contiene_ped values(4, trunc(SYSDATE), 1, trunc(SYSDATE));

insert into cobra values(1, trunc(SYSDATE), 2);

commit;
