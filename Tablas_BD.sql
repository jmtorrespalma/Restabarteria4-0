create table empleado(
IDEmpleado number(5),
Nombre varchar2(50),
Estado varchar2(10),
constraint DAE_PK primary key(IDEmpleado),
constraint DAE_ES_CHK CHECK (Estado='Activo' or Estado='Inactivo')
);

create table gerente (
idempleado number(5),
constraint GER_PK PRIMARY KEY (idempleado),
constraint GER_FK FOREIGN KEY (idempleado) references empleado(idempleado)
);

create table camarero (
idempleado number(5),
constraint CAM_PK PRIMARY KEY (idempleado),
constraint CAM_FK FOREIGN KEY (idempleado) references empleado(idempleado)
);

create table cocinero (
idempleado number(5),
constraint COC_PK PRIMARY KEY (idempleado),
constraint COC_FK FOREIGN KEY (idempleado) references empleado(idempleado)
);

create table Da_alta(
IDEmpleado number(5),
IDGerente number(5),
constraint DA_PK primary key(IDEmpleado),
constraint DA_E_FK foreign key (IDEmpleado) references Empleado(IDEmpleado),
constraint DA_G_FK foreign key (IDGerente) references Gerente(IDEmpleado)
);

create table Producto(
IDProducto varchar2(5),
Nombre varchar2(50),
Precio number,
Descripcion varchar2(250),
Tipo varchar2(20),
constraint P_PK primary key (Idproducto),
constraint P_T_CHK check(Tipo='entrante' or Tipo='primer plato' or Tipo='segundo plato' or Tipo='postre'or Tipo='bebida')
);

create table Mesa(
IdMesa varchar2(5),
constraint M_PK primary key (IdMesa)
);

create table Ingrediente(
IdIngrediente varchar2(5),
Nombre varchar2(50),
constraint I_PK primary key (IdIngrediente)
);


create table Factura(
IdFactura number(3),
Fecha date,
Hora timestamp,
Precio number,
constraint F_PK primary key (IdFactura,Fecha)
);

create table pedido_hace(
N_pedido number(3),
Fecha date,
IDMesa varchar2(5) constraint PH_IM_NN not null,
Hora timestamp,
Estado varchar2(10),
constraint PH_PK primary key (N_Pedido,Fecha),
constraint PH_IM_FK foreign key (IDMesa) references Mesa(IDMesa),
constraint PH_ES_CHK check (estado in('solicitado','aceptado','finalizado','servido'))
);

CREATE TABLE Cobra(
IdFactura number(5),
Fecha date,
IdEmpleado number(5),
constraint C_PK primary key (IdFactura,Fecha),
constraint C_IFF_FK foreign key (IdFactura,Fecha) references Factura(IdFactura,Fecha),
constraint C_IE_FK foreign key (IdEmpleado) references Camarero(IdEmpleado)
);


CREATE TABLE Contiene_Ing(
IdIngrediente varchar2(5),
IdProducto varchar2(5),
constraint CI_PK primary key (IdIngrediente,IdProducto),
constraint CI_IP_FK foreign key (IdProducto) references Producto(IdProducto),
constraint CI_II_FK foreign key (IdIngrediente) references Ingrediente(IdIngrediente)
);

create table Prepara(
N_pedido number(5),
Fecha date,
IdEmpleado number(5),
constraint PRE_PK primary key (N_pedido,Fecha),
constraint PRE_NPF_FK foreign key (N_pedido,Fecha) references Pedido_Hace(N_pedido,Fecha),
constraint PRE_IE_FK foreign key (IdEmpleado) references Cocinero(IdEmpleado)
);

create table Sirve(
N_pedido number(5),
Fecha date,
IdEmpleado number(5),
constraint S_PK primary key (N_pedido,Fecha),
constraint S_NPF_FK foreign key (N_pedido,Fecha) references Pedido_Hace(N_Pedido,Fecha),
constraint S_IE_F foreign key (IdEmpleado) references Camarero(IdEmpleado)
);

create table Contiene_Prod(
N_pedido number(5),
Fecha date,
IdProducto varchar2(5),
Cantidad varchar2(5),
constraint CP_PK primary key (N_pedido,Fecha,IdProducto),
constraint CP_NPF_FK foreign key (N_pedido,Fecha) references Pedido_Hace(N_Pedido,Fecha),
constraint CP_IP_FK foreign key (IdProducto) references Producto(IdProducto)
);

create table Contiene_Ped(
N_pedido number(5),
FechaP date,
IdFactura number(5),
FechaF date,
constraint CPED_PK primary key (N_pedido,FechaP),
constraint CPED_NPF_FK foreign key (N_pedido,FechaP) references Pedido_Hace(N_Pedido,Fecha),
constraint CPED_IFF_FK foreign key (IdFactura,FechaF) references Factura(IdFactura,Fecha)
);

commit;

