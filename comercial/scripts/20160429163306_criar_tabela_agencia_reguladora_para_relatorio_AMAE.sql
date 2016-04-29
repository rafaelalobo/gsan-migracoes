-- // criar_tabela_agencia_reguladora_para_relatorio_AMAE
-- Migration SQL that makes the change goes here.

CREATE TABLE atendimentopublico.agencia_reguladora
(
  areg_id integer NOT NULL,
  areg_nmagencia character varying(25) NOT NULL,
  areg_refinicialrepasse integer,
  areg_percrepasse smallint,
  areg_dtiniciovigencia date,
  areg_dtfimvigencia date,
  areg_tmultimaalteracao timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT agencia_reguladora_pkey PRIMARY KEY (areg_id)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE atendimentopublico.agencia_reguladora OWNER TO gsan_admin;
GRANT ALL ON TABLE atendimentopublico.agencia_reguladora TO gsan_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE atendimentopublico.agencia_reguladora TO pg_aplic;
GRANT SELECT ON TABLE atendimentopublico.agencia_reguladora TO pg_users;


CREATE SEQUENCE atendimentopublico.seq_agencia_reguladora
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 6
  CACHE 1;
ALTER TABLE atendimentopublico.seq_agencia_reguladora OWNER TO gsan_admin;
GRANT ALL ON TABLE atendimentopublico.seq_agencia_reguladora TO gsan_admin;
GRANT SELECT, UPDATE ON TABLE atendimentopublico.seq_agencia_reguladora TO pg_aplic;
GRANT SELECT ON TABLE atendimentopublico.seq_agencia_reguladora TO pg_users;


CREATE TABLE atendimentopublico.agencia_regul_municipio
(
  areg_id integer NOT NULL,
  muni_id integer NOT NULL,
  armu_tmultimaalteracao timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT agencia_regul_municipio_pkey PRIMARY KEY (areg_id)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE atendimentopublico.agencia_regul_municipio OWNER TO gsan_admin;
GRANT ALL ON TABLE atendimentopublico.agencia_regul_municipio TO gsan_admin;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE atendimentopublico.agencia_regul_municipio TO pg_aplic;
GRANT SELECT ON TABLE atendimentopublico.agencia_regul_municipio TO pg_users;

-- //@UNDO
-- SQL to undo the change goes here.

DROP SEQUENCE atendimentopublico.seq_agencia_reguladora;
DROP TABLE atendimentopublico.agencia_reguladora;
DROP TABLE atendimentopublico.agencia_regul_municipio;
