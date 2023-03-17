create database Emoove;
use Emoove;

create table Usuario (
cpfUsuario varchar(11) primary key,
nomeUsuario varchar(50),
emailUsuario varchar(100),
senhaUsuario varchar(15),
situacaoUsuario varchar(15),
telefoneUsuario varchar(13));

INSERT INTO Usuario VALUES 
		('52769059831','winycios@gmail.com','winycios alves','madalena','contratante','11984675735');

drop table Usuario;

create table Estabelecimento (
idEstabelecimento int auto_increment primary key,
endereçoEstabelecimento varchar(100),
cepEstabelecimento char(8),
numeroEstabelecimento varchar(5)
);

INSERT INTO Estabelecimento VALUES
		(null,'rua itaberaba açu','08451180',169);


drop table Estabelecimento;


create table compraUsuario (
idCompraUsuario int auto_increment primary key,
dataCompra date,
valorCompra decimal(10,2)
);


INSERT INTO compraUsuario VALUES
		(null,'2004-09-13',1500);
        
drop table compraUsuario;

alter table compraUsuario add column fk_cpfUsuario varchar(11),
 add foreign key (fk_cpfUsuario) references Usuario(cpfUsuario);
 
 alter table compraUsuario add column fk_Estabelecimento int,
 add foreign key (fk_Estabelecimento) references Estabelecimento(idEstabelecimento);
 
 create table Sensor (
 idSensor int auto_increment primary key,
 tipoSensor varchar(20),
 qtdSensor int);
 
INSERT INTO Sensor VALUES
		(null,'sensor_caixa',1),
        (null,'sensor_entrada',1);
 
 alter table Sensor add column fk_idCompraUsuario int,
 add foreign key (fk_idCompraUsuario) references compraUsuario(idCompraUsuario);
 
 drop table Sensor;
 
 create table SensorEntrada(
 idSensorEntrada int auto_increment primary key,
 contagemSensor int,
 dtHora datetime);
 
INSERT INTO SensorEntrada VALUES 
		(null,150,'1970-01-01 13:59:01');
 
 drop table SensorEntrada;
 
 alter table SensorEntrada add column fk_idSensor int,
 add foreign key (fk_idSensor) references Sensor(idSensor);
 
 create table SensorCaixa(
 idSensorCaixa int auto_increment primary key,
 contagemSensor int,
 dtHora datetime);
        
INSERT INTO SensorCaixa VALUES 
		(null,150,'1970-01-01 13:59:01');
 
 alter table SensorCaixa add column fk_idSensor int,
 add foreign key (fk_idSensor) references Sensor(idSensor);
 
 drop table SensorCaixa;
 
 SELECT * FROM Usuario;
 SELECT * FROM Estabelecimento;
 SELECT * FROM compraUsuario;
 SELECT * FROM Sensor;
 SELECT * FROM SensorEntrada;
 SELECT * FROM SensorCaixa;
 
 DROP DATABASE Emoove;