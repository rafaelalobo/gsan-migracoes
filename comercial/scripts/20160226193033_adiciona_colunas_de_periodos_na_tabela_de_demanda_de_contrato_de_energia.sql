-- // adiciona colunas de periodos na tabela de demanda de contrato de energia
-- Migration SQL that makes the change goes here.

alter table operacao.contrato_energia_demanda add column cend_periodoinicial integer;

alter table operacao.contrato_energia_demanda add column cend_periodofinal integer;

update operacao.contrato_energia_demanda
set
  cend_periodoinicial = cast(to_char(cend_dataini, 'YYYYMM' ) as int)
, cend_periodofinal   = cast(to_char(cend_datafim, 'YYYYMM' ) as int);


-- //@UNDO
-- SQL to undo the change goes here.

alter table operacao.contrato_energia_demanda drop column cend_periodoinicial;
alter table operacao.contrato_energia_demanda drop column cend_periodofinal;
