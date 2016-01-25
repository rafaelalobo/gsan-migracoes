-- // criar usuario tipo
-- Migration SQL that makes the change goes here.

insert into seguranca.usuario_tipo(utip_id,
  utip_dsusuariotipo,
  utip_icuso,
  utip_tmultimaalteracao,
  utip_icfuncionario 
)
values(1
, 'ADMINISTRADOR'
, 2
, now()
, 2
);


-- //@UNDO
-- SQL to undo the change goes here.

delete from seguranca.usuario_tipo;
