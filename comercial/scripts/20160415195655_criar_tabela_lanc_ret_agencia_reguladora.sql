-- // criar_tabela_lanc_ret_agencia_reguladora
-- Migration SQL that makes the change goes here.
CREATE TABLE faturamento.lanc_agencia_reguladora
(
  laar_id integer NOT NULL,
  laar_amreferencia integer NOT NULL,
  laar_tipolancamento integer NOT NULL,
  loca_id integer NOT NULL,
  stcm_id integer NOT NULL,
  laar_vlagua numeric(13,2) NOT NULL,
  laar_vlesgoto numeric(13,2) NOT NULL,
  laar_tmultimaalteracao timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT lanc_ret_agencia_reguladora_pkey PRIMARY KEY (laar_id)
);

CREATE SEQUENCE faturamento.seq_lanc_agencia_reguladora
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 10
  CACHE 1;



-- //@UNDO
-- SQL to undo the change goes here.
DROP TABLE faturamento.lanc_agencia_reguladora;
DROP SEQUENCE faturamento.seq_lanc_agencia_reguladora;