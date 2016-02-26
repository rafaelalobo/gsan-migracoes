-- // criar colunas de vigencia na tabela de contrato de energia
-- Migration SQL that makes the change goes here.

alter table operacao.contrato_energia add column cene_vigenciainicial integer;

alter table operacao.contrato_energia add column cene_vigenciafinal integer;

update operacao.contrato_energia
set
  cene_vigenciainicial = cast(to_char(cene_dataini, 'YYYYMM' ) as int)
, cene_vigenciafinal   = cast(to_char(cene_datafim, 'YYYYMM' ) as int);


-- //@UNDO
-- SQL to undo the change goes here.

alter table operacao.contrato_energia drop column cene_vigenciainicial;
alter table operacao.contrato_energia drop column cene_vigenciafinal;
