--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2016-01-22 10:34:50 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
--SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 847663)
-- Name: admindb; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA admindb;


ALTER SCHEMA admindb OWNER TO gsan_admin;

--
-- TOC entry 9 (class 2615 OID 847664)
-- Name: arrecadacao; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA arrecadacao;


ALTER SCHEMA arrecadacao OWNER TO gsan_admin;

--
-- TOC entry 11 (class 2615 OID 847665)
-- Name: atendimentopublico; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA atendimentopublico;


ALTER SCHEMA atendimentopublico OWNER TO gsan_admin;

--
-- TOC entry 13 (class 2615 OID 847666)
-- Name: cadastro; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA cadastro;


ALTER SCHEMA cadastro OWNER TO gsan_admin;

--
-- TOC entry 14 (class 2615 OID 847667)
-- Name: cobranca; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA cobranca;


ALTER SCHEMA cobranca OWNER TO gsan_admin;

--
-- TOC entry 15 (class 2615 OID 847668)
-- Name: corporativo; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA corporativo;


ALTER SCHEMA corporativo OWNER TO gsan_admin;

--
-- TOC entry 16 (class 2615 OID 847669)
-- Name: faturamento; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA faturamento;


ALTER SCHEMA faturamento OWNER TO gsan_admin;

--
-- TOC entry 17 (class 2615 OID 847670)
-- Name: financeiro; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA financeiro;


ALTER SCHEMA financeiro OWNER TO gsan_admin;

--
-- TOC entry 6 (class 2615 OID 847671)
-- Name: micromedicao; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA micromedicao;


ALTER SCHEMA micromedicao OWNER TO gsan_admin;

--
-- TOC entry 7 (class 2615 OID 847672)
-- Name: myschema; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA myschema;


ALTER SCHEMA myschema OWNER TO gsan_admin;

--
-- TOC entry 10 (class 2615 OID 847673)
-- Name: operacional; Type: SCHEMA; Schema: -; Owner: gsan_admin
--

CREATE SCHEMA operacional;


ALTER SCHEMA operacional OWNER TO gsan_admin;

--
-- TOC entry 446 (class 3079 OID 12723)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4751 (class 0 OID 0)
-- Dependencies: 446
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 847 (class 1247 OID 847676)
-- Name: bt_metap_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE bt_metap_type AS (
	magic integer,
	version integer,
	root integer,
	level integer,
	fastroot integer,
	fastlevel integer
);


ALTER TYPE bt_metap_type OWNER TO postgres;

--
-- TOC entry 850 (class 1247 OID 847679)
-- Name: bt_page_items_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE bt_page_items_type AS (
	itemoffset integer,
	ctid tid,
	itemlen integer,
	nulls boolean,
	vars boolean,
	data text
);


ALTER TYPE bt_page_items_type OWNER TO postgres;

--
-- TOC entry 853 (class 1247 OID 847682)
-- Name: bt_page_stats_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE bt_page_stats_type AS (
	blkno integer,
	type character(1),
	live_items integer,
	dead_items integer,
	avg_item_size double precision,
	page_size integer,
	free_size integer,
	btpo_prev integer,
	btpo_next integer,
	btpo integer,
	btpo_flags integer
);


ALTER TYPE bt_page_stats_type OWNER TO postgres;

--
-- TOC entry 856 (class 1247 OID 847685)
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE dblink_pkey_results AS (
	"position" integer,
	colname text
);


ALTER TYPE dblink_pkey_results OWNER TO postgres;

--
-- TOC entry 859 (class 1247 OID 847688)
-- Name: hs_each; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE hs_each AS (
	key text,
	value text
);


ALTER TYPE hs_each OWNER TO postgres;

--
-- TOC entry 862 (class 1247 OID 847689)
-- Name: lo; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN lo AS oid;


ALTER DOMAIN lo OWNER TO postgres;

--
-- TOC entry 863 (class 1247 OID 847692)
-- Name: pgstatindex_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pgstatindex_type AS (
	version integer,
	tree_level integer,
	index_size integer,
	root_block_no integer,
	internal_pages integer,
	leaf_pages integer,
	empty_pages integer,
	deleted_pages integer,
	avg_leaf_density double precision,
	leaf_fragmentation double precision
);


ALTER TYPE pgstatindex_type OWNER TO postgres;

--
-- TOC entry 866 (class 1247 OID 847695)
-- Name: pgstattuple_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pgstattuple_type AS (
	table_len bigint,
	tuple_count bigint,
	tuple_len bigint,
	tuple_percent double precision,
	dead_tuple_count bigint,
	dead_tuple_len bigint,
	dead_tuple_percent double precision,
	free_space bigint,
	free_percent double precision
);


ALTER TYPE pgstattuple_type OWNER TO postgres;

--
-- TOC entry 869 (class 1247 OID 847698)
-- Name: statinfo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE statinfo AS (
	word text,
	ndoc integer,
	nentry integer
);


ALTER TYPE statinfo OWNER TO postgres;

--
-- TOC entry 872 (class 1247 OID 847701)
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


ALTER TYPE tablefunc_crosstab_2 OWNER TO postgres;

--
-- TOC entry 875 (class 1247 OID 847704)
-- Name: tablefunc_crosstab_3; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_3 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text
);


ALTER TYPE tablefunc_crosstab_3 OWNER TO postgres;

--
-- TOC entry 878 (class 1247 OID 847707)
-- Name: tablefunc_crosstab_4; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_4 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text,
	category_4 text
);


ALTER TYPE tablefunc_crosstab_4 OWNER TO postgres;

--
-- TOC entry 881 (class 1247 OID 847710)
-- Name: tokenout; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokenout AS (
	tokid integer,
	token text
);


ALTER TYPE tokenout OWNER TO postgres;

--
-- TOC entry 884 (class 1247 OID 847713)
-- Name: tokentype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokentype AS (
	tokid integer,
	alias text,
	descr text
);


ALTER TYPE tokentype OWNER TO postgres;

SET search_path = admindb, pg_catalog;

--
-- TOC entry 459 (class 1255 OID 847714)
-- Name: registra_db_backup(integer, character varying, timestamp without time zone, timestamp without time zone, character varying, integer, text); Type: FUNCTION; Schema: admindb; Owner: postgres
--

CREATE FUNCTION registra_db_backup(icbackup integer, dsbackup character varying, tminicio timestamp without time zone, tmtermino timestamp without time zone, nntamarqbackup character varying, ictermino integer, dsobservacao text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  condicao integer;
  dtinicio timestamp without time zone;
  dtfim timestamp without time zone;
  tempo character varying(50);
BEGIN
dtinicio := tminicio;
dtfim := tmtermino;
tempo := dtfim - dtinicio;
INSERT INTO admindb.db_backup 
(dbbk_nmempresa, 
 dbbk_nmdatabase, 
 dbbk_icbackup, 
 dbbk_dsbackup, 
 dbbk_tminicio, 
 dbbk_tmtermino, 
 dbbk_hrduracao, 
 dbbk_nntamdatabase,
 dbbk_nntamarqbackup,
 dbdk_nmlogindba, 
 dbbk_ictermino,
 dbbk_dsobservacao)
VALUES
((select dbem_id from admindb.db_empresa),
 (select distinct catalog_name from information_schema.schemata),
 icbackup,
 dsbackup, 
 tminicio, 
 tmtermino, 
 tempo, 
 (select pg_size_pretty(sum(pg_total_relation_size(schemaname||'.'||tablename))::bigint) from pg_tables),
 nntamarqbackup,
 (select current_user),
 ictermino,
 dsobservacao);
condicao := 1;
RETURN condicao;
END;
$$;


ALTER FUNCTION admindb.registra_db_backup(icbackup integer, dsbackup character varying, tminicio timestamp without time zone, tmtermino timestamp without time zone, nntamarqbackup character varying, ictermino integer, dsobservacao text) OWNER TO postgres;

--
-- TOC entry 460 (class 1255 OID 847715)
-- Name: registra_db_vacuum(integer, character varying, timestamp without time zone, timestamp without time zone, integer, text); Type: FUNCTION; Schema: admindb; Owner: postgres
--

CREATE FUNCTION registra_db_vacuum(icvacuum integer, dsvacuum character varying, tminicio timestamp without time zone, tmtermino timestamp without time zone, ictermino integer, dsobservacao text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  condicao integer;
  dtinicio timestamp without time zone;
  dtfim timestamp without time zone;
  tempo character varying(50);
BEGIN
dtinicio := tminicio;
dtfim := tmtermino;
tempo := dtfim - dtinicio;
INSERT INTO admindb.db_vacuum 
(dbva_nmempresa, 
 dbva_nmdatabase, 
 dbva_icvacuum, 
 dbva_dsvacuum, 
 dbva_tminicio, 
 dbva_tmtermino, 
 dbva_hrduracao, 
 dbva_nntamdatabase,
 dbva_nmlogindba, 
 dbva_ictermino,
 dbva_dsobservacao)
VALUES
((select dbem_id from admindb.db_empresa),
 (select distinct catalog_name from information_schema.schemata),
 icvacuum,
 dsvacuum, 
 tminicio, 
 tmtermino, 
 tempo, 
 (select pg_size_pretty(sum(pg_total_relation_size(schemaname||'.'||tablename))::bigint) from pg_tables),
 (select current_user),
 ictermino,
 dsobservacao);
condicao := 1;
RETURN condicao;
END;
$$;


ALTER FUNCTION admindb.registra_db_vacuum(icvacuum integer, dsvacuum character varying, tminicio timestamp without time zone, tmtermino timestamp without time zone, ictermino integer, dsobservacao text) OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 847716)
-- Name: registra_db_versao_base(date); Type: FUNCTION; Schema: admindb; Owner: postgres
--

CREATE FUNCTION registra_db_versao_base(dtversaobase date) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  condicao integer;
BEGIN
INSERT INTO admindb.db_versao_base 
(dbvb_nmempresa,
 dbvb_nmdatabase,
 dbvb_dtversaobase,
 dbvb_nmlogindba)
VALUES
((select dbem_id from admindb.db_empresa),
 (select distinct catalog_name from information_schema.schemata),
 dtversaobase,
 (select current_user));
condicao := 1;
RETURN condicao;
END;
$$;


ALTER FUNCTION admindb.registra_db_versao_base(dtversaobase date) OWNER TO postgres;

--
-- TOC entry 462 (class 1255 OID 847717)
-- Name: registra_db_versao_sincronismo(integer, date); Type: FUNCTION; Schema: admindb; Owner: postgres
--

CREATE FUNCTION registra_db_versao_sincronismo(icsincronismo integer, dtversaosincronismo date) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  condicao integer;
BEGIN
INSERT INTO admindb.db_versao_sincronismo 

(dbvf_nmempresa,
 dbvf_nmdatabase,
 dbvf_icsincronismo,
 dbvf_dtversaosincronismo,
 dbvf_nmlogindba)
VALUES
((select dbem_id from admindb.db_empresa),
 (select distinct catalog_name from information_schema.schemata),
 icsincronismo,
 dtversaosincronismo,
 (select current_user));
condicao := 1;
RETURN condicao;
END;
$$;


ALTER FUNCTION admindb.registra_db_versao_sincronismo(icsincronismo integer, dtversaosincronismo date) OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 463 (class 1255 OID 847718)
-- Name: _get_parser_from_curcfg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _get_parser_from_curcfg() RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$ select prs_name from pg_ts_cfg where oid = show_curcfg() $$;


ALTER FUNCTION public._get_parser_from_curcfg() OWNER TO postgres;

--
-- TOC entry 464 (class 1255 OID 847719)
-- Name: dblink(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text) OWNER TO postgres;

--
-- TOC entry 465 (class 1255 OID 847720)
-- Name: dblink(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, boolean) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 847721)
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text) OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 847722)
-- Name: dblink(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 468 (class 1255 OID 847723)
-- Name: dblink_build_sql_delete(text, int2vector, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_delete(text, int2vector, integer, text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_delete';


ALTER FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) OWNER TO postgres;

--
-- TOC entry 469 (class 1255 OID 847724)
-- Name: dblink_build_sql_insert(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_insert(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_insert';


ALTER FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 847725)
-- Name: dblink_build_sql_update(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_update(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_update';


ALTER FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 847726)
-- Name: dblink_cancel_query(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_cancel_query(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_cancel_query';


ALTER FUNCTION public.dblink_cancel_query(text) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 847727)
-- Name: dblink_close(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 847728)
-- Name: dblink_close(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, boolean) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 847729)
-- Name: dblink_close(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text) OWNER TO postgres;

--
-- TOC entry 475 (class 1255 OID 847730)
-- Name: dblink_close(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 847731)
-- Name: dblink_connect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text) OWNER TO postgres;

--
-- TOC entry 477 (class 1255 OID 847732)
-- Name: dblink_connect(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text, text) OWNER TO postgres;

--
-- TOC entry 478 (class 1255 OID 847733)
-- Name: dblink_current_query(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_current_query() RETURNS text
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_current_query';


ALTER FUNCTION public.dblink_current_query() OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 847734)
-- Name: dblink_disconnect(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect() RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect() OWNER TO postgres;

--
-- TOC entry 480 (class 1255 OID 847735)
-- Name: dblink_disconnect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect(text) OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 847736)
-- Name: dblink_error_message(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_error_message(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_error_message';


ALTER FUNCTION public.dblink_error_message(text) OWNER TO postgres;

--
-- TOC entry 482 (class 1255 OID 847737)
-- Name: dblink_exec(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 847738)
-- Name: dblink_exec(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, boolean) OWNER TO postgres;

--
-- TOC entry 484 (class 1255 OID 847739)
-- Name: dblink_exec(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text) OWNER TO postgres;

--
-- TOC entry 485 (class 1255 OID 847740)
-- Name: dblink_exec(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 847741)
-- Name: dblink_fetch(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer) OWNER TO postgres;

--
-- TOC entry 487 (class 1255 OID 847742)
-- Name: dblink_fetch(text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer, boolean) OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 847743)
-- Name: dblink_fetch(text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer) OWNER TO postgres;

--
-- TOC entry 489 (class 1255 OID 847744)
-- Name: dblink_fetch(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer, boolean) OWNER TO postgres;

--
-- TOC entry 490 (class 1255 OID 847745)
-- Name: dblink_get_connections(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_connections() RETURNS text[]
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_get_connections';


ALTER FUNCTION public.dblink_get_connections() OWNER TO postgres;

--
-- TOC entry 491 (class 1255 OID 847746)
-- Name: dblink_get_pkey(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_pkey(text) RETURNS SETOF dblink_pkey_results
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_pkey';


ALTER FUNCTION public.dblink_get_pkey(text) OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 847747)
-- Name: dblink_get_result(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text) OWNER TO postgres;

--
-- TOC entry 493 (class 1255 OID 847748)
-- Name: dblink_get_result(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text, boolean) OWNER TO postgres;

--
-- TOC entry 494 (class 1255 OID 847749)
-- Name: dblink_is_busy(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_is_busy(text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_is_busy';


ALTER FUNCTION public.dblink_is_busy(text) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 847750)
-- Name: dblink_open(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text) OWNER TO postgres;

--
-- TOC entry 496 (class 1255 OID 847751)
-- Name: dblink_open(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 497 (class 1255 OID 847752)
-- Name: dblink_open(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 847753)
-- Name: dblink_open(text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text, boolean) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 847754)
-- Name: dblink_send_query(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_send_query(text, text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_send_query';


ALTER FUNCTION public.dblink_send_query(text, text) OWNER TO postgres;

--
-- TOC entry 500 (class 1255 OID 847755)
-- Name: earth(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION earth() RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '6378168'::float8$$;


ALTER FUNCTION public.earth() OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 847756)
-- Name: gc_to_sec(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gc_to_sec(double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/earth() > pi() THEN 2*earth() ELSE 2*earth()*sin($1/(2*earth())) END$_$;


ALTER FUNCTION public.gc_to_sec(double precision) OWNER TO postgres;

--
-- TOC entry 502 (class 1255 OID 847757)
-- Name: lo_oid(lo); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lo_oid(lo) RETURNS oid
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT $1::pg_catalog.oid$_$;


ALTER FUNCTION public.lo_oid(lo) OWNER TO postgres;

--
-- TOC entry 503 (class 1255 OID 847758)
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plpgsql_call_handler() RETURNS language_handler
    LANGUAGE c
    AS '$libdir/plpgsql', 'plpgsql_call_handler';


ALTER FUNCTION public.plpgsql_call_handler() OWNER TO postgres;

--
-- TOC entry 504 (class 1255 OID 847759)
-- Name: sec_to_gc(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sec_to_gc(double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/(2*earth()) > 1 THEN pi()*earth() ELSE 2*earth()*asin($1/(2*earth())) END$_$;


ALTER FUNCTION public.sec_to_gc(double precision) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 847760)
-- Name: xpath_list(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_list(text, text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT xpath_list($1,$2,',')$_$;


ALTER FUNCTION public.xpath_list(text, text) OWNER TO postgres;

--
-- TOC entry 506 (class 1255 OID 847761)
-- Name: xpath_nodeset(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT xpath_nodeset($1,$2,'','')$_$;


ALTER FUNCTION public.xpath_nodeset(text, text) OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 847762)
-- Name: xpath_nodeset(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text, text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT xpath_nodeset($1,$2,'',$3)$_$;


ALTER FUNCTION public.xpath_nodeset(text, text, text) OWNER TO postgres;

SET search_path = admindb, pg_catalog;

--
-- TOC entry 196 (class 1259 OID 847763)
-- Name: sequence_db_backup; Type: SEQUENCE; Schema: admindb; Owner: gsan_admin
--

CREATE SEQUENCE sequence_db_backup
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_db_backup OWNER TO gsan_admin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 847765)
-- Name: db_backup; Type: TABLE; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE db_backup (
    dbbk_id integer DEFAULT nextval('sequence_db_backup'::regclass) NOT NULL,
    dbbk_nmempresa character varying(10) NOT NULL,
    dbbk_nmdatabase character varying(50) NOT NULL,
    dbbk_icbackup smallint NOT NULL,
    dbbk_dsbackup character varying(50),
    dbbk_tminicio timestamp without time zone,
    dbbk_tmtermino timestamp without time zone,
    dbbk_hrduracao character varying(50),
    dbbk_nntamdatabase character varying(10),
    dbbk_nntamarqbackup character varying(10),
    dbdk_nmlogindba character varying(10) NOT NULL,
    dbbk_ictermino smallint DEFAULT 1 NOT NULL,
    dbbk_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    dbbk_dsobservacao text
);


ALTER TABLE db_backup OWNER TO gsan_admin;

--
-- TOC entry 4752 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_id; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_id IS 'Id de db_backup';


--
-- TOC entry 4753 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_nmempresa; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_nmempresa IS 'Nome da empresa';


--
-- TOC entry 4754 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_nmdatabase; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_nmdatabase IS 'Nome do banco de dados';


--
-- TOC entry 4755 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_icbackup; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_icbackup IS 'Tipo do Backup: 1 = Backup Logico (pg_dump) , 2 = Backup Fisico (tar -czvf)';


--
-- TOC entry 4756 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_dsbackup; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_dsbackup IS 'Descricao do backup';


--
-- TOC entry 4757 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_tminicio; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_tminicio IS 'Data/Hora de inicio';


--
-- TOC entry 4758 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_tmtermino; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_tmtermino IS 'Data/Hora de termino';


--
-- TOC entry 4759 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_hrduracao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_hrduracao IS 'Tempo total para realizar o backup';


--
-- TOC entry 4760 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_nntamdatabase; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_nntamdatabase IS 'Tamanho da base de dados';


--
-- TOC entry 4761 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_nntamarqbackup; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_nntamarqbackup IS 'Tamanho do arquivo backup gerado';


--
-- TOC entry 4762 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbdk_nmlogindba; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbdk_nmlogindba IS 'Nome login do DBA que executou o backup';


--
-- TOC entry 4763 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_ictermino; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_ictermino IS 'Indicador de condicao de termino: 1 = Normal, 2 = Com Anormalidade';


--
-- TOC entry 4764 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_tmultimaalteracao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_tmultimaalteracao IS 'Momento da ultima execucao';


--
-- TOC entry 4765 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN db_backup.dbbk_dsobservacao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_backup.dbbk_dsobservacao IS 'Observacao da condicao de termino/anormalidades';


--
-- TOC entry 198 (class 1259 OID 847774)
-- Name: db_empresa; Type: TABLE; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE db_empresa (
    dbem_id character varying(10) NOT NULL,
    dbem_nmempresa character varying(100) NOT NULL,
    dbem_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE db_empresa OWNER TO gsan_admin;

--
-- TOC entry 4766 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN db_empresa.dbem_id; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_empresa.dbem_id IS 'Id nome abreviado empresa';


--
-- TOC entry 4767 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN db_empresa.dbem_nmempresa; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_empresa.dbem_nmempresa IS 'Nome da empresa';


--
-- TOC entry 4768 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN db_empresa.dbem_tmultimaalteracao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_empresa.dbem_tmultimaalteracao IS 'Momento da ultima alteracao';


--
-- TOC entry 199 (class 1259 OID 847778)
-- Name: db_index; Type: TABLE; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE db_index (
    schemaname name,
    relname name,
    indexrelname name,
    idx_scan bigint,
    idx_tup_read bigint,
    idx_tup_fetch bigint,
    data_atualizacao timestamp without time zone
);


ALTER TABLE db_index OWNER TO gsan_admin;

--
-- TOC entry 200 (class 1259 OID 847781)
-- Name: db_index_jan2010; Type: TABLE; Schema: admindb; Owner: postgres; Tablespace: 
--

CREATE TABLE db_index_jan2010 (
    schemaname name,
    relname name,
    indexrelname name,
    idx_scan bigint,
    idx_tup_read bigint,
    idx_tup_fetch bigint
);


ALTER TABLE db_index_jan2010 OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 847784)
-- Name: sequence_db_vacuum; Type: SEQUENCE; Schema: admindb; Owner: gsan_admin
--

CREATE SEQUENCE sequence_db_vacuum
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_db_vacuum OWNER TO gsan_admin;

--
-- TOC entry 202 (class 1259 OID 847786)
-- Name: db_vacuum; Type: TABLE; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE db_vacuum (
    dbva_id integer DEFAULT nextval('sequence_db_vacuum'::regclass) NOT NULL,
    dbva_nmempresa character varying(10) NOT NULL,
    dbva_nmdatabase character varying(50) NOT NULL,
    dbva_icvacuum smallint NOT NULL,
    dbva_dsvacuum character varying(50),
    dbva_tminicio timestamp without time zone,
    dbva_tmtermino timestamp without time zone,
    dbva_hrduracao character varying(50),
    dbva_nntamdatabase character varying(10),
    dbva_nmlogindba character varying(10) NOT NULL,
    dbva_ictermino smallint DEFAULT 1 NOT NULL,
    dbva_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    dbva_dsobservacao text
);


ALTER TABLE db_vacuum OWNER TO gsan_admin;

--
-- TOC entry 4769 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_id; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_id IS 'Id de db_vacuum';


--
-- TOC entry 4770 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_nmempresa; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_nmempresa IS 'Nome da empresa';


--
-- TOC entry 4771 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_nmdatabase; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_nmdatabase IS 'Nome do banco de dados';


--
-- TOC entry 4772 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_icvacuum; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_icvacuum IS 'Tipo do vacuum: 1 = vacuum simples , 2 = vacuum analyze, 3 = vacuum full, 4 = vacuum full analyze, 5 = somente analyze';


--
-- TOC entry 4773 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_dsvacuum; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_dsvacuum IS 'Descricao do vacuum';


--
-- TOC entry 4774 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_tminicio; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_tminicio IS 'Data/Hora de inicio';


--
-- TOC entry 4775 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_tmtermino; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_tmtermino IS 'Data/Hora de termino';


--
-- TOC entry 4776 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_hrduracao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_hrduracao IS 'Tempo total para realizar o vacuum';


--
-- TOC entry 4777 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_nntamdatabase; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_nntamdatabase IS 'Tamanho da base de dados';


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_nmlogindba; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_nmlogindba IS 'Nome login do DBA que executou o vacuum';


--
-- TOC entry 4779 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_ictermino; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_ictermino IS 'Indicador de condicao de termino: 1 = Normal, 2 = Com Anormalidade';


--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_tmultimaalteracao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_tmultimaalteracao IS 'Momento da ultima execucao';


--
-- TOC entry 4781 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN db_vacuum.dbva_dsobservacao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_vacuum.dbva_dsobservacao IS 'Observacao da condicao de termino/anormalidades';


--
-- TOC entry 203 (class 1259 OID 847795)
-- Name: sequence_db_versao_base; Type: SEQUENCE; Schema: admindb; Owner: gsan_admin
--

CREATE SEQUENCE sequence_db_versao_base
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_db_versao_base OWNER TO gsan_admin;

--
-- TOC entry 204 (class 1259 OID 847797)
-- Name: db_versao_base; Type: TABLE; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE db_versao_base (
    dbvb_id integer DEFAULT nextval('sequence_db_versao_base'::regclass) NOT NULL,
    dbvb_nmempresa character varying(10) NOT NULL,
    dbvb_nmdatabase character varying(50) NOT NULL,
    dbvb_dtversaobase date NOT NULL,
    dbvb_nmlogindba character varying(10) NOT NULL,
    dbvb_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    dbvb_dsversaoaplicacao character varying(10)
);


ALTER TABLE db_versao_base OWNER TO gsan_admin;

--
-- TOC entry 4782 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN db_versao_base.dbvb_id; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_base.dbvb_id IS 'Id de db_versao_base';


--
-- TOC entry 4783 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN db_versao_base.dbvb_nmempresa; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_base.dbvb_nmempresa IS 'Nome da empresa';


--
-- TOC entry 4784 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN db_versao_base.dbvb_nmdatabase; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_base.dbvb_nmdatabase IS 'Nome da base de dados';


--
-- TOC entry 4785 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN db_versao_base.dbvb_dtversaobase; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_base.dbvb_dtversaobase IS 'Versao da base de dados';


--
-- TOC entry 4786 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN db_versao_base.dbvb_nmlogindba; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_base.dbvb_nmlogindba IS 'Nome login do DBA que executou o vacuum';


--
-- TOC entry 4787 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN db_versao_base.dbvb_tmultimaalteracao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_base.dbvb_tmultimaalteracao IS 'Momento da execucao do script';


--
-- TOC entry 4788 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN db_versao_base.dbvb_dsversaoaplicacao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_base.dbvb_dsversaoaplicacao IS 'Versão da aplicação batch e online compativel com a base publicada';


--
-- TOC entry 205 (class 1259 OID 847802)
-- Name: sequence_db_versao_sincronismo; Type: SEQUENCE; Schema: admindb; Owner: gsan_admin
--

CREATE SEQUENCE sequence_db_versao_sincronismo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_db_versao_sincronismo OWNER TO gsan_admin;

--
-- TOC entry 206 (class 1259 OID 847804)
-- Name: db_versao_sincronismo; Type: TABLE; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE db_versao_sincronismo (
    dbvf_id integer DEFAULT nextval('sequence_db_versao_sincronismo'::regclass) NOT NULL,
    dbvf_nmempresa character varying(10) NOT NULL,
    dbvf_nmdatabase character varying(50) NOT NULL,
    dbvf_icsincronismo integer DEFAULT 1 NOT NULL,
    dbvf_dtversaosincronismo date NOT NULL,
    dbvf_nmlogindba character varying(10) NOT NULL,
    dbvf_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    dbvf_dsversaoaplicacao character varying(10)
);


ALTER TABLE db_versao_sincronismo OWNER TO gsan_admin;

--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_id; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_id IS 'Id de db_versao_sincronismo';


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_nmempresa; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_nmempresa IS 'Nome da empresa';


--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_nmdatabase; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_nmdatabase IS 'Nome da base de dados';


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_icsincronismo; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_icsincronismo IS '1 = Sincronismo das Funcionalidades, 2 = Sincronismo Basica Gerencial';


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_dtversaosincronismo; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_dtversaosincronismo IS 'Versao do Sincronismo';


--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_nmlogindba; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_nmlogindba IS 'Nome login do DBA que executou o vacuum';


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_tmultimaalteracao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_tmultimaalteracao IS 'Momento da execucao do script';


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN db_versao_sincronismo.dbvf_dsversaoaplicacao; Type: COMMENT; Schema: admindb; Owner: gsan_admin
--

COMMENT ON COLUMN db_versao_sincronismo.dbvf_dsversaoaplicacao IS 'Versão da aplicação batch e online compativel com o sincronismo publicado.';


--
-- TOC entry 207 (class 1259 OID 847810)
-- Name: sequence_db_query_start; Type: SEQUENCE; Schema: admindb; Owner: gsan_admin
--

CREATE SEQUENCE sequence_db_query_start
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_db_query_start OWNER TO gsan_admin;

--
-- TOC entry 208 (class 1259 OID 847812)
-- Name: vw_gerencial_caema_db_backup; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caema_db_backup AS
 SELECT table1.dbbk_id,
    table1.dbbk_nmempresa,
    table1.dbbk_nmdatabase,
        CASE
            WHEN (table1.dbbk_icbackup = 1) THEN 'Backup Logico'::text
            WHEN (table1.dbbk_icbackup = 2) THEN 'Backup Fisico'::text
            ELSE 'Nao Definido'::text
        END AS tipobackup,
    table1.dbbk_dsbackup,
    table1.dbbk_tminicio,
    table1.dbbk_tmtermino,
    table1.dbbk_hrduracao,
    table1.dbbk_nntamdatabase,
    table1.dbbk_nntamarqbackup,
    table1.dbdk_nmlogindba,
        CASE
            WHEN (table1.dbbk_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbbk_tmultimaalteracao,
    table1.dbbk_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.167.148.214 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_backup'::text) table1(dbbk_id integer, dbbk_nmempresa character varying(10), dbbk_nmdatabase character varying(50), dbbk_icbackup smallint, dbbk_dsbackup character varying(50), dbbk_tminicio timestamp without time zone, dbbk_tmtermino timestamp without time zone, dbbk_hrduracao character varying(50), dbbk_nntamdatabase character varying(10), dbbk_nntamarqbackup character varying(10), dbdk_nmlogindba character varying(10), dbbk_ictermino smallint, dbbk_tmultimaalteracao timestamp without time zone, dbbk_dsobservacao text);


ALTER TABLE vw_gerencial_caema_db_backup OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 847817)
-- Name: vw_gerencial_caema_db_vacuum; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caema_db_vacuum AS
 SELECT table1.dbva_id,
    table1.dbva_nmempresa,
    table1.dbva_nmdatabase,
        CASE
            WHEN (table1.dbva_icvacuum = 1) THEN 'Vacuum Simples'::text
            WHEN (table1.dbva_icvacuum = 2) THEN 'Vacuum Analyze'::text
            WHEN (table1.dbva_icvacuum = 3) THEN 'Vacuum Full'::text
            WHEN (table1.dbva_icvacuum = 4) THEN 'Vacuum Full Analyze'::text
            WHEN (table1.dbva_icvacuum = 5) THEN 'Somente Analyze'::text
            ELSE 'Nao Definido'::text
        END AS tipovacuum,
    table1.dbva_dsvacuum,
    table1.dbva_tminicio,
    table1.dbva_tmtermino,
    table1.dbva_hrduracao,
    table1.dbva_nntamdatabase,
    table1.dbva_nmlogindba,
        CASE
            WHEN (table1.dbva_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbva_tmultimaalteracao,
    table1.dbva_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.167.148.214 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_vacuum'::text) table1(dbva_id integer, dbva_nmempresa character varying(10), dbva_nmdatabase character varying(50), dbva_icvacuum smallint, dbva_dsvacuum character varying(50), dbva_tminicio timestamp without time zone, dbva_tmtermino timestamp without time zone, dbva_hrduracao character varying(50), dbva_nntamdatabase character varying(10), dbva_nmlogindba character varying(10), dbva_ictermino smallint, dbva_tmultimaalteracao timestamp without time zone, dbva_dsobservacao text);


ALTER TABLE vw_gerencial_caema_db_vacuum OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 847822)
-- Name: vw_gerencial_caema_db_versao_base; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caema_db_versao_base AS
 SELECT table1.dbvb_id,
    table1.dbvb_nmempresa,
    table1.dbvb_nmdatabase,
    table1.dbvb_dtversaobase,
    table1.dbvb_nmlogindba,
    table1.dbvb_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.167.148.214 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_versao_base'::text) table1(dbvb_id integer, dbvb_nmempresa character varying(10), dbvb_nmdatabase character varying(50), dbvb_dtversaobase date, dbvb_nmlogindba character varying(10), dbvb_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_caema_db_versao_base OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 847826)
-- Name: vw_gerencial_caema_db_versao_sincronismo; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caema_db_versao_sincronismo AS
 SELECT table1.dbvf_id,
    table1.dbvf_nmempresa,
    table1.dbvf_nmdatabase,
        CASE
            WHEN (table1.dbvf_icsincronismo = 1) THEN 'Sincronismo das Funcionalidades'::text
            WHEN (table1.dbvf_icsincronismo = 2) THEN 'Sincronismo Basicas do Gerencial'::text
            ELSE 'Nao Definido'::text
        END AS tiposincronismo,
    table1.dbvf_dtversaosincronismo,
    table1.dbvf_nmlogindba,
    table1.dbvf_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.167.148.214 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_versao_sincronismo'::text) table1(dbvf_id integer, dbvf_nmempresa character varying(10), dbvf_nmdatabase character varying(50), dbvf_icsincronismo integer, dbvf_dtversaosincronismo date, dbvf_nmlogindba character varying(10), dbvf_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_caema_db_versao_sincronismo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 847830)
-- Name: vw_gerencial_caer_db_backup; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caer_db_backup AS
 SELECT table1.dbbk_id,
    table1.dbbk_nmempresa,
    table1.dbbk_nmdatabase,
        CASE
            WHEN (table1.dbbk_icbackup = 1) THEN 'Backup Logico'::text
            WHEN (table1.dbbk_icbackup = 2) THEN 'Backup Fisico'::text
            ELSE 'Nao Definido'::text
        END AS tipobackup,
    table1.dbbk_dsbackup,
    table1.dbbk_tminicio,
    table1.dbbk_tmtermino,
    table1.dbbk_hrduracao,
    table1.dbbk_nntamdatabase,
    table1.dbbk_nntamarqbackup,
    table1.dbdk_nmlogindba,
        CASE
            WHEN (table1.dbbk_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbbk_tmultimaalteracao,
    table1.dbbk_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=201.56.20.62 user=gsan_dba password= db@. port=12345'::text, 'select * from admindb.db_backup'::text) table1(dbbk_id integer, dbbk_nmempresa character varying(10), dbbk_nmdatabase character varying(50), dbbk_icbackup smallint, dbbk_dsbackup character varying(50), dbbk_tminicio timestamp without time zone, dbbk_tmtermino timestamp without time zone, dbbk_hrduracao character varying(50), dbbk_nntamdatabase character varying(10), dbbk_nntamarqbackup character varying(10), dbdk_nmlogindba character varying(10), dbbk_ictermino smallint, dbbk_tmultimaalteracao timestamp without time zone, dbbk_dsobservacao text);


ALTER TABLE vw_gerencial_caer_db_backup OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 847835)
-- Name: vw_gerencial_caer_db_vacuum; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caer_db_vacuum AS
 SELECT table1.dbva_id,
    table1.dbva_nmempresa,
    table1.dbva_nmdatabase,
        CASE
            WHEN (table1.dbva_icvacuum = 1) THEN 'Vacuum Simples'::text
            WHEN (table1.dbva_icvacuum = 2) THEN 'Vacuum Analyze'::text
            WHEN (table1.dbva_icvacuum = 3) THEN 'Vacuum Full'::text
            WHEN (table1.dbva_icvacuum = 4) THEN 'Vacuum Full Analyze'::text
            WHEN (table1.dbva_icvacuum = 5) THEN 'Somente Analyze'::text
            ELSE 'Nao Definido'::text
        END AS tipovacuum,
    table1.dbva_dsvacuum,
    table1.dbva_tminicio,
    table1.dbva_tmtermino,
    table1.dbva_hrduracao,
    table1.dbva_nntamdatabase,
    table1.dbva_nmlogindba,
        CASE
            WHEN (table1.dbva_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbva_tmultimaalteracao,
    table1.dbva_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=201.56.20.62 user=gsan_dba password= db@. port=12345'::text, 'select * from admindb.db_vacuum'::text) table1(dbva_id integer, dbva_nmempresa character varying(10), dbva_nmdatabase character varying(50), dbva_icvacuum smallint, dbva_dsvacuum character varying(50), dbva_tminicio timestamp without time zone, dbva_tmtermino timestamp without time zone, dbva_hrduracao character varying(50), dbva_nntamdatabase character varying(10), dbva_nmlogindba character varying(10), dbva_ictermino smallint, dbva_tmultimaalteracao timestamp without time zone, dbva_dsobservacao text);


ALTER TABLE vw_gerencial_caer_db_vacuum OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 847840)
-- Name: vw_gerencial_caer_db_versao_base; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caer_db_versao_base AS
 SELECT table1.dbvb_id,
    table1.dbvb_nmempresa,
    table1.dbvb_nmdatabase,
    table1.dbvb_dtversaobase,
    table1.dbvb_nmlogindba,
    table1.dbvb_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=201.56.20.62 user=gsan_dba password= db@. port=12345'::text, 'select * from admindb.db_versao_base'::text) table1(dbvb_id integer, dbvb_nmempresa character varying(10), dbvb_nmdatabase character varying(50), dbvb_dtversaobase date, dbvb_nmlogindba character varying(10), dbvb_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_caer_db_versao_base OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 847844)
-- Name: vw_gerencial_caer_db_versao_sincronismo; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caer_db_versao_sincronismo AS
 SELECT table1.dbvf_id,
    table1.dbvf_nmempresa,
    table1.dbvf_nmdatabase,
        CASE
            WHEN (table1.dbvf_icsincronismo = 1) THEN 'Sincronismo das Funcionalidades'::text
            WHEN (table1.dbvf_icsincronismo = 2) THEN 'Sincronismo Basicas do Gerencial'::text
            ELSE 'Nao Definido'::text
        END AS tiposincronismo,
    table1.dbvf_dtversaosincronismo,
    table1.dbvf_nmlogindba,
    table1.dbvf_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=201.56.20.62 user=gsan_dba password= db@. port=12345'::text, 'select * from admindb.db_versao_sincronismo'::text) table1(dbvf_id integer, dbvf_nmempresa character varying(10), dbvf_nmdatabase character varying(50), dbvf_icsincronismo integer, dbvf_dtversaosincronismo date, dbvf_nmlogindba character varying(10), dbvf_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_caer_db_versao_sincronismo OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 847848)
-- Name: vw_gerencial_caern_db_backup; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caern_db_backup AS
 SELECT table1.dbbk_id,
    table1.dbbk_nmempresa,
    table1.dbbk_nmdatabase,
        CASE
            WHEN (table1.dbbk_icbackup = 1) THEN 'Backup Logico'::text
            WHEN (table1.dbbk_icbackup = 2) THEN 'Backup Fisico'::text
            ELSE 'Nao Definido'::text
        END AS tipobackup,
    table1.dbbk_dsbackup,
    table1.dbbk_tminicio,
    table1.dbbk_tmtermino,
    table1.dbbk_hrduracao,
    table1.dbbk_nntamdatabase,
    table1.dbbk_nntamarqbackup,
    table1.dbdk_nmlogindba,
        CASE
            WHEN (table1.dbbk_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbbk_tmultimaalteracao,
    table1.dbbk_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.149.240.132 user=gsan_dba password= db@. port=1215'::text, 'select * from admindb.db_backup'::text) table1(dbbk_id integer, dbbk_nmempresa character varying(10), dbbk_nmdatabase character varying(50), dbbk_icbackup smallint, dbbk_dsbackup character varying(50), dbbk_tminicio timestamp without time zone, dbbk_tmtermino timestamp without time zone, dbbk_hrduracao character varying(50), dbbk_nntamdatabase character varying(10), dbbk_nntamarqbackup character varying(10), dbdk_nmlogindba character varying(10), dbbk_ictermino smallint, dbbk_tmultimaalteracao timestamp without time zone, dbbk_dsobservacao text);


ALTER TABLE vw_gerencial_caern_db_backup OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 847853)
-- Name: vw_gerencial_caern_db_vacuum; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caern_db_vacuum AS
 SELECT table1.dbva_id,
    table1.dbva_nmempresa,
    table1.dbva_nmdatabase,
        CASE
            WHEN (table1.dbva_icvacuum = 1) THEN 'Vacuum Simples'::text
            WHEN (table1.dbva_icvacuum = 2) THEN 'Vacuum Analyze'::text
            WHEN (table1.dbva_icvacuum = 3) THEN 'Vacuum Full'::text
            WHEN (table1.dbva_icvacuum = 4) THEN 'Vacuum Full Analyze'::text
            WHEN (table1.dbva_icvacuum = 5) THEN 'Somente Analyze'::text
            ELSE 'Nao Definido'::text
        END AS tipovacuum,
    table1.dbva_dsvacuum,
    table1.dbva_tminicio,
    table1.dbva_tmtermino,
    table1.dbva_hrduracao,
    table1.dbva_nntamdatabase,
    table1.dbva_nmlogindba,
        CASE
            WHEN (table1.dbva_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbva_tmultimaalteracao,
    table1.dbva_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.149.240.132 user=gsan_dba password= db@. port=1215'::text, 'select * from admindb.db_vacuum'::text) table1(dbva_id integer, dbva_nmempresa character varying(10), dbva_nmdatabase character varying(50), dbva_icvacuum smallint, dbva_dsvacuum character varying(50), dbva_tminicio timestamp without time zone, dbva_tmtermino timestamp without time zone, dbva_hrduracao character varying(50), dbva_nntamdatabase character varying(10), dbva_nmlogindba character varying(10), dbva_ictermino smallint, dbva_tmultimaalteracao timestamp without time zone, dbva_dsobservacao text);


ALTER TABLE vw_gerencial_caern_db_vacuum OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 847858)
-- Name: vw_gerencial_caern_db_versao_base; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caern_db_versao_base AS
 SELECT table1.dbvb_id,
    table1.dbvb_nmempresa,
    table1.dbvb_nmdatabase,
    table1.dbvb_dtversaobase,
    table1.dbvb_nmlogindba,
    table1.dbvb_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.149.240.132 user=gsan_dba password= db@. port=1215'::text, 'select * from admindb.db_versao_base'::text) table1(dbvb_id integer, dbvb_nmempresa character varying(10), dbvb_nmdatabase character varying(50), dbvb_dtversaobase date, dbvb_nmlogindba character varying(10), dbvb_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_caern_db_versao_base OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 847862)
-- Name: vw_gerencial_caern_db_versao_sincronismo; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_caern_db_versao_sincronismo AS
 SELECT table1.dbvf_id,
    table1.dbvf_nmempresa,
    table1.dbvf_nmdatabase,
        CASE
            WHEN (table1.dbvf_icsincronismo = 1) THEN 'Sincronismo das Funcionalidades'::text
            WHEN (table1.dbvf_icsincronismo = 2) THEN 'Sincronismo Basicas do Gerencial'::text
            ELSE 'Nao Definido'::text
        END AS tiposincronismo,
    table1.dbvf_dtversaosincronismo,
    table1.dbvf_nmlogindba,
    table1.dbvf_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=200.149.240.132 user=gsan_dba password= db@. port=1215'::text, 'select * from admindb.db_versao_sincronismo'::text) table1(dbvf_id integer, dbvf_nmempresa character varying(10), dbvf_nmdatabase character varying(50), dbvf_icsincronismo integer, dbvf_dtversaosincronismo date, dbvf_nmlogindba character varying(10), dbvf_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_caern_db_versao_sincronismo OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 847866)
-- Name: vw_gerencial_compesa_db_backup; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_compesa_db_backup AS
 SELECT table1.dbbk_id,
    table1.dbbk_nmempresa,
    table1.dbbk_nmdatabase,
        CASE
            WHEN (table1.dbbk_icbackup = 1) THEN 'Backup Logico'::text
            WHEN (table1.dbbk_icbackup = 2) THEN 'Backup Fisico'::text
            ELSE 'Nao Definido'::text
        END AS tipobackup,
    table1.dbbk_dsbackup,
    table1.dbbk_tminicio,
    table1.dbbk_tmtermino,
    table1.dbbk_hrduracao,
    table1.dbbk_nntamdatabase,
    table1.dbbk_nntamarqbackup,
    table1.dbdk_nmlogindba,
        CASE
            WHEN (table1.dbbk_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbbk_tmultimaalteracao,
    table1.dbbk_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=10.10.0.17 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_backup'::text) table1(dbbk_id integer, dbbk_nmempresa character varying(10), dbbk_nmdatabase character varying(50), dbbk_icbackup smallint, dbbk_dsbackup character varying(50), dbbk_tminicio timestamp without time zone, dbbk_tmtermino timestamp without time zone, dbbk_hrduracao character varying(50), dbbk_nntamdatabase character varying(10), dbbk_nntamarqbackup character varying(10), dbdk_nmlogindba character varying(10), dbbk_ictermino smallint, dbbk_tmultimaalteracao timestamp without time zone, dbbk_dsobservacao text);


ALTER TABLE vw_gerencial_compesa_db_backup OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 847871)
-- Name: vw_gerencial_compesa_db_vacuum; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_compesa_db_vacuum AS
 SELECT table1.dbva_id,
    table1.dbva_nmempresa,
    table1.dbva_nmdatabase,
        CASE
            WHEN (table1.dbva_icvacuum = 1) THEN 'Vacuum Simples'::text
            WHEN (table1.dbva_icvacuum = 2) THEN 'Vacuum Analyze'::text
            WHEN (table1.dbva_icvacuum = 3) THEN 'Vacuum Full'::text
            WHEN (table1.dbva_icvacuum = 4) THEN 'Vacuum Full Analyze'::text
            WHEN (table1.dbva_icvacuum = 5) THEN 'Somente Analyze'::text
            ELSE 'Nao Definido'::text
        END AS tipovacuum,
    table1.dbva_dsvacuum,
    table1.dbva_tminicio,
    table1.dbva_tmtermino,
    table1.dbva_hrduracao,
    table1.dbva_nntamdatabase,
    table1.dbva_nmlogindba,
        CASE
            WHEN (table1.dbva_ictermino = 1) THEN 'Normal'::text
            ELSE 'Com Anormalidade'::text
        END AS condicaotermino,
    table1.dbva_tmultimaalteracao,
    table1.dbva_dsobservacao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=10.10.0.17 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_vacuum'::text) table1(dbva_id integer, dbva_nmempresa character varying(10), dbva_nmdatabase character varying(50), dbva_icvacuum smallint, dbva_dsvacuum character varying(50), dbva_tminicio timestamp without time zone, dbva_tmtermino timestamp without time zone, dbva_hrduracao character varying(50), dbva_nntamdatabase character varying(10), dbva_nmlogindba character varying(10), dbva_ictermino smallint, dbva_tmultimaalteracao timestamp without time zone, dbva_dsobservacao text);


ALTER TABLE vw_gerencial_compesa_db_vacuum OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 847876)
-- Name: vw_gerencial_compesa_db_versao_base; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_compesa_db_versao_base AS
 SELECT table1.dbvb_id,
    table1.dbvb_nmempresa,
    table1.dbvb_nmdatabase,
    table1.dbvb_dtversaobase,
    table1.dbvb_nmlogindba,
    table1.dbvb_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=10.10.0.17 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_versao_base'::text) table1(dbvb_id integer, dbvb_nmempresa character varying(10), dbvb_nmdatabase character varying(50), dbvb_dtversaobase date, dbvb_nmlogindba character varying(10), dbvb_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_compesa_db_versao_base OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 847880)
-- Name: vw_gerencial_compesa_db_versao_sincronismo; Type: VIEW; Schema: admindb; Owner: postgres
--

CREATE VIEW vw_gerencial_compesa_db_versao_sincronismo AS
 SELECT table1.dbvf_id,
    table1.dbvf_nmempresa,
    table1.dbvf_nmdatabase,
        CASE
            WHEN (table1.dbvf_icsincronismo = 1) THEN 'Sincronismo das Funcionalidades'::text
            WHEN (table1.dbvf_icsincronismo = 2) THEN 'Sincronismo Basicas do Gerencial'::text
            ELSE 'Nao Definido'::text
        END AS tiposincronismo,
    table1.dbvf_dtversaosincronismo,
    table1.dbvf_nmlogindba,
    table1.dbvf_tmultimaalteracao
   FROM public.dblink('dbname=gsan_gerencial hostaddr=10.10.0.17 user=gsan_dba password= db@. port=5432'::text, 'select * from admindb.db_versao_sincronismo'::text) table1(dbvf_id integer, dbvf_nmempresa character varying(10), dbvf_nmdatabase character varying(50), dbvf_icsincronismo integer, dbvf_dtversaosincronismo date, dbvf_nmlogindba character varying(10), dbvf_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_gerencial_compesa_db_versao_sincronismo OWNER TO postgres;

SET search_path = arrecadacao, pg_catalog;

--
-- TOC entry 224 (class 1259 OID 847884)
-- Name: g_arrecadacao_forma; Type: TABLE; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_arrecadacao_forma (
    arfm_id integer NOT NULL,
    arfm_cdarrecadacaoforma character(1),
    arfm_dsarrecadacaoforma character varying(60),
    arfm_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_arrecadacao_forma OWNER TO gsan_admin;

--
-- TOC entry 225 (class 1259 OID 847888)
-- Name: g_arrecadador; Type: TABLE; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_arrecadador (
    arrc_id integer NOT NULL,
    arrc_nninscricaoestadual character varying(20),
    arrc_cdagente smallint NOT NULL,
    arrc_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    arrc_icuso smallint DEFAULT 1 NOT NULL
);


ALTER TABLE g_arrecadador OWNER TO gsan_admin;

--
-- TOC entry 226 (class 1259 OID 847893)
-- Name: g_devolucao_situacao; Type: TABLE; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_devolucao_situacao (
    dvst_id integer NOT NULL,
    dvst_dsdevolucaosituacao character varying(20),
    dvst_dsabreviado character(8),
    dvst_icuso smallint,
    dvst_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_devolucao_situacao OWNER TO gsan_admin;

--
-- TOC entry 227 (class 1259 OID 847897)
-- Name: g_epoca_pagamento; Type: TABLE; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_epoca_pagamento (
    eppa_id integer NOT NULL,
    eppa_dsepocapagemento character varying(25),
    eppa_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_epoca_pagamento OWNER TO gsan_admin;

--
-- TOC entry 228 (class 1259 OID 847901)
-- Name: g_pagamento_situacao; Type: TABLE; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_pagamento_situacao (
    pgst_id integer NOT NULL,
    pgst_dspagamentosituacao character varying(20),
    pgst_dsabreviado character(8),
    pgst_icuso smallint,
    pgst_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_pagamento_situacao OWNER TO gsan_admin;

--
-- TOC entry 229 (class 1259 OID 847909)
-- Name: seq_un_resumo_arrecadacao; Type: SEQUENCE; Schema: arrecadacao; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resumo_arrecadacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resumo_arrecadacao OWNER TO gsan_admin;

--
-- TOC entry 230 (class 1259 OID 847911)
-- Name: un_resumo_arrecadacao; Type: TABLE; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_arrecadacao (
    rear_id integer NOT NULL,
    uneg_id integer NOT NULL,
    rear_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    loca_id integer NOT NULL,
    stcm_id integer,
    loca_cdelo integer NOT NULL,
    qdra_id integer,
    rear_cdsetorcomercial integer NOT NULL,
    rear_nnquadra integer NOT NULL,
    iper_id integer,
    last_id integer,
    lest_id integer,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rear_qtcontas integer NOT NULL,
    rear_icrecebidasnomes smallint NOT NULL,
    rota_id integer,
    eppa_id integer NOT NULL,
    rear_vlagua numeric(13,2) NOT NULL,
    rear_vlesgoto numeric(13,2) NOT NULL,
    rear_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    dotp_id integer NOT NULL,
    pgst_id integer,
    rear_vlnaoidentificado numeric(13,2) DEFAULT 0 NOT NULL,
    crog_idcredito integer,
    rear_vldocsrecebidoscredito numeric(13,2),
    lict_idcredito integer,
    rear_vldocsrecebidosoutros numeric(10,2),
    fntp_idoutros integer,
    lict_idoutros integer,
    arfm_id integer,
    arrc_id integer,
    rear_vlimpostos numeric(13,2),
    rear_ichidrometro smallint NOT NULL,
    rear_amreferenciadocumento integer,
    rear_cdrota integer,
    rear_vldevolucoesclassificadas numeric(13,2),
    rear_vldevolucoesnaoclassif numeric(13,2),
    dvst_idatual integer,
    rear_qtpagamentos integer NOT NULL
);


ALTER TABLE un_resumo_arrecadacao OWNER TO gsan_admin;

--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN un_resumo_arrecadacao.rear_vldevolucoesclassificadas; Type: COMMENT; Schema: arrecadacao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_arrecadacao.rear_vldevolucoesclassificadas IS 'Valor das devolucoes classificadas';


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN un_resumo_arrecadacao.rear_vldevolucoesnaoclassif; Type: COMMENT; Schema: arrecadacao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_arrecadacao.rear_vldevolucoesnaoclassif IS 'Valor das devolucoes nao classificadas';


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN un_resumo_arrecadacao.dvst_idatual; Type: COMMENT; Schema: arrecadacao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_arrecadacao.dvst_idatual IS 'Situacao da devolucao';


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN un_resumo_arrecadacao.rear_qtpagamentos; Type: COMMENT; Schema: arrecadacao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_arrecadacao.rear_qtpagamentos IS 'Quantidade de pagamentos';


--
-- TOC entry 231 (class 1259 OID 847916)
-- Name: vw_arrecadacao_dados_diarios; Type: VIEW; Schema: arrecadacao; Owner: gsan_admin
--

CREATE VIEW vw_arrecadacao_dados_diarios AS
 SELECT table1.ardd_id,
    table1.ardd_amreferenciaarrecadacao,
    table1.arrc_id,
    table1.greg_id,
    table1.loca_id,
    table1.stcm_id,
    table1.rota_id,
    table1.qdra_id,
    table1.ardd_cdsetorcomercial,
    table1.ardd_nnquadra,
    table1.iper_id,
    table1.last_id,
    table1.lest_id,
    table1.catg_id,
    table1.epod_id,
    table1.ardd_ichidrometro,
    table1.dotp_id,
    table1.arfm_id,
    table1.ardd_dtpagamento,
    table1.ardd_qtpagamentos,
    table1.ardd_vlpagamentos,
    table1.ardd_tmultimaalteracao,
    table1.uneg_id
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 
user=gsan_olap password= ol@p port=5432'::text, 'select * from arrecadacao.arrecadacao_dados_diarios '::text) table1(ardd_id integer, ardd_amreferenciaarrecadacao integer, arrc_id integer, greg_id integer, loca_id integer, stcm_id integer, rota_id integer, qdra_id integer, ardd_cdsetorcomercial integer, ardd_nnquadra integer, iper_id integer, last_id integer, lest_id integer, catg_id integer, epod_id integer, ardd_ichidrometro smallint, dotp_id integer, arfm_id integer, ardd_dtpagamento date, ardd_qtpagamentos integer, ardd_vlpagamentos numeric(13,2), ardd_tmultimaalteracao timestamp without time zone, uneg_id integer);


ALTER TABLE vw_arrecadacao_dados_diarios OWNER TO gsan_admin;

--
-- TOC entry 232 (class 1259 OID 847921)
-- Name: vw_arrecadacao_forma; Type: VIEW; Schema: arrecadacao; Owner: gsan_admin
--

CREATE VIEW vw_arrecadacao_forma AS
 SELECT table1.arfm_id,
    table1.arfm_cdarrecadacaoforma,
    table1.arfm_dsarrecadacaoforma,
    table1.arfm_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 
user=gsan_olap password= ol@p port=5432'::text, 'select * from arrecadacao. arrecadacao_forma '::text) table1(arfm_id integer, arfm_cdarrecadacaoforma character(1), arfm_dsarrecadacaoforma character varying(60), arfm_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_arrecadacao_forma OWNER TO gsan_admin;

--
-- TOC entry 233 (class 1259 OID 847925)
-- Name: vw_arrecadador; Type: VIEW; Schema: arrecadacao; Owner: gsan_admin
--

CREATE VIEW vw_arrecadador AS
 SELECT table1.arrc_id,
    table1.arrc_nninscricaoestadual,
    table1.arrc_cdagente,
    table1.arrc_tmultimaalteracao,
    table1.arrc_icuso
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select arrc_id, arrc_nninscricaoestadual, arrc_cdagente, arrc_tmultimaalteracao ,arrc_icuso from arrecadacao.arrecadador '::text) table1(arrc_id integer, arrc_nninscricaoestadual character varying(20), arrc_cdagente smallint, arrc_tmultimaalteracao timestamp without time zone, arrc_icuso smallint);


ALTER TABLE vw_arrecadador OWNER TO gsan_admin;

--
-- TOC entry 234 (class 1259 OID 847929)
-- Name: vw_devolucao_situacao; Type: VIEW; Schema: arrecadacao; Owner: gsan_admin
--

CREATE VIEW vw_devolucao_situacao AS
 SELECT table1.dvst_id,
    table1.dvst_dsdevolucaosituacao,
    table1.dvst_dsabreviado,
    table1.dvst_icuso,
    table1.dvst_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from arrecadacao.devolucao_situacao'::text) table1(dvst_id integer, dvst_dsdevolucaosituacao character varying(20), dvst_dsabreviado character(8), dvst_icuso smallint, dvst_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_devolucao_situacao OWNER TO gsan_admin;

--
-- TOC entry 235 (class 1259 OID 847933)
-- Name: vw_pagamento_situacao; Type: VIEW; Schema: arrecadacao; Owner: gsan_admin
--

CREATE VIEW vw_pagamento_situacao AS
 SELECT table1.pgst_id,
    table1.pgst_dspagamentosituacao,
    table1.pgst_dsabreviado,
    table1.pgst_icuso,
    table1.pgst_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 
user=gsan_olap password= ol@p port=5432'::text, 'select * from arrecadacao.pagamento_situacao'::text) table1(pgst_id integer, pgst_dspagamentosituacao character varying(20), pgst_dsabreviado character(8), pgst_icuso smallint, pgst_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_pagamento_situacao OWNER TO gsan_admin;

SET search_path = financeiro, pg_catalog;

--
-- TOC entry 236 (class 1259 OID 847937)
-- Name: g_lancamento_item_contabil; Type: TABLE; Schema: financeiro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_lancamento_item_contabil (
    lict_id integer NOT NULL,
    lict_dsitemlancamentocontabil character varying(35) NOT NULL,
    lict_dsabreviado character(5) NOT NULL,
    lict_nnsequenciaimpressao smallint,
    lict_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    lcit_id integer NOT NULL,
    lict_icuso smallint NOT NULL
);


ALTER TABLE g_lancamento_item_contabil OWNER TO gsan_admin;

SET search_path = arrecadacao, pg_catalog;

--
-- TOC entry 237 (class 1259 OID 847941)
-- Name: vw_resumo_arrecadacao; Type: VIEW; Schema: arrecadacao; Owner: gsan_admin
--

CREATE VIEW vw_resumo_arrecadacao AS
 SELECT un_resumo_arrecadacao_agua_esgoto.rear_id,
    un_resumo_arrecadacao_agua_esgoto.uneg_id,
    un_resumo_arrecadacao_agua_esgoto.rear_amreferencia,
    un_resumo_arrecadacao_agua_esgoto.greg_id,
    un_resumo_arrecadacao_agua_esgoto.loca_id,
    un_resumo_arrecadacao_agua_esgoto.stcm_id,
    un_resumo_arrecadacao_agua_esgoto.loca_cdelo,
    un_resumo_arrecadacao_agua_esgoto.qdra_id,
    un_resumo_arrecadacao_agua_esgoto.rear_cdsetorcomercial,
    un_resumo_arrecadacao_agua_esgoto.rear_nnquadra,
    un_resumo_arrecadacao_agua_esgoto.iper_id,
    un_resumo_arrecadacao_agua_esgoto.last_id,
    un_resumo_arrecadacao_agua_esgoto.lest_id,
    un_resumo_arrecadacao_agua_esgoto.catg_id,
    un_resumo_arrecadacao_agua_esgoto.scat_id,
    un_resumo_arrecadacao_agua_esgoto.epod_id,
    un_resumo_arrecadacao_agua_esgoto.cltp_id,
    un_resumo_arrecadacao_agua_esgoto.lapf_id,
    un_resumo_arrecadacao_agua_esgoto.lepf_id,
    un_resumo_arrecadacao_agua_esgoto.rear_qtcontas,
    un_resumo_arrecadacao_agua_esgoto.rear_icrecebidasnomes,
    un_resumo_arrecadacao_agua_esgoto.rota_id,
    un_resumo_arrecadacao_agua_esgoto.eppa_id,
    un_resumo_arrecadacao_agua_esgoto.rear_vlagua,
    un_resumo_arrecadacao_agua_esgoto.rear_vlesgoto,
    un_resumo_arrecadacao_agua_esgoto.rear_tmultimaalteracao,
    un_resumo_arrecadacao_agua_esgoto.dotp_id,
    un_resumo_arrecadacao_agua_esgoto.pgst_id,
    un_resumo_arrecadacao_agua_esgoto.rear_vlnaoidentificado,
    un_resumo_arrecadacao_agua_esgoto.crog_idcredito,
    un_resumo_arrecadacao_agua_esgoto.rear_vldocsrecebidoscredito AS rear_vldocumentosrecebidoscredito,
    ( SELECT li.lict_dsitemlancamentocontabil
           FROM financeiro.g_lancamento_item_contabil li
          WHERE (li.lict_id = un_resumo_arrecadacao_agua_esgoto.lict_idcredito)) AS descricaocredito,
    un_resumo_arrecadacao_agua_esgoto.rear_vldocsrecebidosoutros AS rear_vldocumentosrecebidosoutros,
    un_resumo_arrecadacao_agua_esgoto.fntp_idoutros,
    ( SELECT li.lict_dsitemlancamentocontabil
           FROM financeiro.g_lancamento_item_contabil li
          WHERE (li.lict_id = un_resumo_arrecadacao_agua_esgoto.lict_idoutros)) AS descricaooutros,
    un_resumo_arrecadacao_agua_esgoto.arfm_id,
    un_resumo_arrecadacao_agua_esgoto.arrc_id
   FROM un_resumo_arrecadacao un_resumo_arrecadacao_agua_esgoto;


ALTER TABLE vw_resumo_arrecadacao OWNER TO gsan_admin;

SET search_path = atendimentopublico, pg_catalog;

--
-- TOC entry 238 (class 1259 OID 847946)
-- Name: g_atend_motivo_encmt; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_atend_motivo_encmt (
    amen_id integer NOT NULL,
    amen_dsmotivoencerramento character varying(50) NOT NULL,
    amen_dsabreviado character(8),
    amen_icuso smallint NOT NULL,
    amen_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    amen_icexecucao smallint NOT NULL,
    amen_icduplicidade smallint NOT NULL
);


ALTER TABLE g_atend_motivo_encmt OWNER TO gsan_admin;

--
-- TOC entry 239 (class 1259 OID 847954)
-- Name: g_ligacao_agua_perfil; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_ligacao_agua_perfil (
    lapf_id integer NOT NULL,
    lapf_dsligacaoaguaperfil character varying(20),
    lapf_icuso integer,
    lapf_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_ligacao_agua_perfil OWNER TO gsan_admin;

--
-- TOC entry 240 (class 1259 OID 847962)
-- Name: g_ligacao_agua_situacao; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_ligacao_agua_situacao (
    last_id integer NOT NULL,
    last_dsligacaoaguasituacao character varying(20),
    last_icuso smallint,
    last_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    last_icativaagua smallint DEFAULT 1 NOT NULL,
    last_icdesligadaagua smallint DEFAULT 1 NOT NULL,
    last_iccadastradaagua smallint DEFAULT 1 NOT NULL,
    last_icanaliseagua integer DEFAULT 2 NOT NULL
);


ALTER TABLE g_ligacao_agua_situacao OWNER TO gsan_admin;

--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN g_ligacao_agua_situacao.last_icativaagua; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_agua_situacao.last_icativaagua IS 'Indica se a situacao da ligacao de agua e de um imovel ativo';


--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN g_ligacao_agua_situacao.last_icdesligadaagua; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_agua_situacao.last_icdesligadaagua IS 'Indica se a situacao da ligacao de água e de um imovel desligado';


--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN g_ligacao_agua_situacao.last_iccadastradaagua; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_agua_situacao.last_iccadastradaagua IS 'Indica se a situacao da ligacao de água e de um imovel cadastrado';


--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN g_ligacao_agua_situacao.last_icanaliseagua; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_agua_situacao.last_icanaliseagua IS 'Indica se a situacao de ligacao de agua e do imovel em analise';


--
-- TOC entry 241 (class 1259 OID 847978)
-- Name: g_ligacao_esgoto_perfil; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_ligacao_esgoto_perfil (
    lepf_id integer NOT NULL,
    lepf_dsligacaoesgotoperfil character varying(20),
    lepf_icuso smallint,
    lepf_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    lepf_pcesgoto numeric(5,2)
);


ALTER TABLE g_ligacao_esgoto_perfil OWNER TO gsan_admin;

--
-- TOC entry 242 (class 1259 OID 847986)
-- Name: g_ligacao_esgoto_situacao; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_ligacao_esgoto_situacao (
    lest_id integer NOT NULL,
    lest_dsligacaoesgotosituacao character varying(20),
    lest_icuso smallint,
    lest_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    lest_icativaesgoto smallint DEFAULT 1 NOT NULL,
    lest_icdesligadaesgoto smallint DEFAULT 1 NOT NULL,
    lest_iccadastradaesgoto smallint DEFAULT 1 NOT NULL,
    lest_icanaliseesgoto integer DEFAULT 2 NOT NULL
);


ALTER TABLE g_ligacao_esgoto_situacao OWNER TO gsan_admin;

--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN g_ligacao_esgoto_situacao.lest_icativaesgoto; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_esgoto_situacao.lest_icativaesgoto IS 'Indica se a situacao da ligacao de esgoto e de um imovel ativo';


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN g_ligacao_esgoto_situacao.lest_icdesligadaesgoto; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_esgoto_situacao.lest_icdesligadaesgoto IS 'Indica se a situacao da ligacao de esgoto e de um imovel desligado';


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN g_ligacao_esgoto_situacao.lest_iccadastradaesgoto; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_esgoto_situacao.lest_iccadastradaesgoto IS 'Indica se a situacao da ligacao de esgoto é de um imovel cadastrado';


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN g_ligacao_esgoto_situacao.lest_icanaliseesgoto; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN g_ligacao_esgoto_situacao.lest_icanaliseesgoto IS 'Indica se a situacao de ligacao de agua e do imovel em analise';


--
-- TOC entry 243 (class 1259 OID 848002)
-- Name: g_meio_solicitacao; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_meio_solicitacao (
    meso_id integer NOT NULL,
    meso_dsmeiosolicitacao character varying(50) NOT NULL,
    meso_dsabreviado character(8),
    meso_icuso smallint NOT NULL,
    meso_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_meio_solicitacao OWNER TO gsan_admin;

--
-- TOC entry 244 (class 1259 OID 848010)
-- Name: g_solicitacao_tipo; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_solicitacao_tipo (
    sotp_id integer NOT NULL,
    sotp_dssolicitacaotipo character varying(50),
    sotp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_solicitacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 245 (class 1259 OID 848014)
-- Name: g_solicitacao_tipo_espec; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_solicitacao_tipo_espec (
    step_id integer NOT NULL,
    step_dssolcttipoespec character varying(50),
    step_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_solicitacao_tipo_espec OWNER TO gsan_admin;

--
-- TOC entry 246 (class 1259 OID 848026)
-- Name: seq_un_resumo_ra; Type: SEQUENCE; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resumo_ra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resumo_ra OWNER TO gsan_admin;

--
-- TOC entry 247 (class 1259 OID 848028)
-- Name: un_resumo_ra; Type: TABLE; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_ra (
    rera_id integer NOT NULL,
    rera_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    iper_id integer,
    rera_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    loca_cdelo integer NOT NULL,
    last_id integer,
    meso_id integer NOT NULL,
    lest_id integer,
    rera_qtrageradas integer NOT NULL,
    sotp_id integer NOT NULL,
    catg_id integer,
    scat_id integer,
    rera_cdsetorcomercial integer,
    rera_qtrapendentes_no_prazo integer NOT NULL,
    rera_nnquadra integer,
    step_id integer,
    epod_id integer,
    rota_id integer,
    cltp_id integer,
    rera_qtrabloqueadas integer NOT NULL,
    lapf_id integer,
    rera_qtraencerradas_no_prazo integer NOT NULL,
    rera_icatendimentoonline integer NOT NULL,
    lepf_id integer,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    stcm_id integer,
    qdra_id integer,
    rera_qtrapendentes_fora_prazo integer,
    rera_qtraencerradas_fora_prazo integer,
    rera_unidade_solicitacao integer,
    rera_unidade_encerramento integer,
    rera_cdrota integer,
    amen_id integer,
    rera_qtrageradames_no_prazo integer DEFAULT 0 NOT NULL,
    rera_qtrageradames_fora_prazo integer DEFAULT 0 NOT NULL
);


ALTER TABLE un_resumo_ra OWNER TO gsan_admin;

--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN un_resumo_ra.amen_id; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ra.amen_id IS 'Id do motivo de encerramento';


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN un_resumo_ra.rera_qtrageradames_no_prazo; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ra.rera_qtrageradames_no_prazo IS 'Quantidade de RA´s geradas no mes no prazo.';


--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN un_resumo_ra.rera_qtrageradames_fora_prazo; Type: COMMENT; Schema: atendimentopublico; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ra.rera_qtrageradames_fora_prazo IS 'Quantidade de RA´s geradas no mes fora do prazo.';


--
-- TOC entry 248 (class 1259 OID 848034)
-- Name: vw_atendimento_motivo_encerramento; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_atendimento_motivo_encerramento AS
 SELECT table1.amen_id,
    table1.amen_dsmotivoencerramento,
    table1.amen_dsabreviado,
    table1.amen_icuso,
    table1.amen_tmultimaalteracao,
    table1.amen_icexecucao,
    table1.amen_icduplicidade,
    table1.amen_qtdiasaditivoprazo,
    table1.amen_icexibiformordemseletiva,
    table1.amen_icfiscalizacao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.atend_motivo_encmt'::text) table1(amen_id integer, amen_dsmotivoencerramento character varying(50), amen_dsabreviado character(8), amen_icuso smallint, amen_tmultimaalteracao timestamp without time zone, amen_icexecucao smallint, amen_icduplicidade smallint, amen_qtdiasaditivoprazo integer, amen_icexibiformordemseletiva smallint, amen_icfiscalizacao smallint);


ALTER TABLE vw_atendimento_motivo_encerramento OWNER TO gsan_admin;

--
-- TOC entry 249 (class 1259 OID 848038)
-- Name: vw_ligacao_agua_perfil; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_ligacao_agua_perfil AS
 SELECT table1.lapf_id,
    table1.lapf_dsligacaoaguaperfil,
    table1.lapf_icuso,
    table1.lapf_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.ligacao_agua_perfil'::text) table1(lapf_id integer, lapf_dsligacaoaguaperfil character varying(20), lapf_icuso integer, lapf_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_ligacao_agua_perfil OWNER TO gsan_admin;

--
-- TOC entry 250 (class 1259 OID 848042)
-- Name: vw_ligacao_agua_situacao; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_ligacao_agua_situacao AS
 SELECT table1.last_id,
    table1.last_dsligacaoaguasituacao,
    table1.last_icuso,
    table1.last_tmultimaalteracao,
    table1.last_dsabreviado,
    table1.last_icfaturamento,
    table1.last_nnconsumominimo,
    table1.last_icexistenciarede,
    table1.last_icexistencialigacao,
    table1.last_icabastecimento,
    table1.last_iccadastradaagua,
    table1.last_icativaagua,
    table1.last_icdesligadaagua,
    table1.last_icanaliseagua,
    table1.last_icconsumoreal,
    table1.last_nndiascorte
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.ligacao_agua_situacao'::text) table1(last_id integer, last_dsligacaoaguasituacao character varying(20), last_icuso smallint, last_tmultimaalteracao timestamp without time zone, last_dsabreviado character(3), last_icfaturamento smallint, last_nnconsumominimo integer, last_icexistenciarede smallint, last_icexistencialigacao smallint, last_icabastecimento smallint, last_iccadastradaagua smallint, last_icativaagua smallint, last_icdesligadaagua smallint, last_icanaliseagua integer, last_icconsumoreal smallint, last_nndiascorte integer);


ALTER TABLE vw_ligacao_agua_situacao OWNER TO gsan_admin;

--
-- TOC entry 251 (class 1259 OID 848046)
-- Name: vw_ligacao_esgoto_perfil; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_ligacao_esgoto_perfil AS
 SELECT table1.lepf_id,
    table1.lepf_dsligacaoesgotoperfil,
    table1.lepf_icuso,
    table1.lepf_tmultimaalteracao,
    table1.lepf_pcesgoto,
    table1.lepf_icprincipal
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.ligacao_esgoto_perfil'::text) table1(lepf_id integer, lepf_dsligacaoesgotoperfil character varying(20), lepf_icuso smallint, lepf_tmultimaalteracao timestamp without time zone, lepf_pcesgoto numeric(5,2), lepf_icprincipal smallint);


ALTER TABLE vw_ligacao_esgoto_perfil OWNER TO gsan_admin;

--
-- TOC entry 252 (class 1259 OID 848050)
-- Name: vw_ligacao_esgoto_situacao; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_ligacao_esgoto_situacao AS
 SELECT table1.lest_id,
    table1.lest_dsligacaoesgotosituacao,
    table1.lest_icuso,
    table1.lest_tmultimaalteracao,
    table1.lest_dsabreviado,
    table1.lest_icfaturamento,
    table1.lest_nnvolumeminimo,
    table1.lest_icexistenciarede,
    table1.lest_icexistencialigacao,
    table1.lest_iccadastradaesgoto,
    table1.lest_icativaesgoto,
    table1.lest_icdesligadaesgoto,
    table1.lest_icanaliseesgoto
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from  atendimentopublico.ligacao_esgoto_situacao'::text) table1(lest_id integer, lest_dsligacaoesgotosituacao character varying(20), lest_icuso smallint, lest_tmultimaalteracao timestamp without time zone, lest_dsabreviado character(3), lest_icfaturamento smallint, lest_nnvolumeminimo integer, lest_icexistenciarede smallint, lest_icexistencialigacao smallint, lest_iccadastradaesgoto smallint, lest_icativaesgoto smallint, lest_icdesligadaesgoto smallint, lest_icanaliseesgoto integer);


ALTER TABLE vw_ligacao_esgoto_situacao OWNER TO gsan_admin;

--
-- TOC entry 253 (class 1259 OID 848054)
-- Name: vw_meio_solicitacao; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_meio_solicitacao AS
 SELECT table1.meso_id,
    table1.meso_dsmeiosolicitacao,
    table1.meso_dsabreviado,
    table1.meso_icuso,
    table1.meso_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.meio_solicitacao'::text) table1(meso_id integer, meso_dsmeiosolicitacao character varying(50), meso_dsabreviado character(8), meso_icuso smallint, meso_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_meio_solicitacao OWNER TO gsan_admin;

--
-- TOC entry 254 (class 1259 OID 848058)
-- Name: vw_solicit_tipo_especificacao; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_solicit_tipo_especificacao AS
 SELECT table1.step_id,
    table1.step_dssolicitacaotipoespecificacao,
    table1.step_nndiaprazo,
    table1.step_icpavimentocalcada,
    table1.step_icpavimentorua,
    table1.step_iccobrancamaterial,
    table1.step_icmatricula,
    table1.step_icparecerencerramento,
    table1.step_icgeracaodebito,
    table1.step_icgeracaocredito,
    table1.step_tmultimaalteracao,
    table1.sotp_id,
    table1.unid_id,
    table1.svtp_id,
    table1.step_icgeracaoordemservico,
    table1.step_iccliente,
    table1.esim_id,
    table1.step_icuso,
    table1.step_icligacaoagua,
    table1.step_icsolicitante,
    table1.step_icverificardebito,
    table1.dbtp_id,
    table1.step_vldebito,
    table1.step_icpermitealterarvalor,
    table1.step_iccobrarjuros,
    table1.step_icdocumentoobrigatorio,
    table1.step_icencerramentoautomatico,
    table1.step_idnovora,
    table1.step_icurgencia,
    table1.step_icvaldoresponsavel,
    table1.step_icinformarcontara,
    table1.step_nncodigoconstante,
    table1.step_icinformarpgtoduplicidade
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.solicitacao_tipo_especificacao'::text) table1(step_id integer, step_dssolicitacaotipoespecificacao character varying(50), step_nndiaprazo integer, step_icpavimentocalcada smallint, step_icpavimentorua smallint, step_iccobrancamaterial integer, step_icmatricula integer, step_icparecerencerramento integer, step_icgeracaodebito integer, step_icgeracaocredito integer, step_tmultimaalteracao timestamp without time zone, sotp_id integer, unid_id integer, svtp_id integer, step_icgeracaoordemservico smallint, step_iccliente smallint, esim_id integer, step_icuso smallint, step_icligacaoagua smallint, step_icsolicitante smallint, step_icverificardebito smallint, dbtp_id integer, step_vldebito numeric(13,2), step_icpermitealterarvalor smallint, step_iccobrarjuros smallint, step_icdocumentoobrigatorio smallint, step_icencerramentoautomatico smallint, step_idnovora integer, step_icurgencia integer, step_icvaldoresponsavel smallint, step_icinformarcontara integer, step_nncodigoconstante integer, step_icinformarpgtoduplicidade integer);


ALTER TABLE vw_solicit_tipo_especificacao OWNER TO gsan_admin;

--
-- TOC entry 255 (class 1259 OID 848063)
-- Name: vw_solicitacao_tipo; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_solicitacao_tipo AS
 SELECT table1.sotp_id,
    table1.sotp_dssolicitacaotipo,
    table1.sotg_id,
    table1.sotp_tmultimaalteracao,
    table1.sotp_icfaltaagua,
    table1.sotp_ictarifasocial,
    table1.sotp_icuso,
    table1.sotp_icusosistema
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.solicitacao_tipo'::text) table1(sotp_id integer, sotp_dssolicitacaotipo character varying(50), sotg_id integer, sotp_tmultimaalteracao timestamp without time zone, sotp_icfaltaagua smallint, sotp_ictarifasocial smallint, sotp_icuso smallint, sotp_icusosistema smallint);


ALTER TABLE vw_solicitacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 256 (class 1259 OID 848067)
-- Name: vw_solicitacao_tipo_espec; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_solicitacao_tipo_espec AS
 SELECT table1.step_id,
    table1.step_dssolcttipoespec,
    table1.step_nndiaprazo,
    table1.step_icpavimentocalcada,
    table1.step_icpavimentorua,
    table1.step_iccobrancamaterial,
    table1.step_icmatricula,
    table1.step_icparecerencerramento,
    table1.step_icgeracaodebito,
    table1.step_icgeracaocredito,
    table1.step_tmultimaalteracao,
    table1.sotp_id,
    table1.unid_id,
    table1.svtp_id,
    table1.step_icgeracaoordemservico,
    table1.step_iccliente,
    table1.esim_id,
    table1.step_icuso,
    table1.step_icligacaoagua,
    table1.step_icsolicitante,
    table1.step_icverificardebito,
    table1.dbtp_id,
    table1.step_vldebito,
    table1.step_icpermitealterarvalor,
    table1.step_iccobrarjuros,
    table1.step_icdocumentoobrigatorio,
    table1.step_icencerramentoautomatico,
    table1.step_idnovora,
    table1.step_icurgencia,
    table1.step_icvaldocresponsavel,
    table1.step_icinformarcontara,
    table1.step_nncodigoconstante,
    table1.step_icinformarpgtoduplicidade,
    table1.step_icalterarvencimento
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.solicitacao_tipo_espec'::text) table1(step_id integer, step_dssolcttipoespec character varying(50), step_nndiaprazo integer, step_icpavimentocalcada smallint, step_icpavimentorua smallint, step_iccobrancamaterial integer, step_icmatricula integer, step_icparecerencerramento integer, step_icgeracaodebito integer, step_icgeracaocredito integer, step_tmultimaalteracao timestamp without time zone, sotp_id integer, unid_id integer, svtp_id integer, step_icgeracaoordemservico smallint, step_iccliente smallint, esim_id integer, step_icuso smallint, step_icligacaoagua smallint, step_icsolicitante smallint, step_icverificardebito smallint, dbtp_id integer, step_vldebito numeric(13,2), step_icpermitealterarvalor smallint, step_iccobrarjuros smallint, step_icdocumentoobrigatorio smallint, step_icencerramentoautomatico smallint, step_idnovora integer, step_icurgencia integer, step_icvaldocresponsavel smallint, step_icinformarcontara integer, step_nncodigoconstante integer, step_icinformarpgtoduplicidade integer, step_icalterarvencimento integer);


ALTER TABLE vw_solicitacao_tipo_espec OWNER TO gsan_admin;

--
-- TOC entry 257 (class 1259 OID 848072)
-- Name: vw_solicitacao_tipo_especificacao; Type: VIEW; Schema: atendimentopublico; Owner: gsan_admin
--

CREATE VIEW vw_solicitacao_tipo_especificacao AS
 SELECT table1.step_id,
    table1.step_dssolicitacaotipoespecificacao,
    table1.step_nndiaprazo,
    table1.step_icpavimentocalcada,
    table1.step_icpavimentorua,
    table1.step_iccobrancamaterial,
    table1.step_icmatricula,
    table1.step_icparecerencerramento,
    table1.step_icgeracaodebito,
    table1.step_icgeracaocredito,
    table1.step_tmultimaalteracao,
    table1.sotp_id,
    table1.unid_id,
    table1.svtp_id,
    table1.step_icgeracaoordemservico,
    table1.step_iccliente,
    table1.esim_id,
    table1.step_icuso,
    table1.step_icligacaoagua,
    table1.step_icsolicitante,
    table1.step_icverificardebito,
    table1.dbtp_id,
    table1.step_vldebito,
    table1.step_icpermitealterarvalor,
    table1.step_iccobrarjuros,
    table1.step_icdocumentoobrigatorio,
    table1.step_icencerramentoautomatico,
    table1.step_idnovora,
    table1.step_icurgencia,
    table1.step_icvaldoresponsavel,
    table1.step_icinformarcontara,
    table1.step_nncodigoconstante,
    table1.step_icinformarpgtoduplicidade,
    table1.step_icalterarvencimento,
    table1.step_iclojavirtual,
    table1.step_iccanceladebitoacobrar,
    table1.step_nmarpop,
    table1.step_arpop AS bytea
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from atendimentopublico.solicitacao_tipo_espec'::text) table1(step_id integer, step_dssolicitacaotipoespecificacao character varying(50), step_nndiaprazo integer, step_icpavimentocalcada smallint, step_icpavimentorua smallint, step_iccobrancamaterial integer, step_icmatricula integer, step_icparecerencerramento integer, step_icgeracaodebito integer, step_icgeracaocredito integer, step_tmultimaalteracao timestamp without time zone, sotp_id integer, unid_id integer, svtp_id integer, step_icgeracaoordemservico smallint, step_iccliente smallint, esim_id integer, step_icuso smallint, step_icligacaoagua smallint, step_icsolicitante smallint, step_icverificardebito smallint, dbtp_id integer, step_vldebito numeric(13,2), step_icpermitealterarvalor smallint, step_iccobrarjuros smallint, step_icdocumentoobrigatorio smallint, step_icencerramentoautomatico smallint, step_idnovora integer, step_icurgencia integer, step_icvaldoresponsavel smallint, step_icinformarcontara integer, step_nncodigoconstante integer, step_icinformarpgtoduplicidade integer, step_icalterarvencimento integer, step_iclojavirtual smallint, step_iccanceladebitoacobrar smallint, step_nmarpop character varying, step_arpop bytea);


ALTER TABLE vw_solicitacao_tipo_especificacao OWNER TO gsan_admin;

SET search_path = cadastro, pg_catalog;

--
-- TOC entry 258 (class 1259 OID 848077)
-- Name: g_bairro; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_bairro (
    bair_id integer NOT NULL,
    muni_id integer NOT NULL,
    bair_cdbairro integer NOT NULL,
    bair_nmbairro character varying(30),
    bair_cdbairroprefeitura integer,
    bair_icuso smallint,
    bair_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_bairro OWNER TO gsan_admin;

--
-- TOC entry 259 (class 1259 OID 848088)
-- Name: g_categoria; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_categoria (
    catg_id integer NOT NULL,
    catg_dscategoria character varying(15) NOT NULL,
    catg_dsabreviado character(3) NOT NULL,
    catg_nnconsumominimo integer,
    catg_nnconsumoestouro integer,
    catg_nnvezesmediaestouro smallint,
    catg_nnmediabaixoconsumo integer,
    catg_pcmediabaixoconsumo numeric(5,2),
    catg_nnconsumoalto integer,
    catg_nnvezesmediaaltoconsumo smallint,
    catg_icuso smallint,
    catg_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_categoria OWNER TO gsan_admin;

--
-- TOC entry 260 (class 1259 OID 848095)
-- Name: g_cliente_relacao_tipo; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_cliente_relacao_tipo (
    crtp_id integer NOT NULL,
    crtp_dsclienterelacaotipo character varying(30),
    crtp_icuso smallint,
    crtp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_cliente_relacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 261 (class 1259 OID 848099)
-- Name: g_cliente_tipo; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_cliente_tipo (
    cltp_id integer NOT NULL,
    cltp_dsclientetipo character varying(50),
    cltp_icpessoafisicajuridica smallint,
    cltp_icuso smallint,
    cltp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    epod_id integer NOT NULL
);


ALTER TABLE g_cliente_tipo OWNER TO gsan_admin;

--
-- TOC entry 262 (class 1259 OID 848106)
-- Name: g_empresa; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_empresa (
    empr_id integer NOT NULL,
    empr_nmempresa character varying(50),
    empr_dsemail character varying(80),
    empr_icuso smallint,
    empr_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    empr_icempresaprincipal smallint NOT NULL,
    empr_nmabreviadoempresa character varying(10)
);


ALTER TABLE g_empresa OWNER TO gsan_admin;

--
-- TOC entry 263 (class 1259 OID 848114)
-- Name: g_esfera_poder; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_esfera_poder (
    epod_id integer NOT NULL,
    epod_dsesferapoder character varying(30),
    epod_icuso smallint,
    epod_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    epod_icpermitecndparaimovel smallint DEFAULT 2,
    epod_icpermitecndparacliente smallint DEFAULT 2
);


ALTER TABLE g_esfera_poder OWNER TO gsan_admin;

--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN g_esfera_poder.epod_icpermitecndparaimovel; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_esfera_poder.epod_icpermitecndparaimovel IS 'Indicador se a esfera de poder permite a geracao  de certidao negativa para imovel (1-SIM, 2-NAO)';


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN g_esfera_poder.epod_icpermitecndparacliente; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_esfera_poder.epod_icpermitecndparacliente IS 'Indicador se a esfera de poder permite a geracao  de certidao negativa para cliente (1-SIM, 2-NAO)';


--
-- TOC entry 264 (class 1259 OID 848126)
-- Name: g_gerencia_regional; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_gerencia_regional (
    greg_id integer NOT NULL,
    greg_nmregional character varying(25) NOT NULL,
    greg_nmabreviado character(3) NOT NULL,
    greg_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    supt_id integer
);


ALTER TABLE g_gerencia_regional OWNER TO gsan_admin;

--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN g_gerencia_regional.supt_id; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_gerencia_regional.supt_id IS 'Id da Superitendencia';


--
-- TOC entry 265 (class 1259 OID 848134)
-- Name: g_imovel_perfil; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_imovel_perfil (
    iper_id integer NOT NULL,
    iper_dsimovelperfil character varying(20),
    iper_icuso smallint,
    iper_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    iper_icgeracaoautomatica smallint NOT NULL,
    iper_icinserirmanterperfil smallint DEFAULT 1 NOT NULL,
    iper_icgerardadosleitura smallint DEFAULT 1 NOT NULL
);


ALTER TABLE g_imovel_perfil OWNER TO gsan_admin;

--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN g_imovel_perfil.iper_icinserirmanterperfil; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_imovel_perfil.iper_icinserirmanterperfil IS 'Indicador para saber se pode ou nao inserir/manter o perfil: 1 - Pode, 2 - Nao pode, apenas com permissao especial.';


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN g_imovel_perfil.iper_icgerardadosleitura; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_imovel_perfil.iper_icgerardadosleitura IS 'Indicador para geracao de dados do imovel para leitura';


--
-- TOC entry 266 (class 1259 OID 848146)
-- Name: g_imovel_situacao; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_imovel_situacao (
    imst_id integer NOT NULL,
    istp_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer,
    imst_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_imovel_situacao OWNER TO gsan_admin;

--
-- TOC entry 267 (class 1259 OID 848150)
-- Name: g_imovel_situacao_tipo; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_imovel_situacao_tipo (
    istp_id integer NOT NULL,
    istp_dsimovelsituacaotipo character varying(20),
    istp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_imovel_situacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 268 (class 1259 OID 848162)
-- Name: g_localidade; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_localidade (
    loca_id integer NOT NULL,
    loca_nmlocalidade character varying(30) NOT NULL,
    loca_cdelo integer NOT NULL,
    greg_id integer NOT NULL,
    lpor_id integer,
    loca_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    uneg_id integer NOT NULL,
    loca_cdcentrocusto character varying(10),
    loca_icuso smallint,
    loca_nmmunicipio character varying(40),
    muni_idprincipal integer
);


ALTER TABLE g_localidade OWNER TO gsan_admin;

--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN g_localidade.loca_icuso; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_localidade.loca_icuso IS 'Indicador de Uso (SIM = 1, NaO = 2)';


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN g_localidade.loca_nmmunicipio; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_localidade.loca_nmmunicipio IS 'Nome do Municipio';


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN g_localidade.muni_idprincipal; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_localidade.muni_idprincipal IS 'Identificador do municÃ­pio principal associado a localidade';


--
-- TOC entry 269 (class 1259 OID 848166)
-- Name: g_localidade_porte; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_localidade_porte (
    lpor_id integer NOT NULL,
    lpor_dslocalidadeporte character varying(20),
    lpor_icuso smallint,
    lpor_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_localidade_porte OWNER TO gsan_admin;

--
-- TOC entry 270 (class 1259 OID 848178)
-- Name: g_microrregiao; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_microrregiao (
    mreg_id integer NOT NULL,
    regi_id integer NOT NULL,
    mreg_nmmicrorregiao character varying(30),
    mreg_icuso smallint,
    mreg_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_microrregiao OWNER TO gsan_admin;

--
-- TOC entry 271 (class 1259 OID 848186)
-- Name: g_municipio; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_municipio (
    muni_id integer NOT NULL,
    muni_nmmunicipio character varying(30),
    muni_cdcepinicio integer,
    muni_cdcepfim integer,
    muni_cdddd smallint,
    mreg_id integer NOT NULL,
    muni_icuso smallint,
    muni_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    muni_dtconcessaoinicio date,
    muni_dtconcessaofim date
);


ALTER TABLE g_municipio OWNER TO gsan_admin;

--
-- TOC entry 272 (class 1259 OID 848193)
-- Name: g_quadra; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_quadra (
    qdra_id integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_nnquadra integer NOT NULL,
    qdra_icredeagua smallint,
    qdra_icredeesgoto smallint,
    rota_id integer NOT NULL,
    qdra_nnrotasequencia smallint,
    qdra_dtimplantacao date,
    qdra_icuso smallint,
    qdra_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    diop_id integer
);


ALTER TABLE g_quadra OWNER TO gsan_admin;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN g_quadra.diop_id; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_quadra.diop_id IS 'Id do Distrito Operacional';


--
-- TOC entry 273 (class 1259 OID 848201)
-- Name: g_regiao; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_regiao (
    regi_id integer NOT NULL,
    regi_nmregiao character varying(20),
    regi_icuso smallint,
    regi_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_regiao OWNER TO gsan_admin;

--
-- TOC entry 274 (class 1259 OID 848209)
-- Name: g_setor_comercial; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_setor_comercial (
    stcm_id integer NOT NULL,
    loca_id integer NOT NULL,
    stcm_cdsetorcomercial integer NOT NULL,
    stcm_nmsetorcomercial character varying(50) NOT NULL,
    stcm_icuso smallint,
    stcm_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    muni_id integer NOT NULL
);


ALTER TABLE g_setor_comercial OWNER TO gsan_admin;

--
-- TOC entry 275 (class 1259 OID 848216)
-- Name: g_subcategoria; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_subcategoria (
    scat_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_cdsubcategoria integer,
    scat_dssubcategoria character varying(50),
    scat_icuso smallint,
    scat_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    scat_cdgruposubcategoria integer,
    scat_icrural smallint DEFAULT 2 NOT NULL
);


ALTER TABLE g_subcategoria OWNER TO gsan_admin;

--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN g_subcategoria.scat_icrural; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_subcategoria.scat_icrural IS 'Indicador se a subcategoria é rural';


--
-- TOC entry 276 (class 1259 OID 848224)
-- Name: g_superintendencia; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_superintendencia (
    supt_id integer NOT NULL,
    supt_nmsuperint character varying(25),
    supt_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_superintendencia OWNER TO gsan_admin;

--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN g_superintendencia.supt_id; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_superintendencia.supt_id IS 'Id da tabela';


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN g_superintendencia.supt_nmsuperint; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_superintendencia.supt_nmsuperint IS 'Descricao do nome da superintendencia';


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN g_superintendencia.supt_tmultimaalteracao; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN g_superintendencia.supt_tmultimaalteracao IS 'Data e Hora da ultima Alteracao';


--
-- TOC entry 277 (class 1259 OID 848228)
-- Name: g_unidade_negocio; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_unidade_negocio (
    uneg_id integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_nmunidadenegocio character varying(50) NOT NULL,
    uneg_nmabreviado character(4) NOT NULL,
    uneg_icuso smallint NOT NULL,
    uneg_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    uneg_qtd integer
);


ALTER TABLE g_unidade_negocio OWNER TO gsan_admin;

--
-- TOC entry 278 (class 1259 OID 848236)
-- Name: g_unidade_organizacional; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_unidade_organizacional (
    unid_id integer NOT NULL,
    unid_dsunidade character varying(80) NOT NULL,
    unid_dssiglaunidade character(5),
    unid_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_unidade_organizacional OWNER TO gsan_admin;

--
-- TOC entry 279 (class 1259 OID 848244)
-- Name: indicador; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE indicador (
    indi_id integer NOT NULL,
    indi_dsindicador character(3) NOT NULL,
    indi_icuso smallint DEFAULT 1 NOT NULL,
    indi_dsindicadorhidrometro character(15) NOT NULL,
    indi_icusohidrometro smallint DEFAULT 1 NOT NULL,
    indi_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE indicador OWNER TO gsan_admin;

--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN indicador.indi_id; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN indicador.indi_id IS 'Chave primaria do Indicador';


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN indicador.indi_dsindicador; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN indicador.indi_dsindicador IS 'Descricao do indicador SIM NAO';


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN indicador.indi_icuso; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN indicador.indi_icuso IS 'Indicador de Uso do indicador ';


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN indicador.indi_dsindicadorhidrometro; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN indicador.indi_dsindicadorhidrometro IS 'Descricao do indicador de hidrometro';


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN indicador.indi_icusohidrometro; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN indicador.indi_icusohidrometro IS 'Indicador de uso do indicador de hidrometro';


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN indicador.indi_tmultimaalteracao; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN indicador.indi_tmultimaalteracao IS 'Data da ultima alteracao';


--
-- TOC entry 280 (class 1259 OID 848250)
-- Name: rg_res_lig_econ; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE rg_res_lig_econ (
    rele_id integer NOT NULL,
    rele_amreferencia integer NOT NULL,
    regi_id integer NOT NULL,
    mreg_id integer NOT NULL,
    muni_id integer NOT NULL,
    bair_id integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rele_ichidrometro smallint NOT NULL,
    rele_icvolumefixadoagua smallint NOT NULL,
    rele_icvolumefixadoesgoto smallint NOT NULL,
    rele_icpoco smallint NOT NULL,
    rele_qtligacoes integer NOT NULL,
    rele_qteconomias integer NOT NULL,
    rele_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    rele_ichidrometropoco smallint NOT NULL,
    rele_qtligacoesnovasagua integer DEFAULT 0 NOT NULL,
    rele_qtligacoesnovasesgoto integer DEFAULT 0 NOT NULL
);


ALTER TABLE rg_res_lig_econ OWNER TO gsan_admin;

--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN rg_res_lig_econ.rele_qtligacoesnovasagua; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN rg_res_lig_econ.rele_qtligacoesnovasagua IS 'Quantidade de novas ligacoes de agua cadastradas no mes';


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN rg_res_lig_econ.rele_qtligacoesnovasesgoto; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN rg_res_lig_econ.rele_qtligacoesnovasesgoto IS 'Quantidade de novas ligacoes de esgoto cadastradas no mes';


--
-- TOC entry 281 (class 1259 OID 848256)
-- Name: seq_g_cliente_relacao_tipo; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE seq_g_cliente_relacao_tipo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_g_cliente_relacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 282 (class 1259 OID 848258)
-- Name: seq_un_res_lig_econ; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_res_lig_econ
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_res_lig_econ OWNER TO gsan_admin;

--
-- TOC entry 283 (class 1259 OID 848260)
-- Name: sequence_g_superintendencia; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE sequence_g_superintendencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_g_superintendencia OWNER TO gsan_admin;

--
-- TOC entry 284 (class 1259 OID 848262)
-- Name: sequence_indicador; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE sequence_indicador
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_indicador OWNER TO gsan_admin;

--
-- TOC entry 285 (class 1259 OID 848264)
-- Name: sequence_rg_resumo_ligacao_economia; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE sequence_rg_resumo_ligacao_economia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_rg_resumo_ligacao_economia OWNER TO gsan_admin;

--
-- TOC entry 286 (class 1259 OID 848266)
-- Name: sequence_un_resumo_ligacao_economia_ref_2007; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_ligacao_economia_ref_2007
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_ligacao_economia_ref_2007 OWNER TO gsan_admin;

--
-- TOC entry 287 (class 1259 OID 848268)
-- Name: sequence_un_resumo_ligacao_economia_ref_2008; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_ligacao_economia_ref_2008
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_ligacao_economia_ref_2008 OWNER TO gsan_admin;

--
-- TOC entry 288 (class 1259 OID 848270)
-- Name: sequence_un_resumo_ligacao_economia_ref_2009; Type: SEQUENCE; Schema: cadastro; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_ligacao_economia_ref_2009
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_ligacao_economia_ref_2009 OWNER TO gsan_admin;

--
-- TOC entry 289 (class 1259 OID 848272)
-- Name: un_res_lig_econ; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_res_lig_econ (
    rele_id integer NOT NULL,
    rele_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL,
    rele_cdsetorcomercial integer NOT NULL,
    rele_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rele_ichidrometro smallint NOT NULL,
    rele_icvolumefixadoagua smallint NOT NULL,
    rele_icvolumefixadoesgoto smallint NOT NULL,
    rele_icpoco smallint NOT NULL,
    rele_qtligacoes integer NOT NULL,
    rele_qteconomias integer NOT NULL,
    rele_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    rele_ichidrometropoco smallint NOT NULL,
    cstf_id integer DEFAULT 0,
    rele_cdrota integer,
    rele_qtligacoesnovasagua integer DEFAULT 0 NOT NULL,
    rele_qtligacoesnovasesgoto integer DEFAULT 0 NOT NULL,
    rele_qtligacoescortesmes integer,
    rele_qtligacoesreligadasmes integer
);


ALTER TABLE un_res_lig_econ OWNER TO gsan_admin;

--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN un_res_lig_econ.rele_qtligacoesnovasagua; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_lig_econ.rele_qtligacoesnovasagua IS 'Quantidade de novas ligacoes de agua cadastradas no mes';


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN un_res_lig_econ.rele_qtligacoesnovasesgoto; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_lig_econ.rele_qtligacoesnovasesgoto IS 'Quantidade de novas ligacoes de esgoto cadastradas no mes';


--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN un_res_lig_econ.rele_qtligacoescortesmes; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_lig_econ.rele_qtligacoescortesmes IS 'Quantidade de ligacoes de agua cortadas no mes';


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN un_res_lig_econ.rele_qtligacoesreligadasmes; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_lig_econ.rele_qtligacoesreligadasmes IS 'Quantidade de ligacoes de agua religadas no mes';


--
-- TOC entry 290 (class 1259 OID 848279)
-- Name: un_resi_lig_eco; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resi_lig_eco (
    rele_id integer NOT NULL,
    rele_idma integer,
    rele_amreferencia integer,
    rele_anoreferencia text,
    rele_mesreferencia text,
    greg_id integer,
    uneg_id integer,
    loca_id integer,
    loca_cdelo integer,
    stcm_id integer,
    qdra_id integer,
    rota_id integer,
    rele_cdsetorcomercial integer,
    rele_nnquadra integer,
    iper_id integer,
    last_id integer,
    lest_id integer,
    catg_id integer,
    scat_id integer,
    epod_id integer,
    cltp_id integer,
    lapf_id integer,
    lepf_id integer,
    cstf_id integer,
    rele_ichidrometro smallint,
    rele_icvolumefixadoagua smallint,
    rele_icvolumefixadoesgoto smallint,
    rele_icpoco smallint,
    rele_ichidrometropoco smallint,
    rele_qtligacoesativasagua integer,
    rele_qtligacoesativasaguama integer,
    rele_qtligacoesativasesgoto integer,
    rele_qtligacoesativasesgotoma integer,
    rele_qteconomiastotaisagua integer,
    rele_qteconomiastotaisaguama integer,
    rele_qteconomiastotaisesgoto integer,
    rele_qteconomiastotaisesgotoma integer,
    rele_qtcliaguapotenciaisfact integer,
    rele_qtcliagualigadoscortados integer,
    rele_qtclientesaguasuprimidos integer,
    rele_qteconaguapotenciaisfact integer,
    rele_qteconomiasagualigadoscortados integer,
    rele_qteconomiasaguasuprimidos integer,
    rele_qtcliesgotopotenciaisfact integer,
    rele_qtclientesesgotoligados integer,
    rele_qtcliesgotoligadosforauso integer,
    rele_qteconesgpotenciaisfact integer,
    rele_qteconomiasesgotoligados integer,
    rele_qteconesgligadosforauso integer,
    rele_tmultimaalteracao timestamp without time zone
);


ALTER TABLE un_resi_lig_eco OWNER TO gsan_admin;

--
-- TOC entry 291 (class 1259 OID 848285)
-- Name: un_resumo_ligacao_economia_ref_2007; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_ligacao_economia_ref_2007 (
    rele_id integer NOT NULL,
    rele_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    rele_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rele_ichidrometro smallint NOT NULL,
    rele_icvolumefixadoagua smallint NOT NULL,
    rele_icvolumefixadoesgoto smallint NOT NULL,
    rele_icpoco smallint NOT NULL,
    rele_qtligacoes integer NOT NULL,
    rele_qteconomias integer NOT NULL,
    rele_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    rele_ichidrometropoco smallint NOT NULL,
    cstf_id integer NOT NULL,
    rele_qtligacoesnovasagua integer DEFAULT 0 NOT NULL,
    rele_qtligacoesnovasesgoto integer DEFAULT 0 NOT NULL
);


ALTER TABLE un_resumo_ligacao_economia_ref_2007 OWNER TO gsan_admin;

--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN un_resumo_ligacao_economia_ref_2007.rele_qtligacoesnovasagua; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia_ref_2007.rele_qtligacoesnovasagua IS 'Quantidade de novas ligacoes de agua cadastradas no mes';


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN un_resumo_ligacao_economia_ref_2007.rele_qtligacoesnovasesgoto; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia_ref_2007.rele_qtligacoesnovasesgoto IS 'Quantidade de novas ligacoes de esgoto cadastradas no mes';


--
-- TOC entry 292 (class 1259 OID 848291)
-- Name: un_resumo_ligacao_economia_ref_2008; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_ligacao_economia_ref_2008 (
    rele_id integer NOT NULL,
    rele_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    rele_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rele_ichidrometro smallint NOT NULL,
    rele_icvolumefixadoagua smallint NOT NULL,
    rele_icvolumefixadoesgoto smallint NOT NULL,
    rele_icpoco smallint NOT NULL,
    rele_qtligacoes integer NOT NULL,
    rele_qteconomias integer NOT NULL,
    rele_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    rele_ichidrometropoco smallint NOT NULL,
    cstf_id integer NOT NULL,
    rele_qtligacoesnovasagua integer DEFAULT 0 NOT NULL,
    rele_qtligacoesnovasesgoto integer DEFAULT 0 NOT NULL
);


ALTER TABLE un_resumo_ligacao_economia_ref_2008 OWNER TO gsan_admin;

--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN un_resumo_ligacao_economia_ref_2008.rele_qtligacoesnovasagua; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia_ref_2008.rele_qtligacoesnovasagua IS 'Quantidade de novas ligacoes de agua cadastradas no mes';


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN un_resumo_ligacao_economia_ref_2008.rele_qtligacoesnovasesgoto; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia_ref_2008.rele_qtligacoesnovasesgoto IS 'Quantidade de novas ligacoes de esgoto cadastradas no mes';


--
-- TOC entry 293 (class 1259 OID 848297)
-- Name: un_resumo_ligacao_economia_ref_2009; Type: TABLE; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_ligacao_economia_ref_2009 (
    rele_id integer NOT NULL,
    rele_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    rele_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rele_ichidrometro smallint NOT NULL,
    rele_icvolumefixadoagua smallint NOT NULL,
    rele_icvolumefixadoesgoto smallint NOT NULL,
    rele_icpoco smallint NOT NULL,
    rele_qtligacoes integer NOT NULL,
    rele_qteconomias integer NOT NULL,
    rele_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    rele_ichidrometropoco smallint NOT NULL,
    cstf_id integer NOT NULL,
    rele_qtligacoesnovasagua integer DEFAULT 0 NOT NULL,
    rele_qtligacoesnovasesgoto integer DEFAULT 0 NOT NULL
);


ALTER TABLE un_resumo_ligacao_economia_ref_2009 OWNER TO gsan_admin;

--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN un_resumo_ligacao_economia_ref_2009.rele_qtligacoesnovasagua; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia_ref_2009.rele_qtligacoesnovasagua IS 'Quantidade de novas ligacoes de agua cadastradas no mes';


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN un_resumo_ligacao_economia_ref_2009.rele_qtligacoesnovasesgoto; Type: COMMENT; Schema: cadastro; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia_ref_2009.rele_qtligacoesnovasesgoto IS 'Quantidade de novas ligacoes de esgoto cadastradas no mes';


--
-- TOC entry 294 (class 1259 OID 848303)
-- Name: vw_bairro; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_bairro AS
 SELECT table1.bair_id,
    table1.muni_id,
    table1.bair_cdbairro,
    table1.bair_nmbairro,
    table1.bair_cdbairroprefeitura,
    table1.bair_icuso,
    table1.bair_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.bairro'::text) table1(bair_id integer, muni_id integer, bair_cdbairro integer, bair_nmbairro character varying(30), bair_cdbairroprefeitura integer, bair_icuso smallint, bair_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_bairro OWNER TO gsan_admin;

--
-- TOC entry 295 (class 1259 OID 848307)
-- Name: vw_categoria; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_categoria AS
 SELECT table1.catg_id,
    table1.catg_dscategoria,
    table1.catg_dsabreviado,
    table1.catg_nnconsumominimo,
    table1.catg_nnconsumoestouro,
    table1.catg_nnvezesmediaestouro,
    table1.catg_nnmediabaixoconsumo,
    table1.catg_pcmediabaixoconsumo,
    table1.catg_nnconsumoalto,
    table1.catg_nnvezesmediaaltoconsumo,
    table1.catg_icuso,
    table1.catg_tmultimaalteracao,
    table1.cgtp_id,
    table1.catg_nnconsumomaximoec,
    table1.catg_iccobrancaacrescimos,
    table1.catg_nnmaxeconomiasvalidacao,
    table1.catg_nnfatoreconomias,
    table1.catg_icpermissaoespecial,
    table1.catg_nnconsumolimite,
    table1.catg_nnfatorconsumolimite,
    table1.catg_qtdiasprimeirofaturamento
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.categoria'::text) table1(catg_id integer, catg_dscategoria character varying(15), catg_dsabreviado character(3), catg_nnconsumominimo integer, catg_nnconsumoestouro integer, catg_nnvezesmediaestouro numeric(3,1), catg_nnmediabaixoconsumo integer, catg_pcmediabaixoconsumo numeric(5,2), catg_nnconsumoalto integer, catg_nnvezesmediaaltoconsumo numeric(3,1), catg_icuso smallint, catg_tmultimaalteracao timestamp without time zone, cgtp_id integer, catg_nnconsumomaximoec integer, catg_iccobrancaacrescimos smallint, catg_nnmaxeconomiasvalidacao integer, catg_nnfatoreconomias smallint, catg_icpermissaoespecial smallint, catg_nnconsumolimite integer, catg_nnfatorconsumolimite numeric(3,1), catg_qtdiasprimeirofaturamento integer);


ALTER TABLE vw_categoria OWNER TO gsan_admin;

--
-- TOC entry 296 (class 1259 OID 848312)
-- Name: vw_cliente_relacao_tipo; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_cliente_relacao_tipo AS
 SELECT table1.crtp_id,
    table1.crtp_dsclienterelacaotipo,
    table1.crtp_icuso,
    table1.crtp_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.cliente_relacao_tipo'::text) table1(crtp_id integer, crtp_dsclienterelacaotipo character varying(30), crtp_icuso smallint, crtp_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_cliente_relacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 297 (class 1259 OID 848316)
-- Name: vw_cliente_tipo; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_cliente_tipo AS
 SELECT table1.cltp_id,
    table1.cltp_dsclientetipo,
    table1.cltp_icpessoafisicajuridica,
    table1.cltp_icuso,
    table1.cltp_tmultimaalteracao,
    table1.epod_id
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.cliente_tipo'::text) table1(cltp_id integer, cltp_dsclientetipo character varying(50), cltp_icpessoafisicajuridica smallint, cltp_icuso smallint, cltp_tmultimaalteracao timestamp without time zone, epod_id integer);


ALTER TABLE vw_cliente_tipo OWNER TO gsan_admin;

--
-- TOC entry 298 (class 1259 OID 848320)
-- Name: vw_empresa; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_empresa AS
 SELECT table1.empr_id,
    table1.empr_nmempresa,
    table1.empr_dsemail,
    table1.empr_icuso,
    table1.empr_tmultimaalteracao,
    table1.empr_icempresaprincipal,
    table1.empr_nmabreviadoempresa,
    table1.empr_iccobranca,
    table1.empr_icleitura,
    table1.empr_dtenccontrcob,
    table1.empr_nnmesesvalidopagto,
    table1.empr_icvalidarpagamento
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.empresa'::text) table1(empr_id integer, empr_nmempresa character varying(50), empr_dsemail character varying(80), empr_icuso smallint, empr_tmultimaalteracao timestamp without time zone, empr_icempresaprincipal smallint, empr_nmabreviadoempresa character varying(10), empr_iccobranca smallint, empr_icleitura smallint, empr_dtenccontrcob date, empr_nnmesesvalidopagto integer, empr_icvalidarpagamento smallint);


ALTER TABLE vw_empresa OWNER TO gsan_admin;

--
-- TOC entry 299 (class 1259 OID 848324)
-- Name: vw_esfera_poder; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_esfera_poder AS
 SELECT table1.epod_id,
    table1.epod_dsesferapoder,
    table1.epod_icuso,
    table1.epod_tmultimaalteracao,
    table1.epod_icpermitecndparaimovel,
    table1.epod_icpermitecndparacliente
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.esfera_poder'::text) table1(epod_id integer, epod_dsesferapoder character varying(30), epod_icuso smallint, epod_tmultimaalteracao timestamp without time zone, epod_icpermitecndparaimovel smallint, epod_icpermitecndparacliente smallint);


ALTER TABLE vw_esfera_poder OWNER TO gsan_admin;

--
-- TOC entry 300 (class 1259 OID 848328)
-- Name: vw_g_setor_comercial; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_g_setor_comercial AS
 SELECT g_setor_comercial.stcm_id,
    g_setor_comercial.loca_id,
    g_setor_comercial.stcm_cdsetorcomercial,
    ((((g_setor_comercial.loca_id)::text || '-'::text) || (g_setor_comercial.stcm_cdsetorcomercial)::text) || (g_setor_comercial.stcm_nmsetorcomercial)::text) AS stcm_nmsetorcomercial,
    g_setor_comercial.stcm_icuso,
    g_setor_comercial.stcm_tmultimaalteracao
   FROM g_setor_comercial;


ALTER TABLE vw_g_setor_comercial OWNER TO gsan_admin;

--
-- TOC entry 301 (class 1259 OID 848332)
-- Name: vw_gerencia_regional; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_gerencia_regional AS
 SELECT table1.greg_id,
    table1.greg_nmregional,
    table1.greg_nmabreviado,
    table1.logr_id,
    table1.greg_nnimovel,
    table1.greg_dscomplementoendereco,
    table1.edrf_id,
    table1.bair_id,
    table1.cep_id,
    table1.greg_nnfone,
    table1.greg_nnfoneramal,
    table1.greg_nnfax,
    table1.greg_dsemail,
    table1.greg_icuso,
    table1.greg_tmultimaalteracao,
    table1.lgbr_id,
    table1.lgcp_id,
    table1.clie_id,
    table1.greg_nncnpj,
    table1.supt_id
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.gerencia_regional'::text) table1(greg_id integer, greg_nmregional character varying(25), greg_nmabreviado character(3), logr_id integer, greg_nnimovel character(5), greg_dscomplementoendereco character varying(25), edrf_id integer, bair_id integer, cep_id integer, greg_nnfone character varying(9), greg_nnfoneramal character varying(4), greg_nnfax character varying(9), greg_dsemail character varying(40), greg_icuso smallint, greg_tmultimaalteracao timestamp without time zone, lgbr_id integer, lgcp_id integer, clie_id integer, greg_nncnpj character varying(14), supt_id integer);


ALTER TABLE vw_gerencia_regional OWNER TO gsan_admin;

--
-- TOC entry 444 (class 1259 OID 873670)
-- Name: vw_imovel_perfil; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_imovel_perfil AS
 SELECT table1.iper_id,
    table1.iper_dsimovelperfil,
    table1.iper_icuso,
    table1.iper_tmultimaalteracao,
    table1.iper_icgeracaoautomatica,
    table1.iper_icinserirmanterperfil,
    table1.iper_icgerardadosleitura,
    table1.iper_icbloquearetificacao,
    table1.scat_id,
    table1.iper_icgrandeconsumidor,
    table1.iper_icbloqueadadossocial,
    table1.iper_icgerardeb2aviaconta,
    table1.iper_iccorporativo
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.imovel_perfil'::text) table1(iper_id integer, iper_dsimovelperfil character varying(20), iper_icuso smallint, iper_tmultimaalteracao timestamp without time zone, iper_icgeracaoautomatica smallint, iper_icinserirmanterperfil smallint, iper_icgerardadosleitura smallint, iper_icbloquearetificacao smallint, scat_id integer, iper_icgrandeconsumidor smallint, iper_icbloqueadadossocial smallint, iper_icgerardeb2aviaconta integer, iper_iccorporativo smallint);


ALTER TABLE vw_imovel_perfil OWNER TO gsan_admin;

--
-- TOC entry 302 (class 1259 OID 848341)
-- Name: vw_imovel_situacao; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_imovel_situacao AS
 SELECT table1.imst_id,
    table1.istp_id,
    table1.last_id,
    table1.lest_id,
    table1.imst_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 
user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.imovel_situacao '::text) table1(imst_id integer, istp_id integer, last_id integer, lest_id integer, imst_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_imovel_situacao OWNER TO gsan_admin;

--
-- TOC entry 303 (class 1259 OID 848345)
-- Name: vw_imovel_situacao_tipo; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_imovel_situacao_tipo AS
 SELECT table1.istp_id,
    table1.istp_dsimovelsituacaotipo,
    table1.istp_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 
user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.imovel_situacao_tipo '::text) table1(istp_id integer, istp_dsimovelsituacaotipo character varying(20), istp_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_imovel_situacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 304 (class 1259 OID 848349)
-- Name: vw_localidade; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_localidade AS
 SELECT table1.loca_id,
    table1.loca_nmlocalidade,
    table1.logr_id,
    table1.loca_nnimovel,
    table1.loca_dscomplementoendereco,
    table1.edrf_id,
    table1.cep_id,
    table1.loca_nnfone,
    table1.loca_nnfoneramal,
    table1.loca_nnfax,
    table1.loca_dsemail,
    table1.loca_nnconsumograndeusuario,
    table1.loca_cdelo,
    table1.greg_id,
    table1.lcla_id,
    table1.lpor_id,
    table1.loca_icuso,
    table1.bair_id,
    table1.loca_tmultimaalteracao,
    table1.lgbr_id,
    table1.lgcp_id,
    table1.loca_cdicms,
    table1.loca_cdcentrocusto,
    table1.uneg_id,
    table1.loca_icinformatizada,
    table1.clie_id,
    table1.hila_id,
    table1.loca_icbloqueio,
    table1.loca_icsede,
    table1.loca_cdcentrocustoesgoto,
    table1.muni_idprincipal
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.localidade'::text) table1(loca_id integer, loca_nmlocalidade character varying(30), logr_id integer, loca_nnimovel character(5), loca_dscomplementoendereco character varying(25), edrf_id integer, cep_id integer, loca_nnfone character varying(9), loca_nnfoneramal character varying(4), loca_nnfax character varying(9), loca_dsemail character varying(40), loca_nnconsumograndeusuario integer, loca_cdelo integer, greg_id integer, lcla_id integer, lpor_id integer, loca_icuso smallint, bair_id integer, loca_tmultimaalteracao timestamp without time zone, lgbr_id integer, lgcp_id integer, loca_cdicms character(10), loca_cdcentrocusto character varying(10), uneg_id integer, loca_icinformatizada smallint, clie_id integer, hila_id integer, loca_icbloqueio smallint, loca_icsede smallint, loca_cdcentrocustoesgoto character varying(10), muni_idprincipal integer);


ALTER TABLE vw_localidade OWNER TO gsan_admin;

--
-- TOC entry 305 (class 1259 OID 848354)
-- Name: vw_localidade_elo; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_localidade_elo AS
 SELECT a.loca_id,
    ( SELECT b.loca_nmlocalidade
           FROM g_localidade b
          WHERE (b.loca_id = a.loca_cdelo)) AS localidade
   FROM g_localidade a
  ORDER BY a.loca_id;


ALTER TABLE vw_localidade_elo OWNER TO gsan_admin;

--
-- TOC entry 306 (class 1259 OID 848358)
-- Name: vw_localidade_porte; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_localidade_porte AS
 SELECT table1.lpor_id,
    table1.lpor_dslocalidadeporte,
    table1.lpor_icuso,
    table1.lpor_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.localidade_porte'::text) table1(lpor_id integer, lpor_dslocalidadeporte character varying(20), lpor_icuso smallint, lpor_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_localidade_porte OWNER TO gsan_admin;

--
-- TOC entry 307 (class 1259 OID 848362)
-- Name: vw_microrregiao; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_microrregiao AS
 SELECT table1.mreg_id,
    table1.regi_id,
    table1.mreg_nmmicrorregiao,
    table1.mreg_icuso,
    table1.mreg_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.microrregiao'::text) table1(mreg_id integer, regi_id integer, mreg_nmmicrorregiao character varying(30), mreg_icuso smallint, mreg_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_microrregiao OWNER TO gsan_admin;

--
-- TOC entry 308 (class 1259 OID 848366)
-- Name: vw_municipio; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_municipio AS
 SELECT table1.muni_id,
    table1.muni_nmmunicipio,
    table1.muni_cdcepinicio,
    table1.muni_cdcepfim,
    table1.muni_cdddd,
    table1.rdes_id,
    table1.mreg_id,
    table1.unfe_id,
    table1.muni_icuso,
    table1.muni_tmultimaalteracao,
    table1.muni_dtconcessaoinicio,
    table1.muni_dtconcessaofim,
    table1.muni_cdibge,
    table1.muni_icrelacionquadrabairro
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.municipio'::text) table1(muni_id integer, muni_nmmunicipio character varying(30), muni_cdcepinicio integer, muni_cdcepfim integer, muni_cdddd smallint, rdes_id integer, mreg_id integer, unfe_id integer, muni_icuso smallint, muni_tmultimaalteracao timestamp without time zone, muni_dtconcessaoinicio date, muni_dtconcessaofim date, muni_cdibge character varying(10), muni_icrelacionquadrabairro integer);


ALTER TABLE vw_municipio OWNER TO gsan_admin;

--
-- TOC entry 309 (class 1259 OID 848370)
-- Name: vw_quadra; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_quadra AS
 SELECT table1.qdra_id,
    table1.stcm_id,
    table1.qdra_nnquadra,
    table1.qdpf_id,
    table1.qdra_icredeagua,
    table1.qdra_icredeesgoto,
    table1.bair_id,
    table1.baci_id,
    table1.diop_id,
    table1.istc_id,
    table1.zeis_id,
    table1.rota_id,
    table1.qdra_nnrotasequencia,
    table1.qdra_dtimplantacao,
    table1.qdra_icuso,
    table1.qdra_tmultimaalteracao,
    table1.arti_id,
    table1.roem_id,
    table1.qdra_icautoincrementolote,
    table1.qdra_icbloqueio
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.quadra'::text) table1(qdra_id integer, stcm_id integer, qdra_nnquadra integer, qdpf_id integer, qdra_icredeagua smallint, qdra_icredeesgoto smallint, bair_id integer, baci_id integer, diop_id integer, istc_id integer, zeis_id integer, rota_id integer, qdra_nnrotasequencia smallint, qdra_dtimplantacao date, qdra_icuso smallint, qdra_tmultimaalteracao timestamp without time zone, arti_id integer, roem_id integer, qdra_icautoincrementolote smallint, qdra_icbloqueio smallint);


ALTER TABLE vw_quadra OWNER TO gsan_admin;

--
-- TOC entry 310 (class 1259 OID 848375)
-- Name: vw_regiao; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_regiao AS
 SELECT table1.regi_id,
    table1.regi_nmregiao,
    table1.regi_icuso,
    table1.regi_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.regiao'::text) table1(regi_id integer, regi_nmregiao character varying(20), regi_icuso smallint, regi_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_regiao OWNER TO gsan_admin;

--
-- TOC entry 311 (class 1259 OID 848379)
-- Name: vw_setor_comercial; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_setor_comercial AS
 SELECT table1.stcm_id,
    table1.loca_id,
    table1.stcm_cdsetorcomercial,
    table1.stcm_nmsetorcomercial,
    table1.stcm_icuso,
    table1.muni_id,
    table1.stcm_tmultimaalteracao,
    table1.stcm_icalternativo,
    table1.stcm_icbloqueio
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.setor_comercial'::text) table1(stcm_id integer, loca_id integer, stcm_cdsetorcomercial integer, stcm_nmsetorcomercial character varying(30), stcm_icuso smallint, muni_id integer, stcm_tmultimaalteracao timestamp without time zone, stcm_icalternativo smallint, stcm_icbloqueio smallint);


ALTER TABLE vw_setor_comercial OWNER TO gsan_admin;

--
-- TOC entry 312 (class 1259 OID 848383)
-- Name: vw_subcategoria; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_subcategoria AS
 SELECT table1.scat_id,
    table1.catg_id,
    table1.scat_cdsubcategoria,
    table1.scat_dssubcategoria,
    table1.scat_icuso,
    table1.scat_tmultimaalteracao,
    table1.scat_cdtarifasocial,
    table1.scat_nnfatorfiscalizacao,
    table1.scat_ictarifaconsumo,
    table1.scat_dsabreviada,
    table1.scat_cdgruposubcategoria,
    table1.scat_icsazonalidade,
    table1.scat_icrural
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from  cadastro.subcategoria'::text) table1(scat_id integer, catg_id integer, scat_cdsubcategoria integer, scat_dssubcategoria character varying(50), scat_icuso smallint, scat_tmultimaalteracao timestamp without time zone, scat_cdtarifasocial character(1), scat_nnfatorfiscalizacao smallint, scat_ictarifaconsumo smallint, scat_dsabreviada character varying(20), scat_cdgruposubcategoria integer, scat_icsazonalidade smallint, scat_icrural smallint);


ALTER TABLE vw_subcategoria OWNER TO gsan_admin;

--
-- TOC entry 313 (class 1259 OID 848387)
-- Name: vw_superintendencia; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_superintendencia AS
 SELECT table1.supt_id,
    table1.supt_nmsuperint,
    table1.supt_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.superintendencia'::text) table1(supt_id integer, supt_nmsuperint character varying(25), supt_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_superintendencia OWNER TO gsan_admin;

--
-- TOC entry 314 (class 1259 OID 848391)
-- Name: vw_un_resumo_ligacao_economia_mes_anterior; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_ligacao_economia_mes_anterior AS
 SELECT un_resumo_ligacao_economia.rele_id,
        CASE substr((un_resumo_ligacao_economia.rele_amreferencia)::text, 5, 2)
            WHEN '12'::text THEN (un_resumo_ligacao_economia.rele_amreferencia + 89)
            ELSE (un_resumo_ligacao_economia.rele_amreferencia + 1)
        END AS rele_amreferencia,
    un_resumo_ligacao_economia.greg_id,
    un_resumo_ligacao_economia.uneg_id,
    un_resumo_ligacao_economia.loca_id,
    un_resumo_ligacao_economia.loca_cdelo,
    un_resumo_ligacao_economia.stcm_id,
    un_resumo_ligacao_economia.qdra_id,
    un_resumo_ligacao_economia.rota_id,
    un_resumo_ligacao_economia.rele_cdsetorcomercial,
    un_resumo_ligacao_economia.rele_nnquadra,
    un_resumo_ligacao_economia.iper_id,
    un_resumo_ligacao_economia.last_id,
    un_resumo_ligacao_economia.lest_id,
    un_resumo_ligacao_economia.catg_id,
    un_resumo_ligacao_economia.scat_id,
    un_resumo_ligacao_economia.epod_id,
    un_resumo_ligacao_economia.cltp_id,
    un_resumo_ligacao_economia.lapf_id,
    un_resumo_ligacao_economia.lepf_id,
    un_resumo_ligacao_economia.rele_ichidrometro,
    un_resumo_ligacao_economia.rele_icvolumefixadoagua,
    un_resumo_ligacao_economia.rele_icvolumefixadoesgoto,
    un_resumo_ligacao_economia.rele_icpoco,
    un_resumo_ligacao_economia.rele_qtligacoes,
    un_resumo_ligacao_economia.rele_qteconomias,
    un_resumo_ligacao_economia.rele_tmultimaalteracao,
    un_resumo_ligacao_economia.rele_ichidrometropoco,
    un_resumo_ligacao_economia.cstf_id
   FROM un_res_lig_econ un_resumo_ligacao_economia
  WHERE (un_resumo_ligacao_economia.rele_amreferencia < ( SELECT max(un_resumo_ligacao_economia_1.rele_amreferencia) AS max
           FROM un_res_lig_econ un_resumo_ligacao_economia_1));


ALTER TABLE vw_un_resumo_ligacao_economia_mes_anterior OWNER TO gsan_admin;

--
-- TOC entry 315 (class 1259 OID 848396)
-- Name: vw_un_resi_lig_eco; Type: VIEW; Schema: cadastro; Owner: postgres
--

CREATE VIEW vw_un_resi_lig_eco AS
 SELECT
        CASE
            WHEN (a.rele_id IS NULL) THEN 0
            ELSE a.rele_id
        END AS rele_id,
        CASE
            WHEN (b.rele_id IS NULL) THEN 0
            ELSE b.rele_id
        END AS rele_idma,
        CASE
            WHEN (a.rele_amreferencia IS NULL) THEN b.rele_amreferencia
            ELSE a.rele_amreferencia
        END AS rele_amreferencia,
    to_number(
        CASE
            WHEN (a.rele_amreferencia IS NULL) THEN substr((b.rele_amreferencia)::text, 1, 4)
            ELSE substr((a.rele_amreferencia)::text, 1, 4)
        END, (9999)::text) AS rele_anoreferencia,
        CASE
            WHEN (a.rele_amreferencia IS NULL) THEN
            CASE
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
                WHEN (substr((b.rele_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
                ELSE ''::text
            END
            ELSE
            CASE
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
                WHEN (substr((a.rele_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
                ELSE ''::text
            END
        END AS rele_mesreferencia,
        CASE
            WHEN (a.greg_id IS NULL) THEN b.greg_id
            ELSE a.greg_id
        END AS greg_id,
        CASE
            WHEN (a.uneg_id IS NULL) THEN b.uneg_id
            ELSE a.uneg_id
        END AS uneg_id,
        CASE
            WHEN (a.loca_id IS NULL) THEN b.loca_id
            ELSE a.loca_id
        END AS loca_id,
        CASE
            WHEN (a.loca_cdelo IS NULL) THEN b.loca_cdelo
            ELSE a.loca_cdelo
        END AS loca_cdelo,
        CASE
            WHEN (a.stcm_id IS NULL) THEN b.stcm_id
            ELSE a.stcm_id
        END AS stcm_id,
        CASE
            WHEN (a.qdra_id IS NULL) THEN b.qdra_id
            ELSE a.qdra_id
        END AS qdra_id,
        CASE
            WHEN (a.rota_id IS NULL) THEN b.rota_id
            ELSE a.rota_id
        END AS rota_id,
        CASE
            WHEN (a.rele_cdsetorcomercial IS NULL) THEN b.rele_cdsetorcomercial
            ELSE a.rele_cdsetorcomercial
        END AS rele_cdsetorcomercial,
        CASE
            WHEN (a.rele_nnquadra IS NULL) THEN b.rele_nnquadra
            ELSE a.rele_nnquadra
        END AS rele_nnquadra,
        CASE
            WHEN (a.iper_id IS NULL) THEN b.iper_id
            ELSE a.iper_id
        END AS iper_id,
        CASE
            WHEN (a.last_id IS NULL) THEN b.last_id
            ELSE a.last_id
        END AS last_id,
        CASE
            WHEN (a.lest_id IS NULL) THEN b.lest_id
            ELSE a.lest_id
        END AS lest_id,
        CASE
            WHEN (a.catg_id IS NULL) THEN b.catg_id
            ELSE a.catg_id
        END AS catg_id,
        CASE
            WHEN (a.scat_id IS NULL) THEN b.scat_id
            ELSE a.scat_id
        END AS scat_id,
        CASE
            WHEN (a.epod_id IS NULL) THEN b.epod_id
            ELSE a.epod_id
        END AS epod_id,
        CASE
            WHEN (a.cltp_id IS NULL) THEN b.cltp_id
            ELSE a.cltp_id
        END AS cltp_id,
        CASE
            WHEN (a.lapf_id IS NULL) THEN b.lapf_id
            ELSE a.lapf_id
        END AS lapf_id,
        CASE
            WHEN (a.lepf_id IS NULL) THEN b.lepf_id
            ELSE a.lepf_id
        END AS lepf_id,
        CASE
            WHEN (a.cstf_id IS NULL) THEN b.cstf_id
            ELSE a.cstf_id
        END AS cstf_id,
        CASE
            WHEN (a.rele_ichidrometro IS NULL) THEN b.rele_ichidrometro
            ELSE a.rele_ichidrometro
        END AS rele_ichidrometro,
        CASE
            WHEN (a.rele_icvolumefixadoagua IS NULL) THEN b.rele_icvolumefixadoagua
            ELSE a.rele_icvolumefixadoagua
        END AS rele_icvolumefixadoagua,
        CASE
            WHEN (a.rele_icvolumefixadoesgoto IS NULL) THEN b.rele_icvolumefixadoesgoto
            ELSE a.rele_icvolumefixadoesgoto
        END AS rele_icvolumefixadoesgoto,
        CASE
            WHEN (a.rele_icpoco IS NULL) THEN b.rele_icpoco
            ELSE a.rele_icpoco
        END AS rele_icpoco,
        CASE
            WHEN (a.rele_ichidrometropoco IS NULL) THEN b.rele_ichidrometropoco
            ELSE a.rele_ichidrometropoco
        END AS rele_ichidrometropoco,
        CASE
            WHEN (a.last_id IN ( SELECT DISTINCT c.last_id
               FROM g_imovel_situacao c
              WHERE (c.istp_id = 1)
              ORDER BY c.last_id)) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoesativasagua,
        CASE
            WHEN (b.last_id IN ( SELECT DISTINCT d.last_id
               FROM g_imovel_situacao d
              WHERE (d.istp_id = 1)
              ORDER BY d.last_id)) THEN b.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoesativasaguama,
        CASE
            WHEN (a.lest_id IN ( SELECT DISTINCT e.lest_id
               FROM g_imovel_situacao e
              WHERE (e.istp_id = 3)
              ORDER BY e.lest_id)) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoesativasesgoto,
        CASE
            WHEN (b.lest_id IN ( SELECT DISTINCT f.lest_id
               FROM g_imovel_situacao f
              WHERE (f.istp_id = 3)
              ORDER BY f.lest_id)) THEN b.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoesativasesgotoma,
        CASE
            WHEN (a.last_id IN ( SELECT DISTINCT g.last_id
               FROM g_imovel_situacao g
              WHERE (g.istp_id = 4)
              ORDER BY g.last_id)) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiastotaisagua,
        CASE
            WHEN (b.last_id IN ( SELECT DISTINCT h.last_id
               FROM g_imovel_situacao h
              WHERE (h.istp_id = 4)
              ORDER BY h.last_id)) THEN b.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiastotaisaguama,
        CASE
            WHEN (a.lest_id IN ( SELECT DISTINCT i.lest_id
               FROM g_imovel_situacao i
              WHERE (i.istp_id = 4)
              ORDER BY i.lest_id)) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiastotaisesgoto,
        CASE
            WHEN (b.lest_id IN ( SELECT DISTINCT j.lest_id
               FROM g_imovel_situacao j
              WHERE (j.istp_id = 4)
              ORDER BY j.lest_id)) THEN b.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiastotaisesgotoma,
        CASE
            WHEN (a.last_id = ANY (ARRAY[1, 2])) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtclientesaguapotenciaisfactiveis,
        CASE
            WHEN (a.last_id = ANY (ARRAY[3, 4, 5])) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtclientesagualigadoscortados,
        CASE
            WHEN (a.last_id = ANY (ARRAY[6, 7, 8])) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtclientesaguasuprimidos,
        CASE
            WHEN (a.last_id = ANY (ARRAY[1, 2])) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiasaguapotenciaisfactiveis,
        CASE
            WHEN (a.last_id = ANY (ARRAY[3, 4, 5])) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiasagualigadoscortados,
        CASE
            WHEN (a.last_id = ANY (ARRAY[6, 7, 8])) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiasaguasuprimidos,
        CASE
            WHEN (a.lest_id = ANY (ARRAY[1, 2])) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtclientesesgotopotenciaisfactiveis,
        CASE
            WHEN (a.lest_id = 3) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtclientesesgotoligados,
        CASE
            WHEN (a.lest_id = ANY (ARRAY[5, 6])) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtclientesesgotoligadosforauso,
        CASE
            WHEN (a.lest_id = ANY (ARRAY[1, 2])) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiasesgotopotenciaisfactiveis,
        CASE
            WHEN (a.lest_id = 3) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiasesgotoligados,
        CASE
            WHEN (a.lest_id = ANY (ARRAY[5, 6])) THEN a.rele_qteconomias
            ELSE 0
        END AS rele_qteconomiasesgotoligadosforauso,
        CASE
            WHEN (a.rele_tmultimaalteracao IS NULL) THEN b.rele_tmultimaalteracao
            ELSE a.rele_tmultimaalteracao
        END AS rele_tmultimaalteracao
   FROM (un_res_lig_econ a
     FULL JOIN vw_un_resumo_ligacao_economia_mes_anterior b ON ((((((((((((((((((((((((((a.rele_amreferencia = b.rele_amreferencia) AND (a.greg_id = b.greg_id)) AND (a.uneg_id = b.uneg_id)) AND (a.loca_id = b.loca_id)) AND (a.loca_cdelo = b.loca_cdelo)) AND (a.stcm_id = b.stcm_id)) AND (a.qdra_id = b.qdra_id)) AND (a.rota_id = b.rota_id)) AND (a.rele_cdsetorcomercial = b.rele_cdsetorcomercial)) AND (a.rele_nnquadra = b.rele_nnquadra)) AND (a.iper_id = b.iper_id)) AND (a.last_id = b.last_id)) AND (a.lest_id = b.lest_id)) AND (a.catg_id = b.catg_id)) AND (a.scat_id = b.scat_id)) AND (a.epod_id = b.epod_id)) AND (a.cltp_id = b.cltp_id)) AND (a.lapf_id = b.lapf_id)) AND (a.lepf_id = b.lepf_id)) AND (a.rele_ichidrometro = b.rele_ichidrometro)) AND (a.rele_icvolumefixadoagua = b.rele_icvolumefixadoagua)) AND (a.rele_icvolumefixadoesgoto = b.rele_icvolumefixadoesgoto)) AND (a.rele_icpoco = b.rele_icpoco)) AND (a.rele_ichidrometropoco = b.rele_ichidrometropoco)) AND (a.cstf_id = b.cstf_id))));


ALTER TABLE vw_un_resi_lig_eco OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 848401)
-- Name: vw_un_resumo_ligacao_economia; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_ligacao_economia AS
 SELECT un_resumo_ligacao_economia.rele_id,
    un_resumo_ligacao_economia.rele_amreferencia,
    un_resumo_ligacao_economia.greg_id,
    un_resumo_ligacao_economia.uneg_id,
    un_resumo_ligacao_economia.loca_id,
    un_resumo_ligacao_economia.loca_cdelo,
    un_resumo_ligacao_economia.stcm_id,
    un_resumo_ligacao_economia.qdra_id,
    un_resumo_ligacao_economia.rota_id,
    un_resumo_ligacao_economia.rele_cdsetorcomercial,
    un_resumo_ligacao_economia.rele_nnquadra,
    un_resumo_ligacao_economia.iper_id,
    un_resumo_ligacao_economia.last_id,
    un_resumo_ligacao_economia.lest_id,
    un_resumo_ligacao_economia.catg_id,
    un_resumo_ligacao_economia.scat_id,
    un_resumo_ligacao_economia.epod_id,
    un_resumo_ligacao_economia.cltp_id,
    un_resumo_ligacao_economia.lapf_id,
    un_resumo_ligacao_economia.lepf_id,
        CASE
            WHEN (un_resumo_ligacao_economia.rele_ichidrometro = 1) THEN 'C/HIDROMETRO'::text
            WHEN (un_resumo_ligacao_economia.rele_ichidrometro = 2) THEN 'S/HIDROMETRO'::text
            ELSE 'NAO INFORMADO'::text
        END AS ichidrometro,
    un_resumo_ligacao_economia.rele_icvolumefixadoagua,
    un_resumo_ligacao_economia.rele_icvolumefixadoesgoto,
    un_resumo_ligacao_economia.rele_icpoco,
    un_resumo_ligacao_economia.rele_qtligacoes,
    un_resumo_ligacao_economia.rele_qteconomias,
    un_resumo_ligacao_economia.rele_tmultimaalteracao,
        CASE
            WHEN (un_resumo_ligacao_economia.rele_ichidrometropoco = 1) THEN 'C/HIDROMETRO'::text
            WHEN (un_resumo_ligacao_economia.rele_ichidrometropoco = 2) THEN 'S/HIDROMETRO'::text
            ELSE 'NAO INFORMADO'::text
        END AS ichidrometropoco,
    un_resumo_ligacao_economia.cstf_id
   FROM un_res_lig_econ un_resumo_ligacao_economia;


ALTER TABLE vw_un_resumo_ligacao_economia OWNER TO gsan_admin;

--
-- TOC entry 317 (class 1259 OID 848406)
-- Name: vw_unidade_negocio; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_unidade_negocio AS
 SELECT table1.uneg_id,
    table1.greg_id,
    table1.uneg_nmunidadenegocio,
    table1.uneg_nmabreviado,
    table1.uneg_icuso,
    table1.uneg_tmultimaalteracao,
    table1.clie_id,
    table1.uneg_nncnpj
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.unidade_negocio'::text) table1(uneg_id integer, greg_id integer, uneg_nmunidadenegocio character varying(50), uneg_nmabreviado character(4), uneg_icuso smallint, uneg_tmultimaalteracao timestamp without time zone, clie_id integer, uneg_nncnpj character varying(14));


ALTER TABLE vw_unidade_negocio OWNER TO gsan_admin;

--
-- TOC entry 318 (class 1259 OID 848410)
-- Name: vw_unidade_organizacional; Type: VIEW; Schema: cadastro; Owner: gsan_admin
--

CREATE VIEW vw_unidade_organizacional AS
 SELECT table1.unid_id,
    table1.unid_idsuperior,
    table1.unid_idcentralizadora,
    table1.unid_icesgoto,
    table1.unid_ictramite,
    table1.unid_dsunidade,
    table1.unid_dssiglaunidade,
    table1.unid_tmultimaalteracao,
    table1.empr_id,
    table1.loca_id,
    table1.greg_id,
    table1.meso_id,
    table1.untp_id,
    table1.unid_icabertura,
    table1.unid_icuso,
    table1.unid_iccentralatendimento,
    table1.unid_ictarifasocial,
    table1.unid_idrepavimentadora,
    table1.uneg_id,
    table1.unid_nncodigoconstante
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from cadastro.unidade_organizacional'::text) table1(unid_id integer, unid_idsuperior integer, unid_idcentralizadora integer, unid_icesgoto smallint, unid_ictramite smallint, unid_dsunidade character varying(80), unid_dssiglaunidade character(5), unid_tmultimaalteracao timestamp without time zone, empr_id integer, loca_id integer, greg_id integer, meso_id integer, untp_id integer, unid_icabertura smallint, unid_icuso smallint, unid_iccentralatendimento smallint, unid_ictarifasocial smallint, unid_idrepavimentadora integer, uneg_id integer, unid_nncodigoconstante integer);


ALTER TABLE vw_unidade_organizacional OWNER TO gsan_admin;

SET search_path = cobranca, pg_catalog;

--
-- TOC entry 319 (class 1259 OID 848415)
-- Name: faixa_valor; Type: TABLE; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE faixa_valor (
    fxvl_id integer NOT NULL,
    fxvl_dsfaixavalor character varying(30),
    fxvl_tmultimaalteracao timestamp without time zone
);


ALTER TABLE faixa_valor OWNER TO gsan_admin;

--
-- TOC entry 320 (class 1259 OID 848418)
-- Name: g_documento_tipo; Type: TABLE; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_documento_tipo (
    dotp_id integer NOT NULL,
    dotp_dsdocumentotipo character varying(30),
    dotp_dsabreviado character varying(10),
    dotp_icpagavel smallint,
    dotp_icuso smallint,
    dotp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_documento_tipo OWNER TO gsan_admin;

--
-- TOC entry 321 (class 1259 OID 848426)
-- Name: seq_un_resumo_parcelamento; Type: SEQUENCE; Schema: cobranca; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resumo_parcelamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resumo_parcelamento OWNER TO gsan_admin;

--
-- TOC entry 322 (class 1259 OID 848428)
-- Name: sequence_faixa_valor; Type: SEQUENCE; Schema: cobranca; Owner: gsan_admin
--

CREATE SEQUENCE sequence_faixa_valor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_faixa_valor OWNER TO gsan_admin;

--
-- TOC entry 323 (class 1259 OID 848430)
-- Name: sequence_un_resumo_indicadores_cobranca; Type: SEQUENCE; Schema: cobranca; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicadores_cobranca
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicadores_cobranca OWNER TO gsan_admin;

--
-- TOC entry 324 (class 1259 OID 848432)
-- Name: sequence_un_resumo_pendencia; Type: SEQUENCE; Schema: cobranca; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_pendencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_pendencia OWNER TO gsan_admin;

--
-- TOC entry 325 (class 1259 OID 848434)
-- Name: sequence_un_resumo_pendencia_ref_2010; Type: SEQUENCE; Schema: cobranca; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_pendencia_ref_2010
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_pendencia_ref_2010 OWNER TO gsan_admin;

--
-- TOC entry 326 (class 1259 OID 848436)
-- Name: sequence_un_resumo_pendencia_sem_quadra; Type: SEQUENCE; Schema: cobranca; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_pendencia_sem_quadra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_pendencia_sem_quadra OWNER TO gsan_admin;

--
-- TOC entry 327 (class 1259 OID 848438)
-- Name: un_resumo_indicadores_cobranca; Type: TABLE; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicadores_cobranca (
    rpen_id integer DEFAULT nextval('sequence_un_resumo_indicadores_cobranca'::regclass) NOT NULL,
    rpen_amreferencia integer NOT NULL,
    rpen_anoreferencia integer NOT NULL,
    rpen_mesreferencia character(6) NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL,
    rpen_cdsetorcomercial integer NOT NULL,
    rpen_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rpen_qtcontaspendentesma integer NOT NULL,
    rpen_vlpendente_contama numeric(13,2) NOT NULL,
    rpen_qtligacoes integer NOT NULL,
    rpen_qtligacoesativas integer NOT NULL,
    rpen_qtdocumentos integer NOT NULL,
    rpen_qtcontaspendentes integer NOT NULL,
    rpen_vlpendente_total numeric(13,2) NOT NULL,
    rpen_vlpendente_conta numeric(13,2) NOT NULL,
    rpen_vlpendente_servicos numeric(13,2) NOT NULL,
    rpen_vlpendente_parcelamento numeric(13,2) NOT NULL,
    rele_qtligacoesativasagua integer NOT NULL,
    rele_qtligacoesinativasagua integer NOT NULL,
    rele_qtligacoessuprimidas integer NOT NULL,
    rele_qtligacoestotaisagua integer NOT NULL,
    rear_qtcontasrecebidas integer NOT NULL,
    rear_vlarrecadado numeric(13,2) NOT NULL,
    rear_vlarrecacadomesatevencimento numeric(13,2) NOT NULL,
    rear_vlarrecacadomesaposvencimento numeric(13,2) NOT NULL,
    rear_vlarrecacado2mes numeric(13,2) NOT NULL,
    rear_vlarrecacado3mes numeric(13,2) NOT NULL,
    rear_vlarrecacadoacumuladoate3mes numeric(13,2) NOT NULL,
    rear_vlarrecadado_parcelamento numeric(13,2) NOT NULL,
    refa_qtcontasfaturamentoliquido integer NOT NULL,
    refa_qtcontasfaturamentoliquidoma integer NOT NULL,
    refa_vlfaturamentoliquido numeric(13,2) NOT NULL,
    refa_vlfaturamentoliquidoma numeric(13,2) NOT NULL,
    repa_qtparcelamentos integer NOT NULL,
    repa_qtcontaseguias integer NOT NULL,
    repa_vlnegociado numeric(13,2) NOT NULL,
    repa_vlfinanciado numeric(13,2) NOT NULL,
    repa_vlparcelado numeric(13,2) NOT NULL,
    rlig_qtcortes integer NOT NULL,
    rlig_qtsupressoes integer NOT NULL,
    rlig_qtreligacoes integer NOT NULL,
    rlig_qtreestabelecimentos integer NOT NULL,
    rpen_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE un_resumo_indicadores_cobranca OWNER TO gsan_admin;

--
-- TOC entry 328 (class 1259 OID 848443)
-- Name: un_resumo_parcelamento; Type: TABLE; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_parcelamento (
    repa_id integer NOT NULL,
    uneg_id integer NOT NULL,
    repa_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    loca_id integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    repa_cdsetorcomercial integer NOT NULL,
    repa_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    repa_qtcontas integer NOT NULL,
    repa_vlcontas numeric(13,2) NOT NULL,
    repa_vlguias numeric(13,2) NOT NULL,
    rota_id integer NOT NULL,
    repa_vlcreditos numeric(13,2) NOT NULL,
    repa_vldescacrescimo numeric(13,2) DEFAULT 0 NOT NULL,
    repa_qtguias integer NOT NULL,
    repa_vldescinatividade numeric(13,2) NOT NULL,
    repa_vlacrescimoimpontualidade numeric(13,2) DEFAULT 0 NOT NULL,
    repa_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    repa_qtparcelamentos smallint NOT NULL,
    repa_vldescantiguidade numeric(13,2) DEFAULT 0 NOT NULL,
    repa_qttotalparcelas integer NOT NULL,
    repa_qtmediaparcelas integer NOT NULL,
    repa_vljurosparcelamento numeric(13,2) NOT NULL,
    repa_vlentrada numeric(13,2) NOT NULL,
    repa_vldebacobrarparcelamentos numeric(13,2) NOT NULL,
    repa_vldebitosacobrartotal numeric(13,2) NOT NULL,
    repa_vldebacobraracrescimos numeric(13,2) NOT NULL,
    repa_vldebacobrarreligsancoes numeric(13,2) NOT NULL,
    cstf_id integer NOT NULL,
    repa_ichidrometro smallint,
    repa_qtreparcelamentos integer,
    repa_vloutrosdescontos numeric(13,2),
    repa_cdrota integer
);


ALTER TABLE un_resumo_parcelamento OWNER TO gsan_admin;

--
-- TOC entry 329 (class 1259 OID 848450)
-- Name: un_resumo_pendencia; Type: TABLE; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_pendencia (
    rpen_id integer NOT NULL,
    rpen_amreferencia integer,
    greg_id integer,
    iper_id integer,
    last_id integer,
    loca_cdelo integer,
    lest_id integer,
    catg_id integer,
    scat_id integer,
    epod_id integer,
    cltp_id integer,
    lapf_id integer,
    lepf_id integer,
    rpen_cdsetorcomercial integer,
    rpen_nnquadra integer,
    rpen_tmultimaalteracao timestamp without time zone DEFAULT now(),
    uneg_id integer,
    rota_id integer,
    fntp_id integer,
    loca_id integer,
    stcm_id integer,
    qdra_id integer,
    rpen_icvofixadoagua integer,
    rpen_icvofixadoesgoto integer,
    dotp_id integer,
    rpen_amreferenciadocumento integer,
    rpen_ichidrometro smallint,
    rpen_icvencido smallint DEFAULT 2 NOT NULL,
    rpen_qtligacoes integer,
    rpen_qtdocumentos integer,
    rpen_vlpendente_agua numeric(13,2),
    rpen_vlpendente_esgoto numeric(13,2),
    rpen_vlpendente_debitos numeric(13,2),
    rpen_vlpendente_creditos numeric(13,2),
    rpen_vlpendente_impostos numeric(13,2),
    cstf_id integer NOT NULL,
    fxvl_id integer NOT NULL,
    rpen_cdrota integer
);


ALTER TABLE un_resumo_pendencia OWNER TO gsan_admin;

--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 329
-- Name: COLUMN un_resumo_pendencia.rpen_icvencido; Type: COMMENT; Schema: cobranca; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_pendencia.rpen_icvencido IS 'Indicador de documento vencido';


--
-- TOC entry 330 (class 1259 OID 848455)
-- Name: un_resumo_pendencia_sem_quadra; Type: TABLE; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_pendencia_sem_quadra (
    rpsq_amreferencia integer,
    greg_id integer,
    iper_id integer,
    last_id integer,
    loca_cdelo integer,
    lest_id integer,
    catg_id integer,
    scat_id integer,
    epod_id integer,
    cltp_id integer,
    lapf_id integer,
    lepf_id integer,
    rpsq_cdsetorcomercial integer,
    uneg_id integer,
    fntp_id integer,
    loca_id integer,
    stcm_id integer,
    rpsq_icvofixadoagua integer,
    rpsq_icvofixadoesgoto integer,
    dotp_id integer,
    rpsq_amreferenciadocumento integer,
    rpsq_ichidrometro smallint,
    rpsq_icvencido smallint,
    rpsq_qtligacoes integer,
    rpsq_qtdocumentos integer,
    rpsq_vlpendente_agua numeric(13,2),
    rpsq_vlpendente_esgoto numeric(13,2),
    rpsq_vlpendente_debitos numeric(13,2),
    rpsq_vlpendente_creditos numeric(13,2),
    rpsq_vlpendente_impostos numeric(13,2),
    cstf_id integer NOT NULL,
    fxvl_id integer NOT NULL,
    rpmr_id integer,
    rpsq_tmultimaalteracao timestamp without time zone,
    rpsq_id integer DEFAULT nextval(('cobranca.sequence_un_resumo_pendencia_sem_quadra'::text)::regclass) NOT NULL
);


ALTER TABLE un_resumo_pendencia_sem_quadra OWNER TO gsan_admin;

--
-- TOC entry 331 (class 1259 OID 848459)
-- Name: vw_documento_tipo; Type: VIEW; Schema: cobranca; Owner: gsan_admin
--

CREATE VIEW vw_documento_tipo AS
 SELECT table1.dotp_id,
    table1.dotp_dsdocumentotipo,
    table1.dotp_dsabreviado,
    table1.dotp_icpagavel,
    table1.dotp_icuso,
    table1.dotp_tmultimaalteracao,
    table1.dotp_icagregador,
    table1.dotp_ictextopersonalizado
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from cobranca.documento_tipo'::text) table1(dotp_id integer, dotp_dsdocumentotipo character varying(30), dotp_dsabreviado character varying(10), dotp_icpagavel smallint, dotp_icuso smallint, dotp_tmultimaalteracao timestamp without time zone, dotp_icagregador integer, dotp_ictextopersonalizado smallint);


ALTER TABLE vw_documento_tipo OWNER TO gsan_admin;

SET search_path = faturamento, pg_catalog;

--
-- TOC entry 332 (class 1259 OID 848463)
-- Name: sequence_un_resumo_indicadores_faturamento; Type: SEQUENCE; Schema: faturamento; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicadores_faturamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicadores_faturamento OWNER TO gsan_admin;

--
-- TOC entry 333 (class 1259 OID 848465)
-- Name: un_resumo_indicadores_faturamento; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicadores_faturamento (
    refa_amreferencia integer NOT NULL,
    refa_anoreferencia text NOT NULL,
    refa_mesreferencia text NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL,
    refa_cdsetorcomercial integer NOT NULL,
    refa_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    crog_id integer,
    lict_id integer,
    dotp_id integer,
    fntp_id integer,
    dbtp_id integer,
    crti_id integer,
    refa_qtcontasemitidas bigint NOT NULL,
    rerf_qtcontasretificadas bigint NOT NULL,
    rerf_qtcontascanceladas bigint NOT NULL,
    rerf_qtcontasincluidas bigint NOT NULL,
    refa_qteconomiasfaturadas bigint NOT NULL,
    refa_vofaturadoagua bigint NOT NULL,
    rerf_vocanceladoagua bigint NOT NULL,
    rerf_voincluidoagua bigint NOT NULL,
    refa_vofaturadoesgoto bigint NOT NULL,
    rerf_vocanceladoesgoto bigint NOT NULL,
    rerf_voincluidoesgoto bigint NOT NULL,
    refa_vlfaturadoagua numeric NOT NULL,
    rerf_vlcanceladoagua numeric NOT NULL,
    rerf_vlincluidoagua numeric NOT NULL,
    refa_vlfaturadoesgoto numeric NOT NULL,
    rerf_vlcanceladoesgoto numeric NOT NULL,
    rerf_vlincluidoesgoto numeric NOT NULL,
    refa_vldocumentosfaturadoscredito numeric NOT NULL,
    rerf_vlcanceladocredito numeric NOT NULL,
    rerf_vlincluidocredito numeric NOT NULL,
    refa_vldocumentosfaturadosoutros numeric NOT NULL,
    rerf_vlcanceladooutros numeric NOT NULL,
    rerf_vlincluidooutros numeric NOT NULL,
    refa_vlacrescimoimpontualidade numeric NOT NULL,
    refa_qtcontasemitidasma bigint NOT NULL,
    rerf_qtcontasretificadasma bigint NOT NULL,
    rerf_qtcontascanceladasma bigint NOT NULL,
    rerf_qtcontasincluidasma bigint NOT NULL,
    refa_qteconomiasfaturadasma bigint NOT NULL,
    refa_vofaturadoaguama bigint NOT NULL,
    rerf_vocanceladoaguama bigint NOT NULL,
    rerf_voincluidoaguama bigint NOT NULL,
    refa_vofaturadoesgotoma bigint NOT NULL,
    rerf_vocanceladoesgotoma bigint NOT NULL,
    rerf_voincluidoesgotoma bigint NOT NULL,
    refa_vlfaturadoaguama numeric NOT NULL,
    rerf_vlcanceladoaguama numeric NOT NULL,
    rerf_vlincluidoaguama numeric NOT NULL,
    refa_vlfaturadoesgotoma numeric NOT NULL,
    rerf_vlcanceladoesgotoma numeric NOT NULL,
    rerf_vlincluidoesgotoma numeric NOT NULL,
    refa_vldocumentosfaturadoscreditoma numeric NOT NULL,
    rerf_vlcanceladocreditoma numeric NOT NULL,
    rerf_vlincluidocreditoma numeric NOT NULL,
    refa_vldocumentosfaturadosoutrosma numeric NOT NULL,
    rerf_vlcanceladooutrosma numeric NOT NULL,
    rerf_vlincluidooutrosma numeric NOT NULL,
    refa_vlacrescimoimpontualidadema numeric NOT NULL,
    refa_vlarrastos numeric NOT NULL,
    refa_vlparcelamento numeric NOT NULL,
    rerf_qtguiascanceladas bigint NOT NULL,
    refa_id integer DEFAULT nextval('sequence_un_resumo_indicadores_faturamento'::regclass) NOT NULL,
    refa_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE un_resumo_indicadores_faturamento OWNER TO gsan_admin;

SET search_path = cobranca, pg_catalog;

--
-- TOC entry 334 (class 1259 OID 848473)
-- Name: vw_un_resumo_unificado_cobranca; Type: VIEW; Schema: cobranca; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_unificado_cobranca AS
 SELECT
        CASE substr((un_resumo_pendencia.rpen_amreferencia)::text, 5, 2)
            WHEN '12'::text THEN (un_resumo_pendencia.rpen_amreferencia + 89)
            ELSE (un_resumo_pendencia.rpen_amreferencia + 1)
        END AS rpen_amreferencia,
    un_resumo_pendencia.greg_id,
    un_resumo_pendencia.uneg_id,
    un_resumo_pendencia.loca_id,
    un_resumo_pendencia.loca_cdelo,
    un_resumo_pendencia.stcm_id,
    un_resumo_pendencia.qdra_id,
    un_resumo_pendencia.rota_id,
    un_resumo_pendencia.rpen_cdsetorcomercial,
    un_resumo_pendencia.rpen_nnquadra,
    un_resumo_pendencia.iper_id,
    un_resumo_pendencia.last_id,
    un_resumo_pendencia.lest_id,
    un_resumo_pendencia.catg_id,
    un_resumo_pendencia.scat_id,
    un_resumo_pendencia.epod_id,
    un_resumo_pendencia.cltp_id,
    COALESCE(un_resumo_pendencia.lapf_id, 0) AS lapf_id,
    COALESCE(un_resumo_pendencia.lepf_id, 0) AS lepf_id,
        CASE
            WHEN (un_resumo_pendencia.dotp_id = 1) THEN un_resumo_pendencia.rpen_qtdocumentos
            ELSE 0
        END AS rpen_qtcontaspendentesma,
        CASE
            WHEN (un_resumo_pendencia.dotp_id = 1) THEN ((((COALESCE(un_resumo_pendencia.rpen_vlpendente_agua, 0.0) + COALESCE(un_resumo_pendencia.rpen_vlpendente_esgoto, 0.0)) + COALESCE(un_resumo_pendencia.rpen_vlpendente_debitos, 0.0)) - COALESCE(un_resumo_pendencia.rpen_vlpendente_creditos, 0.0)) - COALESCE(un_resumo_pendencia.rpen_vlpendente_impostos, (0)::numeric))
            ELSE (0)::numeric
        END AS rpen_vlpendente_contama,
    0 AS rpen_qtligacoes,
    0 AS rpen_qtligacoesativas,
    0 AS rpen_qtdocumentos,
    0 AS rpen_qtcontaspendentes,
    0.0 AS rpen_vlpendente_total,
    0.0 AS rpen_vlpendente_conta,
    0.0 AS rpen_vlpendente_servicos,
    0 AS rpen_vlpendente_parcelamento,
    0 AS rele_qtligacoesativasagua,
    0 AS rele_qtligacoesinativasagua,
    0 AS rele_qtligacoessuprimidas,
    0 AS rele_qtligacoestotaisagua,
    0 AS rear_qtcontasrecebidas,
    0.0 AS rear_vlarrecadado,
    0.0 AS rear_vlarrecacadomesatevencimento,
    0.0 AS rear_vlarrecacadomesaposvencimento,
    0.0 AS rear_vlarrecacado2mes,
    0.0 AS rear_vlarrecacado3mes,
    0.0 AS rear_vlarrecacadoacumuladoate3mes,
    0.0 AS rear_vlarrecadado_parcelamento,
    0 AS refa_qtcontasfaturamentoliquido,
    0 AS refa_qtcontasfaturamentoliquidoma,
    0.0 AS refa_vlfaturamentoliquido,
    0.0 AS refa_vlfaturamentoliquidoma,
    0 AS repa_qtparcelamentos,
    0 AS repa_qtcontaseguias,
    0.0 AS repa_vlnegociado,
    0.0 AS repa_vlfinanciado,
    0.0 AS repa_vlparcelado,
    0 AS rlig_qtcortes,
    0 AS rlig_qtsupressoes,
    0 AS rlig_qtreligacoes,
    0 AS rlig_qtreestabelecimentos
   FROM un_resumo_pendencia
  WHERE (un_resumo_pendencia.rpen_amreferencia < ( SELECT max(un_resumo_pendencia_1.rpen_amreferencia) AS max
           FROM un_resumo_pendencia un_resumo_pendencia_1))
UNION ALL
 SELECT a.rpen_amreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.rpen_cdsetorcomercial,
    a.rpen_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    COALESCE(a.lapf_id, 0) AS lapf_id,
    COALESCE(a.lepf_id, 0) AS lepf_id,
    0 AS rpen_qtcontaspendentesma,
    0.0 AS rpen_vlpendente_contama,
    a.rpen_qtligacoes,
        CASE
            WHEN (a.last_id IN ( SELECT DISTINCT c.last_id
               FROM cadastro.g_imovel_situacao c
              WHERE (c.istp_id = 1)
              ORDER BY c.last_id)) THEN a.rpen_qtligacoes
            ELSE 0
        END AS rpen_qtligacoesativas,
    a.rpen_qtdocumentos,
        CASE
            WHEN (a.dotp_id = 1) THEN a.rpen_qtdocumentos
            ELSE 0
        END AS rpen_qtcontaspendentes,
    ((((COALESCE(a.rpen_vlpendente_agua, 0.0) + COALESCE(a.rpen_vlpendente_esgoto, 0.0)) + COALESCE(a.rpen_vlpendente_debitos, 0.0)) - COALESCE(a.rpen_vlpendente_creditos, 0.0)) - COALESCE(a.rpen_vlpendente_impostos, 0.0)) AS rpen_vlpendente_total,
        CASE
            WHEN (a.dotp_id = 1) THEN ((((COALESCE(a.rpen_vlpendente_agua, 0.0) + COALESCE(a.rpen_vlpendente_esgoto, 0.0)) + COALESCE(a.rpen_vlpendente_debitos, 0.0)) - COALESCE(a.rpen_vlpendente_creditos, 0.0)) - COALESCE(a.rpen_vlpendente_impostos, 0.0))
            ELSE 0.0
        END AS rpen_vlpendente_conta,
        CASE
            WHEN (a.fntp_id = 1) THEN ((((COALESCE(a.rpen_vlpendente_agua, 0.0) + COALESCE(a.rpen_vlpendente_esgoto, 0.0)) + COALESCE(a.rpen_vlpendente_debitos, 0.0)) - COALESCE(a.rpen_vlpendente_creditos, 0.0)) - COALESCE(a.rpen_vlpendente_impostos, 0.0))
            ELSE 0.0
        END AS rpen_vlpendente_servicos,
        CASE
            WHEN (a.fntp_id = ANY (ARRAY[2, 3, 4, 8])) THEN ((((COALESCE(a.rpen_vlpendente_agua, 0.0) + COALESCE(a.rpen_vlpendente_esgoto, 0.0)) + COALESCE(a.rpen_vlpendente_debitos, 0.0)) - COALESCE(a.rpen_vlpendente_creditos, 0.0)) - COALESCE(a.rpen_vlpendente_impostos, 0.0))
            ELSE 0.0
        END AS rpen_vlpendente_parcelamento,
    0 AS rele_qtligacoesativasagua,
    0 AS rele_qtligacoesinativasagua,
    0 AS rele_qtligacoessuprimidas,
    0 AS rele_qtligacoestotaisagua,
    0 AS rear_qtcontasrecebidas,
    0.0 AS rear_vlarrecadado,
    0.0 AS rear_vlarrecacadomesatevencimento,
    0.0 AS rear_vlarrecacadomesaposvencimento,
    0.0 AS rear_vlarrecacado2mes,
    0.0 AS rear_vlarrecacado3mes,
    0.0 AS rear_vlarrecacadoacumuladoate3mes,
    0.0 AS rear_vlarrecadado_parcelamento,
    0 AS refa_qtcontasfaturamentoliquido,
    0 AS refa_qtcontasfaturamentoliquidoma,
    0.0 AS refa_vlfaturamentoliquido,
    0.0 AS refa_vlfaturamentoliquidoma,
    0 AS repa_qtparcelamentos,
    0 AS repa_qtcontaseguias,
    0.0 AS repa_vlnegociado,
    0.0 AS repa_vlfinanciado,
    0.0 AS repa_vlparcelado,
    0 AS rlig_qtcortes,
    0 AS rlig_qtsupressoes,
    0 AS rlig_qtreligacoes,
    0 AS rlig_qtreestabelecimentos
   FROM un_resumo_pendencia a
UNION ALL
 SELECT a.rele_amreferencia AS rpen_amreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.rele_cdsetorcomercial AS rpen_cdsetorcomercial,
    a.rele_nnquadra AS rpen_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    0 AS rpen_qtcontaspendentesma,
    0.0 AS rpen_vlpendente_contama,
    0 AS rpen_qtligacoes,
    0 AS rpen_qtligacoesativas,
    0 AS rpen_qtdocumentos,
    0 AS rpen_qtcontaspendentes,
    0.0 AS rpen_vlpendente_total,
    0.0 AS rpen_vlpendente_conta,
    0.0 AS rpen_vlpendente_servicos,
    0.0 AS rpen_vlpendente_parcelamento,
        CASE
            WHEN (a.last_id IN ( SELECT DISTINCT b.last_id
               FROM cadastro.g_imovel_situacao b
              WHERE (b.istp_id = 1)
              ORDER BY b.last_id)) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoesativasagua,
        CASE
            WHEN (a.last_id = 5) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoesinativasagua,
        CASE
            WHEN (a.last_id = 6) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoessuprimidas,
        CASE
            WHEN (a.last_id IN ( SELECT DISTINCT g.last_id
               FROM cadastro.g_imovel_situacao g
              WHERE (g.istp_id = 4)
              ORDER BY g.last_id)) THEN a.rele_qtligacoes
            ELSE 0
        END AS rele_qtligacoestotaisagua,
    0 AS rear_qtcontasrecebidas,
    0.0 AS rear_vlarrecadado,
    0.0 AS rear_vlarrecacadomesatevencimento,
    0.0 AS rear_vlarrecacadomesaposvencimento,
    0.0 AS rear_vlarrecacado2mes,
    0.0 AS rear_vlarrecacado3mes,
    0.0 AS rear_vlarrecacadoacumuladoate3mes,
    0.0 AS rear_vlarrecadado_parcelamento,
    0 AS refa_qtcontasfaturamentoliquido,
    0 AS refa_qtcontasfaturamentoliquidoma,
    0.0 AS refa_vlfaturamentoliquido,
    0 AS refa_vlfaturamentoliquidoma,
    0 AS repa_qtparcelamentos,
    0 AS repa_qtcontaseguias,
    0.0 AS repa_vlnegociado,
    0.0 AS repa_vlfinanciado,
    0.0 AS repa_vlparcelado,
    0 AS rlig_qtcortes,
    0 AS rlig_qtsupressoes,
    0 AS rlig_qtreligacoes,
    0 AS rlig_qtreestabelecimentos
   FROM cadastro.un_res_lig_econ a
UNION ALL
 SELECT a.rear_amreferencia AS rpen_amreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.rear_cdsetorcomercial AS rpen_cdsetorcomercial,
    a.rear_nnquadra AS rpen_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    0 AS rpen_qtcontaspendentesma,
    0.0 AS rpen_vlpendente_contama,
    0 AS rpen_qtligacoes,
    0 AS rpen_qtligacoesativas,
    0 AS rpen_qtdocumentos,
    0 AS rpen_qtcontaspendentes,
    0.0 AS rpen_vlpendente_total,
    0.0 AS rpen_vlpendente_conta,
    0.0 AS rpen_vlpendente_servicos,
    0.0 AS rpen_vlpendente_parcelamento,
    0 AS rele_qtligacoesativasagua,
    0 AS rele_qtligacoesinativasagua,
    0 AS rele_qtligacoessuprimidas,
    0 AS rele_qtligacoestotaisagua,
    a.rear_qtcontas AS rear_qtcontasrecebidas,
    (((((COALESCE(a.rear_vlagua, 0.0) + COALESCE(a.rear_vlesgoto, 0.0)) + COALESCE(a.rear_vlnaoidentificado, 0.0)) + COALESCE(a.rear_vldocsrecebidosoutros, 0.0)) - COALESCE(a.rear_vldocsrecebidoscredito, 0.0)) - COALESCE(a.rear_vlimpostos, 0.0)) AS rear_vlarrecadado,
        CASE
            WHEN (a.eppa_id = 0) THEN (((((COALESCE(a.rear_vlagua, 0.0) + COALESCE(a.rear_vlesgoto, 0.0)) + COALESCE(a.rear_vlnaoidentificado, 0.0)) + COALESCE(a.rear_vldocsrecebidosoutros, 0.0)) - COALESCE(a.rear_vldocsrecebidoscredito, 0.0)) - COALESCE(a.rear_vlimpostos, 0.0))
            ELSE (0)::numeric
        END AS rear_vlarrecacadomesatevencimento,
        CASE
            WHEN (a.eppa_id = 1) THEN (((((COALESCE(a.rear_vlagua, 0.0) + COALESCE(a.rear_vlesgoto, 0.0)) + COALESCE(a.rear_vlnaoidentificado, 0.0)) + COALESCE(a.rear_vldocsrecebidosoutros, 0.0)) - COALESCE(a.rear_vldocsrecebidoscredito, 0.0)) - COALESCE(a.rear_vlimpostos, 0.0))
            ELSE 0.0
        END AS rear_vlarrecacadomesaposvencimento,
        CASE
            WHEN (a.eppa_id = 2) THEN (((((COALESCE(a.rear_vlagua, 0.0) + COALESCE(a.rear_vlesgoto, 0.0)) + COALESCE(a.rear_vlnaoidentificado, 0.0)) + COALESCE(a.rear_vldocsrecebidosoutros, 0.0)) - COALESCE(a.rear_vldocsrecebidoscredito, 0.0)) - COALESCE(a.rear_vlimpostos, 0.0))
            ELSE 0.0
        END AS rear_vlarrecacado2mes,
        CASE
            WHEN (a.eppa_id = 3) THEN (((((COALESCE(a.rear_vlagua, 0.0) + COALESCE(a.rear_vlesgoto, 0.0)) + COALESCE(a.rear_vlnaoidentificado, 0.0)) + COALESCE(a.rear_vldocsrecebidosoutros, 0.0)) - COALESCE(a.rear_vldocsrecebidoscredito, 0.0)) - COALESCE(a.rear_vlimpostos, 0.0))
            ELSE 0.0
        END AS rear_vlarrecacado3mes,
        CASE
            WHEN (a.eppa_id <= 3) THEN (((((COALESCE(a.rear_vlagua, 0.0) + COALESCE(a.rear_vlesgoto, 0.0)) + COALESCE(a.rear_vlnaoidentificado, 0.0)) + COALESCE(a.rear_vldocsrecebidosoutros, 0.0)) - COALESCE(a.rear_vldocsrecebidoscredito, 0.0)) - COALESCE(a.rear_vlimpostos, 0.0))
            ELSE 0.0
        END AS rear_vlarrecacadoacumuladoate3mes,
        CASE
            WHEN (a.fntp_idoutros = ANY (ARRAY[2, 3, 4, 8])) THEN (((((COALESCE(a.rear_vlagua, 0.0) + COALESCE(a.rear_vlesgoto, 0.0)) + COALESCE(a.rear_vlnaoidentificado, 0.0)) + COALESCE(a.rear_vldocsrecebidosoutros, 0.0)) - COALESCE(a.rear_vldocsrecebidoscredito, 0.0)) - COALESCE(a.rear_vlimpostos, 0.0))
            ELSE 0.0
        END AS rear_vlarrecadado_parcelamento,
    0 AS refa_qtcontasfaturamentoliquido,
    0 AS refa_qtcontasfaturamentoliquidoma,
    0.0 AS refa_vlfaturamentoliquido,
    0.0 AS refa_vlfaturamentoliquidoma,
    0 AS repa_qtparcelamentos,
    0 AS repa_qtcontaseguias,
    0.0 AS repa_vlnegociado,
    0.0 AS repa_vlfinanciado,
    0.0 AS repa_vlparcelado,
    0 AS rlig_qtcortes,
    0 AS rlig_qtsupressoes,
    0 AS rlig_qtreligacoes,
    0 AS rlig_qtreestabelecimentos
   FROM arrecadacao.un_resumo_arrecadacao a
UNION ALL
 SELECT a.refa_amreferencia AS rpen_amreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.refa_cdsetorcomercial AS rpen_cdsetorcomercial,
    a.refa_nnquadra AS rpen_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    0 AS rpen_qtcontaspendentesma,
    0.0 AS rpen_vlpendente_contama,
    0 AS rpen_qtligacoes,
    0 AS rpen_qtligacoesativas,
    0 AS rpen_qtdocumentos,
    0 AS rpen_qtcontaspendentes,
    0.0 AS rpen_vlpendente_total,
    0.0 AS rpen_vlpendente_conta,
    0.0 AS rpen_vlpendente_servicos,
    0.0 AS rpen_vlpendente_parcelamento,
    0.0 AS rele_qtligacoesativasagua,
    0.0 AS rele_qtligacoesinativasagua,
    0.0 AS rele_qtligacoessuprimidas,
    0.0 AS rele_qtligacoestotaisagua,
    0.0 AS rear_qtcontasrecebidas,
    0.0 AS rear_vlarrecadado,
    0.0 AS rear_vlarrecacadomesatevencimento,
    0.0 AS rear_vlarrecacadomesaposvencimento,
    0.0 AS rear_vlarrecacado2mes,
    0.0 AS rear_vlarrecacado3mes,
    0.0 AS rear_vlarrecacadoacumuladoate3mes,
    0.0 AS rear_vlarrecadado_parcelamento,
    ((COALESCE(a.refa_qtcontasemitidas, (0)::bigint) - COALESCE(a.rerf_qtcontascanceladas, (0)::bigint)) + COALESCE(a.rerf_qtcontasincluidas, (0)::bigint)) AS refa_qtcontasfaturamentoliquido,
    ((COALESCE(a.refa_qtcontasemitidasma, (0)::bigint) - COALESCE(a.rerf_qtcontascanceladasma, (0)::bigint)) + COALESCE(a.rerf_qtcontasincluidasma, (0)::bigint)) AS refa_qtcontasfaturamentoliquidoma,
    (((((((((COALESCE(a.refa_vlfaturadoagua, 0.0) - COALESCE(a.rerf_vlcanceladoagua, 0.0)) + COALESCE(a.rerf_vlincluidoagua, 0.0)) + COALESCE(a.refa_vlfaturadoesgoto, 0.0)) - COALESCE(a.rerf_vlcanceladoesgoto, 0.0)) + COALESCE(a.rerf_vlincluidoesgoto, 0.0)) - ((COALESCE(a.refa_vldocumentosfaturadoscredito, 0.0) - COALESCE(a.rerf_vlcanceladocredito, 0.0)) + COALESCE(a.rerf_vlincluidocredito, (0)::numeric))) + COALESCE(a.refa_vldocumentosfaturadosoutros, 0.0)) - COALESCE(a.rerf_vlcanceladooutros, 0.0)) + COALESCE(a.rerf_vlincluidooutros, 0.0)) AS refa_vlfaturamentoliquido,
    (((((((((COALESCE(a.refa_vlfaturadoaguama, 0.0) - COALESCE(a.rerf_vlcanceladoaguama, 0.0)) + COALESCE(a.rerf_vlincluidoaguama, 0.0)) + COALESCE(a.refa_vlfaturadoesgotoma, 0.0)) - COALESCE(a.rerf_vlcanceladoesgotoma, 0.0)) + COALESCE(a.rerf_vlincluidoesgotoma, 0.0)) - ((COALESCE(a.refa_vldocumentosfaturadoscreditoma, 0.0) - COALESCE(a.rerf_vlcanceladocreditoma, 0.0)) + COALESCE(a.rerf_vlincluidocreditoma, 0.0))) + COALESCE(a.refa_vldocumentosfaturadosoutrosma, 0.0)) - COALESCE(a.rerf_vlcanceladooutrosma, 0.0)) + COALESCE(a.rerf_vlincluidooutrosma, 0.0)) AS refa_vlfaturamentoliquidoma,
    0 AS repa_qtparcelamentos,
    0 AS repa_qtcontaseguias,
    0.0 AS repa_vlnegociado,
    0.0 AS repa_vlfinanciado,
    0.0 AS repa_vlparcelado,
    0 AS rlig_qtcortes,
    0 AS rlig_qtsupressoes,
    0 AS rlig_qtreligacoes,
    0 AS rlig_qtreestabelecimentos
   FROM faturamento.un_resumo_indicadores_faturamento a
UNION ALL
 SELECT a.repa_amreferencia AS rpen_amreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.repa_cdsetorcomercial AS rpen_cdsetorcomercial,
    a.repa_nnquadra AS rpen_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    0 AS rpen_qtcontaspendentesma,
    0.0 AS rpen_vlpendente_contama,
    0 AS rpen_qtligacoes,
    0 AS rpen_qtligacoesativas,
    0 AS rpen_qtdocumentos,
    0 AS rpen_qtcontaspendentes,
    0.0 AS rpen_vlpendente_total,
    0.0 AS rpen_vlpendente_conta,
    0.0 AS rpen_vlpendente_servicos,
    0.0 AS rpen_vlpendente_parcelamento,
    0 AS rele_qtligacoesativasagua,
    0 AS rele_qtligacoesinativasagua,
    0 AS rele_qtligacoessuprimidas,
    0 AS rele_qtligacoestotaisagua,
    0 AS rear_qtcontasrecebidas,
    0.0 AS rear_vlarrecadado,
    0.0 AS rear_vlarrecacadomesatevencimento,
    0.0 AS rear_vlarrecacadomesaposvencimento,
    0.0 AS rear_vlarrecacado2mes,
    0.0 AS rear_vlarrecacado3mes,
    0.0 AS rear_vlarrecacadoacumuladoate3mes,
    0.0 AS rear_vlarrecadado_parcelamento,
    0 AS refa_qtcontasfaturamentoliquido,
    0 AS refa_qtcontasfaturamentoliquidoma,
    0.0 AS refa_vlfaturamentoliquido,
    0.0 AS refa_vlfaturamentoliquidoma,
    a.repa_qtparcelamentos,
    (a.repa_qtcontas + a.repa_qtguias) AS repa_qtcontaseguias,
    (((((((a.repa_vlcontas + a.repa_vlguias) + a.repa_vldebacobrarparcelamentos) - a.repa_vlcreditos) + a.repa_vlacrescimoimpontualidade) - a.repa_vldescacrescimo) - a.repa_vldescinatividade) - a.repa_vldescantiguidade) AS repa_vlnegociado,
    ((((((((a.repa_vlcontas + a.repa_vlguias) + a.repa_vldebacobrarparcelamentos) - a.repa_vlcreditos) + a.repa_vlacrescimoimpontualidade) - a.repa_vldescacrescimo) - a.repa_vldescinatividade) - a.repa_vldescantiguidade) - a.repa_vlentrada) AS repa_vlfinanciado,
    ((((((((a.repa_vlcontas + a.repa_vlguias) + a.repa_vldebacobrarparcelamentos) - a.repa_vlcreditos) + a.repa_vlacrescimoimpontualidade) - a.repa_vldescacrescimo) - a.repa_vldescinatividade) - a.repa_vldescantiguidade) + a.repa_vljurosparcelamento) AS repa_vlparcelado,
    0 AS rlig_qtcortes,
    0 AS rlig_qtsupressoes,
    0 AS rlig_qtreligacoes,
    0 AS rlig_qtreestabelecimentos
   FROM un_resumo_parcelamento a;


ALTER TABLE vw_un_resumo_unificado_cobranca OWNER TO gsan_admin;

SET search_path = corporativo, pg_catalog;

--
-- TOC entry 335 (class 1259 OID 848478)
-- Name: sequence_un_resumo_corporativo; Type: SEQUENCE; Schema: corporativo; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_corporativo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_corporativo OWNER TO gsan_admin;

--
-- TOC entry 336 (class 1259 OID 848480)
-- Name: un_resumo_corporativo; Type: TABLE; Schema: corporativo; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_corporativo (
    corr_id integer NOT NULL,
    coor_vlfaturamentoliquido numeric(13,2),
    coor_vlfaturamentoagua numeric(13,2),
    coor_vlfaturamentoesgoto numeric(13,2),
    coor_vlarrecadacao numeric(13,2),
    coor_indiceadimplencia numeric(13,2),
    coor_vofaturado integer,
    coor_voconsumido integer,
    coor_qtramaisligramaisliganalise integer,
    coor_qtramaiscortados integer,
    coor_qtligacoesativas integer,
    coor_qtligacoesinativas integer,
    coor_qtligacoesmedidas integer,
    coor_qtligacoesnaomedidas integer,
    coor_qthidrometroinstalados integer,
    coor_amreferencia integer NOT NULL,
    coor_anoreferencia integer NOT NULL,
    coor_tmultimaalteracao timestamp without time zone,
    coor_mesreferencia character(6) NOT NULL,
    coor_vlmetaarrecadacao numeric(13,2),
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    catg_id integer NOT NULL
);


ALTER TABLE un_resumo_corporativo OWNER TO gsan_admin;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.corr_id; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.corr_id IS 'Identificador da tabela';


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_vlfaturamentoliquido; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_vlfaturamentoliquido IS 'Valor do faturamento liquido';


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_vlfaturamentoagua; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_vlfaturamentoagua IS 'Valor do faturamento agua';


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_vlfaturamentoesgoto; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_vlfaturamentoesgoto IS 'Valor do faturamento esgoto';


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_vlarrecadacao; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_vlarrecadacao IS 'Valor da arrecadacao';


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_indiceadimplencia; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_indiceadimplencia IS 'Indice de adimplencia';


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_vofaturado; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_vofaturado IS 'Volume faturado m3';


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_voconsumido; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_voconsumido IS 'Volume consumido m3';


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_qtramaisligramaisliganalise; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_qtramaisligramaisliganalise IS 'Quantidade de ramais ligados e ramais ligados em analise';


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_qtramaiscortados; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_qtramaiscortados IS 'Quantidade de ramais cortados';


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_qtligacoesativas; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_qtligacoesativas IS 'Quantidade de ligacoes ativas';


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_qtligacoesinativas; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_qtligacoesinativas IS 'Quantidade de ligacoes inativas';


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_qtligacoesmedidas; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_qtligacoesmedidas IS 'Quantidade de ligacoes medidas';


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_qtligacoesnaomedidas; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_qtligacoesnaomedidas IS 'Quantidade de ligacoes nao medidas';


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_qthidrometroinstalados; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_qthidrometroinstalados IS 'Quantidade de hidrometros instalados';


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_amreferencia; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_amreferencia IS 'Ano mes de referencia';


--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_anoreferencia; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_anoreferencia IS 'Ano de referencia';


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_tmultimaalteracao; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_tmultimaalteracao IS 'Ultima alteracao na tabela';


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_mesreferencia; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_mesreferencia IS 'Mes de referencia';


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.coor_vlmetaarrecadacao; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.coor_vlmetaarrecadacao IS 'Valor da meta de arrecadacao';


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.greg_id; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.greg_id IS 'Id da gerencia regional';


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.uneg_id; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.uneg_id IS 'Id da unidade de negocio';


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.loca_id; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.loca_id IS 'Id da localidade';


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN un_resumo_corporativo.catg_id; Type: COMMENT; Schema: corporativo; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_corporativo.catg_id IS 'Id da categoria';


SET search_path = faturamento, pg_catalog;

--
-- TOC entry 337 (class 1259 OID 848483)
-- Name: g_consumo_tarifa; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_consumo_tarifa (
    cstf_id integer NOT NULL,
    cstf_dsconsumotarifa character varying(30),
    cstf_icuso smallint,
    cstf_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_consumo_tarifa OWNER TO gsan_admin;

--
-- TOC entry 338 (class 1259 OID 848491)
-- Name: g_credito_origem; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_credito_origem (
    crog_id integer NOT NULL,
    crog_dscreditoorigem character varying(40),
    crog_dsabreviado character varying(10),
    crog_icuso smallint,
    crog_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_credito_origem OWNER TO gsan_admin;

--
-- TOC entry 339 (class 1259 OID 848499)
-- Name: g_credito_tipo; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_credito_tipo (
    crti_id integer NOT NULL,
    lict_id integer,
    crti_dscreditotipo character varying(30),
    crti_dsabreviado character varying(18),
    crti_icuso smallint,
    crti_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    crti_vllimite numeric(13,2),
    crti_icgeracaoautomatica smallint
);


ALTER TABLE g_credito_tipo OWNER TO gsan_admin;

--
-- TOC entry 340 (class 1259 OID 848507)
-- Name: g_debito_tipo; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_debito_tipo (
    dbtp_id integer NOT NULL,
    lict_id integer NOT NULL,
    dbtp_dsdebitotipo character varying(30),
    dbtp_dsabreviado character varying(18),
    dbtp_icuso smallint,
    dbtp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    fntp_id integer NOT NULL,
    dbtp_vllimite numeric(13,2),
    dbtp_icgeracaoautomatica smallint NOT NULL,
    dbtp_icgeracaoconta smallint NOT NULL,
    dbtp_vlsugerido numeric(13,2)
);


ALTER TABLE g_debito_tipo OWNER TO gsan_admin;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 340
-- Name: COLUMN g_debito_tipo.dbtp_vlsugerido; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN g_debito_tipo.dbtp_vlsugerido IS 'Valor sugerido';


--
-- TOC entry 341 (class 1259 OID 848515)
-- Name: g_fat_sit_motivo; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_fat_sit_motivo (
    ftsm_id integer NOT NULL,
    ftsm_dsfatsitmotivo character(50) NOT NULL,
    ftsm_icuso smallint NOT NULL,
    ftsm_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_fat_sit_motivo OWNER TO gsan_admin;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 341
-- Name: COLUMN g_fat_sit_motivo.ftsm_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN g_fat_sit_motivo.ftsm_id IS 'Id do Tipo de situacao de faturamento';


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 341
-- Name: COLUMN g_fat_sit_motivo.ftsm_dsfatsitmotivo; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN g_fat_sit_motivo.ftsm_dsfatsitmotivo IS 'Descricao do Tipo de Situacao de Faturamento';


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 341
-- Name: COLUMN g_fat_sit_motivo.ftsm_icuso; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN g_fat_sit_motivo.ftsm_icuso IS 'Indicador de uso';


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 341
-- Name: COLUMN g_fat_sit_motivo.ftsm_tmultimaalteracao; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN g_fat_sit_motivo.ftsm_tmultimaalteracao IS 'Dia e Hora da Ultima Ataualizacao';


--
-- TOC entry 342 (class 1259 OID 848519)
-- Name: g_faturamento_grupo; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_faturamento_grupo (
    ftgr_id integer NOT NULL,
    ftgr_dsfaturamentogrupo character varying(25) NOT NULL,
    ftgr_dsabreviado character(3) NOT NULL,
    ftgr_icuso smallint,
    ftgr_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    ftgr_amreferencia integer,
    ftgr_nndiavencimento smallint,
    ftgr_icvencimentomesfatura smallint NOT NULL
);


ALTER TABLE g_faturamento_grupo OWNER TO gsan_admin;

--
-- TOC entry 343 (class 1259 OID 848527)
-- Name: g_faturamento_situacao_tipo; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_faturamento_situacao_tipo (
    ftst_id integer NOT NULL,
    ftst_dsfaturamentosituacaotipo character varying(50),
    ftst_icfaturamentoparalisacao smallint,
    ftst_icleituraparalisacao smallint,
    ftst_icuso smallint,
    ftst_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    lacs_idconsumoacobrarsemleitura integer NOT NULL,
    lacs_idconsumoacobrarcomleitura integer NOT NULL,
    lalt_idleituraafaturarsemleitura integer NOT NULL,
    lalt_idleituraafaturarcomleitura integer NOT NULL,
    ftst_icfaturamentoparalisacaoesgoto smallint DEFAULT 2 NOT NULL,
    ftst_icvalidoagua smallint DEFAULT 2 NOT NULL,
    ftst_icvalidoesgoto smallint DEFAULT 2 NOT NULL,
    ftst_icinformarconsumo smallint DEFAULT 2 NOT NULL,
    ftst_icinformarvolume smallint DEFAULT 2 NOT NULL,
    CONSTRAINT ck1_g_faturamento_situacao_tipo CHECK ((ftst_icvalidoagua = ANY (ARRAY[1, 2]))),
    CONSTRAINT ck2_g_faturamento_situacao_tipo CHECK ((ftst_icvalidoesgoto = ANY (ARRAY[1, 2])))
);


ALTER TABLE g_faturamento_situacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 343
-- Name: COLUMN g_faturamento_situacao_tipo.ftst_icinformarconsumo; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN g_faturamento_situacao_tipo.ftst_icinformarconsumo IS 'Indicador se e para informar o consumo fixo.';


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 343
-- Name: COLUMN g_faturamento_situacao_tipo.ftst_icinformarvolume; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN g_faturamento_situacao_tipo.ftst_icinformarvolume IS 'Indicador se e para informar o volume fixo.';


--
-- TOC entry 344 (class 1259 OID 848538)
-- Name: g_imposto_tipo; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_imposto_tipo (
    imtp_id integer NOT NULL,
    imtp_dsimposto character varying(50) NOT NULL,
    imtp_dsabreviadaimposto character varying(10) NOT NULL,
    imtp_icuso smallint NOT NULL,
    imtp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_imposto_tipo OWNER TO gsan_admin;

--
-- TOC entry 345 (class 1259 OID 848546)
-- Name: seq_g_fat_sit_motivo; Type: SEQUENCE; Schema: faturamento; Owner: gsan_admin
--

CREATE SEQUENCE seq_g_fat_sit_motivo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_g_fat_sit_motivo OWNER TO gsan_admin;

--
-- TOC entry 346 (class 1259 OID 848548)
-- Name: seq_un_resumo_faturamento; Type: SEQUENCE; Schema: faturamento; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resumo_faturamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resumo_faturamento OWNER TO gsan_admin;

--
-- TOC entry 347 (class 1259 OID 848550)
-- Name: sequence_un_resumo_indicadores_faturamento_ref_2007; Type: SEQUENCE; Schema: faturamento; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicadores_faturamento_ref_2007
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicadores_faturamento_ref_2007 OWNER TO gsan_admin;

--
-- TOC entry 348 (class 1259 OID 848552)
-- Name: sequence_un_resumo_indicadores_faturamento_ref_2008; Type: SEQUENCE; Schema: faturamento; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicadores_faturamento_ref_2008
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicadores_faturamento_ref_2008 OWNER TO gsan_admin;

--
-- TOC entry 349 (class 1259 OID 848554)
-- Name: sequence_un_resumo_indicadores_faturamento_ref_2009; Type: SEQUENCE; Schema: faturamento; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicadores_faturamento_ref_2009
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicadores_faturamento_ref_2009 OWNER TO gsan_admin;

--
-- TOC entry 350 (class 1259 OID 848556)
-- Name: sequence_un_resumo_refaturamento; Type: SEQUENCE; Schema: faturamento; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_refaturamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_refaturamento OWNER TO gsan_admin;

--
-- TOC entry 351 (class 1259 OID 848558)
-- Name: un_resumo_faturamento; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_faturamento (
    refa_id integer NOT NULL,
    refa_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    rota_id integer NOT NULL,
    qdra_id integer NOT NULL,
    refa_cdsetorcomercial integer NOT NULL,
    refa_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    refa_vofaturadoagua integer NOT NULL,
    refa_vofaturadoesgoto integer NOT NULL,
    refa_vlfaturadoagua numeric(13,2) NOT NULL,
    refa_vlfaturadoesgoto numeric(13,2) NOT NULL,
    refa_qtcontasemitidas integer NOT NULL,
    refa_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    crog_id integer,
    lict_id integer,
    dotp_id integer,
    fntp_id integer,
    refa_vldocsfaturadoscredito numeric(13,2),
    refa_qtdocsfaturadoscredito integer,
    refa_vldocsfaturadosoutros numeric(13,2),
    refa_qtdocsfaturadosoutros smallint,
    empr_id integer NOT NULL,
    refa_vlfinanincluido numeric(13,2),
    refa_vlfinancancelado numeric(13,2),
    refa_qteconomiasfaturadas integer,
    dbtp_id integer,
    crti_id integer,
    refa_ichidrometro integer NOT NULL,
    imtp_id integer,
    refa_vlimposto numeric(13,2),
    cstf_id integer NOT NULL,
    ftgr_id integer NOT NULL,
    refa_cdrota integer,
    refa_vljurosparcelamento numeric(13,2),
    refa_vlcreditoscobindevcan numeric(13,2),
    refa_vldescincondcan numeric(13,2),
    refa_vlguiadevolcancel numeric(13,2),
    refa_vlparcelamentoscan numeric(13,2),
    refa_vlcreditoscobindevinc numeric(13,2),
    refa_vldescincondinc numeric(13,2),
    refa_vlguiadevolincl numeric(13,2)
);


ALTER TABLE un_resumo_faturamento OWNER TO gsan_admin;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vljurosparcelamento; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vljurosparcelamento IS 'Valor de juros de parcelamento';


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vlcreditoscobindevcan; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vlcreditoscobindevcan IS 'Valor de creditos a realizar por cobrancas indevidas cancelados';


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vldescincondcan; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vldescincondcan IS 'Valor de descontos incondicionais cancelados';


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vlguiadevolcancel; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vlguiadevolcancel IS 'Valor de guias de devolucao de valores cobrados indevidamente canceladas';


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vlparcelamentoscan; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vlparcelamentoscan IS 'Valor de parcelamentos cancelados';


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vlcreditoscobindevinc; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vlcreditoscobindevinc IS 'Valor de creditos a realizar por cobrancas indevidas incluidos';


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vldescincondinc; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vldescincondinc IS 'Valor de descontos incondicionais incluidos';


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN un_resumo_faturamento.refa_vlguiadevolincl; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_faturamento.refa_vlguiadevolincl IS 'Valor de guias de devolucao de valores cobrados indevidamente incluidas';


--
-- TOC entry 352 (class 1259 OID 848566)
-- Name: un_resumo_indicadores_faturamento_ref_2007; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicadores_faturamento_ref_2007 (
    refa_id integer DEFAULT nextval('sequence_un_resumo_indicadores_faturamento_ref_2007'::regclass) NOT NULL,
    refa_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    refa_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    crog_id integer,
    lict_id integer,
    dotp_id integer NOT NULL,
    fntp_id integer,
    dbtp_id integer,
    crti_id integer,
    refa_qtcontasemitidas integer NOT NULL,
    rerf_qtcontasretificadas integer NOT NULL,
    rerf_qtcontascanceladas integer NOT NULL,
    rerf_qtcontasincluidas integer NOT NULL,
    refa_qteconomiasfaturadas integer NOT NULL,
    refa_vofaturadoagua integer NOT NULL,
    rerf_vocanceladoagua integer NOT NULL,
    rerf_voincluidoagua integer NOT NULL,
    refa_vofaturadoesgoto integer NOT NULL,
    rerf_vocanceladoesgoto integer NOT NULL,
    rerf_voincluidoesgoto integer NOT NULL,
    refa_vlfaturadoagua numeric(13,2) NOT NULL,
    rerf_vlcanceladoagua numeric(13,2) NOT NULL,
    rerf_vlincluidoagua numeric(13,2) NOT NULL,
    refa_vlfaturadoesgoto numeric(13,2) NOT NULL,
    rerf_vlcanceladoesgoto numeric(13,2) NOT NULL,
    rerf_vlincluidoesgoto numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadoscredito numeric(13,2) NOT NULL,
    rerf_vlcanceladocredito numeric(13,2) NOT NULL,
    rerf_vlincluidocredito numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadosoutros numeric(13,2) NOT NULL,
    rerf_vlcanceladooutros numeric(13,2) NOT NULL,
    rerf_vlincluidooutros numeric(13,2) NOT NULL,
    refa_vlacrescimoimpontualidade numeric(13,2) NOT NULL,
    refa_qtcontasemitidasma integer NOT NULL,
    rerf_qtcontasretificadasma integer NOT NULL,
    rerf_qtcontascanceladasma integer NOT NULL,
    rerf_qtcontasincluidasma integer NOT NULL,
    refa_qteconomiasfaturadasma integer NOT NULL,
    refa_vofaturadoaguama integer NOT NULL,
    rerf_vocanceladoaguama integer NOT NULL,
    rerf_voincluidoaguama integer NOT NULL,
    refa_vofaturadoesgotoma integer NOT NULL,
    rerf_vocanceladoesgotoma integer NOT NULL,
    rerf_voincluidoesgotoma integer NOT NULL,
    refa_vlfaturadoaguama numeric(13,2) NOT NULL,
    rerf_vlcanceladoaguama numeric(13,2) NOT NULL,
    rerf_vlincluidoaguama numeric(13,2) NOT NULL,
    refa_vlfaturadoesgotoma numeric(13,2) NOT NULL,
    rerf_vlcanceladoesgotoma numeric(13,2) NOT NULL,
    rerf_vlincluidoesgotoma numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadoscreditoma numeric(13,2) NOT NULL,
    rerf_vlcanceladocreditoma numeric(13,2) NOT NULL,
    rerf_vlincluidocreditoma numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadosoutrosma numeric(13,2) NOT NULL,
    rerf_vlcanceladooutrosma numeric(13,2) NOT NULL,
    rerf_vlincluidooutrosma numeric(13,2) NOT NULL,
    refa_vlacrescimoimpontualidadema numeric(13,2) NOT NULL,
    refa_vlarrastos numeric(13,2) NOT NULL,
    refa_vlparcelamento numeric(13,2) NOT NULL,
    rerf_qtguiascanceladas integer NOT NULL,
    refa_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE un_resumo_indicadores_faturamento_ref_2007 OWNER TO gsan_admin;

--
-- TOC entry 353 (class 1259 OID 848571)
-- Name: un_resumo_indicadores_faturamento_ref_2008; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicadores_faturamento_ref_2008 (
    refa_id integer DEFAULT nextval('sequence_un_resumo_indicadores_faturamento_ref_2008'::regclass) NOT NULL,
    refa_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    refa_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    crog_id integer,
    lict_id integer,
    dotp_id integer NOT NULL,
    fntp_id integer,
    dbtp_id integer,
    crti_id integer,
    refa_qtcontasemitidas integer NOT NULL,
    rerf_qtcontasretificadas integer NOT NULL,
    rerf_qtcontascanceladas integer NOT NULL,
    rerf_qtcontasincluidas integer NOT NULL,
    refa_qteconomiasfaturadas integer NOT NULL,
    refa_vofaturadoagua integer NOT NULL,
    rerf_vocanceladoagua integer NOT NULL,
    rerf_voincluidoagua integer NOT NULL,
    refa_vofaturadoesgoto integer NOT NULL,
    rerf_vocanceladoesgoto integer NOT NULL,
    rerf_voincluidoesgoto integer NOT NULL,
    refa_vlfaturadoagua numeric(13,2) NOT NULL,
    rerf_vlcanceladoagua numeric(13,2) NOT NULL,
    rerf_vlincluidoagua numeric(13,2) NOT NULL,
    refa_vlfaturadoesgoto numeric(13,2) NOT NULL,
    rerf_vlcanceladoesgoto numeric(13,2) NOT NULL,
    rerf_vlincluidoesgoto numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadoscredito numeric(13,2) NOT NULL,
    rerf_vlcanceladocredito numeric(13,2) NOT NULL,
    rerf_vlincluidocredito numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadosoutros numeric(13,2) NOT NULL,
    rerf_vlcanceladooutros numeric(13,2) NOT NULL,
    rerf_vlincluidooutros numeric(13,2) NOT NULL,
    refa_vlacrescimoimpontualidade numeric(13,2) NOT NULL,
    refa_qtcontasemitidasma integer NOT NULL,
    rerf_qtcontasretificadasma integer NOT NULL,
    rerf_qtcontascanceladasma integer NOT NULL,
    rerf_qtcontasincluidasma integer NOT NULL,
    refa_qteconomiasfaturadasma integer NOT NULL,
    refa_vofaturadoaguama integer NOT NULL,
    rerf_vocanceladoaguama integer NOT NULL,
    rerf_voincluidoaguama integer NOT NULL,
    refa_vofaturadoesgotoma integer NOT NULL,
    rerf_vocanceladoesgotoma integer NOT NULL,
    rerf_voincluidoesgotoma integer NOT NULL,
    refa_vlfaturadoaguama numeric(13,2) NOT NULL,
    rerf_vlcanceladoaguama numeric(13,2) NOT NULL,
    rerf_vlincluidoaguama numeric(13,2) NOT NULL,
    refa_vlfaturadoesgotoma numeric(13,2) NOT NULL,
    rerf_vlcanceladoesgotoma numeric(13,2) NOT NULL,
    rerf_vlincluidoesgotoma numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadoscreditoma numeric(13,2) NOT NULL,
    rerf_vlcanceladocreditoma numeric(13,2) NOT NULL,
    rerf_vlincluidocreditoma numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadosoutrosma numeric(13,2) NOT NULL,
    rerf_vlcanceladooutrosma numeric(13,2) NOT NULL,
    rerf_vlincluidooutrosma numeric(13,2) NOT NULL,
    refa_vlacrescimoimpontualidadema numeric(13,2) NOT NULL,
    refa_vlarrastos numeric(13,2) NOT NULL,
    refa_vlparcelamento numeric(13,2) NOT NULL,
    rerf_qtguiascanceladas integer NOT NULL,
    refa_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    scat_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL
);


ALTER TABLE un_resumo_indicadores_faturamento_ref_2008 OWNER TO gsan_admin;

--
-- TOC entry 354 (class 1259 OID 848576)
-- Name: un_resumo_indicadores_faturamento_ref_2009; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicadores_faturamento_ref_2009 (
    refa_id integer DEFAULT nextval('sequence_un_resumo_indicadores_faturamento_ref_2009'::regclass) NOT NULL,
    refa_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    refa_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    crog_id integer,
    lict_id integer,
    dotp_id integer NOT NULL,
    fntp_id integer,
    dbtp_id integer,
    crti_id integer,
    refa_qtcontasemitidas integer NOT NULL,
    rerf_qtcontasretificadas integer NOT NULL,
    rerf_qtcontascanceladas integer NOT NULL,
    rerf_qtcontasincluidas integer NOT NULL,
    refa_qteconomiasfaturadas integer NOT NULL,
    refa_vofaturadoagua integer NOT NULL,
    rerf_vocanceladoagua integer NOT NULL,
    rerf_voincluidoagua integer NOT NULL,
    refa_vofaturadoesgoto integer NOT NULL,
    rerf_vocanceladoesgoto integer NOT NULL,
    rerf_voincluidoesgoto integer NOT NULL,
    refa_vlfaturadoagua numeric(13,2) NOT NULL,
    rerf_vlcanceladoagua numeric(13,2) NOT NULL,
    rerf_vlincluidoagua numeric(13,2) NOT NULL,
    refa_vlfaturadoesgoto numeric(13,2) NOT NULL,
    rerf_vlcanceladoesgoto numeric(13,2) NOT NULL,
    rerf_vlincluidoesgoto numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadoscredito numeric(13,2) NOT NULL,
    rerf_vlcanceladocredito numeric(13,2) NOT NULL,
    rerf_vlincluidocredito numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadosoutros numeric(13,2) NOT NULL,
    rerf_vlcanceladooutros numeric(13,2) NOT NULL,
    rerf_vlincluidooutros numeric(13,2) NOT NULL,
    refa_vlacrescimoimpontualidade numeric(13,2) NOT NULL,
    refa_qtcontasemitidasma integer NOT NULL,
    rerf_qtcontasretificadasma integer NOT NULL,
    rerf_qtcontascanceladasma integer NOT NULL,
    rerf_qtcontasincluidasma integer NOT NULL,
    refa_qteconomiasfaturadasma integer NOT NULL,
    refa_vofaturadoaguama integer NOT NULL,
    rerf_vocanceladoaguama integer NOT NULL,
    rerf_voincluidoaguama integer NOT NULL,
    refa_vofaturadoesgotoma integer NOT NULL,
    rerf_vocanceladoesgotoma integer NOT NULL,
    rerf_voincluidoesgotoma integer NOT NULL,
    refa_vlfaturadoaguama numeric(13,2) NOT NULL,
    rerf_vlcanceladoaguama numeric(13,2) NOT NULL,
    rerf_vlincluidoaguama numeric(13,2) NOT NULL,
    refa_vlfaturadoesgotoma numeric(13,2) NOT NULL,
    rerf_vlcanceladoesgotoma numeric(13,2) NOT NULL,
    rerf_vlincluidoesgotoma numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadoscreditoma numeric(13,2) NOT NULL,
    rerf_vlcanceladocreditoma numeric(13,2) NOT NULL,
    rerf_vlincluidocreditoma numeric(13,2) NOT NULL,
    refa_vldocumentosfaturadosoutrosma numeric(13,2) NOT NULL,
    rerf_vlcanceladooutrosma numeric(13,2) NOT NULL,
    rerf_vlincluidooutrosma numeric(13,2) NOT NULL,
    refa_vlacrescimoimpontualidadema numeric(13,2) NOT NULL,
    refa_vlarrastos numeric(13,2) NOT NULL,
    refa_vlparcelamento numeric(13,2) NOT NULL,
    rerf_qtguiascanceladas integer NOT NULL,
    refa_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    scat_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL
);


ALTER TABLE un_resumo_indicadores_faturamento_ref_2009 OWNER TO gsan_admin;

--
-- TOC entry 355 (class 1259 OID 848581)
-- Name: un_resumo_refaturamento; Type: TABLE; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_refaturamento (
    rerf_id integer NOT NULL,
    rerf_amreferencia integer NOT NULL,
    rerf_amreferenciaconta integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    stcm_id integer NOT NULL,
    rerf_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    crog_id integer,
    lict_id integer,
    dotp_id integer,
    cstf_id integer NOT NULL,
    fntp_id integer,
    dbtp_id integer,
    crtp_id integer,
    rerf_ichidrometro integer NOT NULL,
    rerf_qtcontasretificadas integer NOT NULL,
    rerf_qtcontascanceladas integer NOT NULL,
    rerf_vlcanceladoagua numeric(13,2) NOT NULL,
    rerf_vocanceladoagua integer NOT NULL,
    rerf_vlcanceladoesgoto numeric(13,2) NOT NULL,
    rerf_vocanceladoesgoto integer NOT NULL,
    rerf_vlimpostoscancelados numeric(13,2) NOT NULL,
    rerf_qtcontasincluidas integer NOT NULL,
    rerf_vlincluidoagua numeric(13,2) NOT NULL,
    rerf_voincluidoagua integer NOT NULL,
    rerf_vlincluidoesgoto numeric(13,2) NOT NULL,
    rerf_voincluidoesgoto integer NOT NULL,
    rerf_vlimpostosincluidos numeric(13,2) NOT NULL,
    rerf_vlincluidooutros numeric(10,2) NOT NULL,
    rerf_qtguiasincluidas integer NOT NULL,
    rerf_vlguiasincluidas numeric(13,2) NOT NULL,
    rerf_vlincluidocredito numeric(13,2) NOT NULL,
    rerf_qtguiascanceladas integer NOT NULL,
    rerf_vlcanceladocredito numeric(13,2) NOT NULL,
    rerf_vlcanceladooutros numeric(13,2) NOT NULL,
    rerf_vlguiascanceladas numeric(13,2) NOT NULL,
    rerf_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE un_resumo_refaturamento OWNER TO gsan_admin;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.rerf_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.rerf_id IS 'Chave primaria da tabela';


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.rerf_amreferencia; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.rerf_amreferencia IS 'Ano/Mês de Referência';


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.rerf_amreferenciaconta; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.rerf_amreferenciaconta IS 'Ano/Mês da Conta';


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.greg_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.greg_id IS 'Id da Gerencia Regional';


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.uneg_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.uneg_id IS 'Id da Unidade d eNegocio';


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.loca_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.loca_id IS 'Id da Localidade';


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.stcm_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.stcm_id IS 'Id do Setor Comercial';


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.rerf_cdsetorcomercial; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.rerf_cdsetorcomercial IS 'Código do Setor Comercial ';


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.iper_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.iper_id IS 'Id do Perfil do Imovel';


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.last_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.last_id IS 'Id da Situação da Lig. Agua';


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.lest_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.lest_id IS 'Id da Situação da Lig. Esgoto';


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.catg_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.catg_id IS 'Id da Categoria';


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.scat_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.scat_id IS 'Id da Subcategoria';


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.epod_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.epod_id IS 'Id da Esfera de Poder';


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.cltp_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.cltp_id IS 'Id do Tipo de Cliente';


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.lapf_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.lapf_id IS 'Id do Perfil da Lig. Agua';


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.lepf_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.lepf_id IS 'Id do Perfil da Lig. Esgoto';


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.crog_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.crog_id IS 'Id da Origem do Crédito';


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.lict_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.lict_id IS 'Id da Linha de Credito';


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.dotp_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.dotp_id IS 'Id do Tipo de Documento';


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.cstf_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.cstf_id IS 'Id da Tarifa de Consumo';


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.fntp_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.fntp_id IS 'Id do Tipo de Financiamento';


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.dbtp_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.dbtp_id IS 'Id do Tipo de Débito';


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.crtp_id; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.crtp_id IS 'Id do Tipo de Criterio de Cobranca';


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.rerf_ichidrometro; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.rerf_ichidrometro IS 'Indicador de existência de Hidrômetro na Ligacacao';


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.rerf_qtcontasretificadas; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.rerf_qtcontasretificadas IS 'Total de Contas RETIFICADAS';


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN un_resumo_refaturamento.rerf_qtcontascanceladas; Type: COMMENT; Schema: faturamento; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_refaturamento.rerf_qtcontascanceladas IS 'Total de Contas CANCELADAS';


--
-- TOC entry 356 (class 1259 OID 848587)
-- Name: vw_consumo_tarifa; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_consumo_tarifa AS
 SELECT table1.cstf_id,
    table1.cstf_dsconsumotarifa,
    table1.cstf_icuso,
    table1.cstf_tmultimaalteracao,
    table1.lapf_id,
    table1.ttpc_id
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.consumo_tarifa '::text) table1(cstf_id integer, cstf_dsconsumotarifa character varying(30), cstf_icuso smallint, cstf_tmultimaalteracao timestamp without time zone, lapf_id smallint, ttpc_id integer);


ALTER TABLE vw_consumo_tarifa OWNER TO gsan_admin;

--
-- TOC entry 357 (class 1259 OID 848591)
-- Name: vw_credito_origem; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_credito_origem AS
 SELECT table1.crog_id,
    table1.crog_dscreditoorigem,
    table1.crog_dsabreviado,
    table1.crog_icuso,
    table1.crog_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.credito_origem'::text) table1(crog_id integer, crog_dscreditoorigem character varying(40), crog_dsabreviado character varying(10), crog_icuso smallint, crog_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_credito_origem OWNER TO gsan_admin;

--
-- TOC entry 358 (class 1259 OID 848595)
-- Name: vw_credito_tipo; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_credito_tipo AS
 SELECT table1.crti_id,
    table1.lict_id,
    table1.crti_dscreditotipo,
    table1.crti_dsabreviado,
    table1.crti_icuso,
    table1.crti_tmultimaalteracao,
    table1.crti_vllimite,
    table1.crti_icgeracaoautomatica,
    table1.crtp_nncodigoconstante
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.credito_tipo'::text) table1(crti_id integer, lict_id integer, crti_dscreditotipo character varying(30), crti_dsabreviado character varying(18), crti_icuso smallint, crti_tmultimaalteracao timestamp without time zone, crti_vllimite numeric(13,2), crti_icgeracaoautomatica smallint, crtp_nncodigoconstante integer);


ALTER TABLE vw_credito_tipo OWNER TO gsan_admin;

--
-- TOC entry 359 (class 1259 OID 848599)
-- Name: vw_debito_tipo; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_debito_tipo AS
 SELECT table1.dbtp_id,
    table1.lict_id,
    table1.dbtp_dsdebitotipo,
    table1.dbtp_dsabreviado,
    table1.dbtp_icuso,
    table1.dbtp_tmultimaalteracao,
    table1.fntp_id,
    table1.dbtp_vllimite,
    table1.dbtp_icgeracaoautomatica,
    table1.dbtp_icgeracaoconta,
    table1.dbtp_vlsugerido,
    table1.dbtp_valorlimiteinferior,
    table1.dbtp_nncodigoconstante,
    table1.dbtp_iccartaocredito,
    table1.cnct_id,
    table1.dbtp_icguiajurosctrparcel
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.debito_tipo'::text) table1(dbtp_id integer, lict_id integer, dbtp_dsdebitotipo character varying(30), dbtp_dsabreviado character varying(18), dbtp_icuso smallint, dbtp_tmultimaalteracao timestamp without time zone, fntp_id integer, dbtp_vllimite numeric(13,2), dbtp_icgeracaoautomatica smallint, dbtp_icgeracaoconta smallint, dbtp_vlsugerido numeric(13,2), dbtp_valorlimiteinferior numeric(13,2), dbtp_nncodigoconstante integer, dbtp_iccartaocredito smallint, cnct_id integer, dbtp_icguiajurosctrparcel smallint);


ALTER TABLE vw_debito_tipo OWNER TO gsan_admin;

--
-- TOC entry 360 (class 1259 OID 848603)
-- Name: vw_faturamento_grupo; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_faturamento_grupo AS
 SELECT table1.ftgr_id,
    table1.ftgr_dsfaturamentogrupo,
    table1.ftgr_dsabreviado,
    table1.ftgr_icuso,
    table1.ftgr_tmultimaalteracao,
    table1.ftgr_amreferencia,
    table1.ftgr_nndiavencimento,
    table1.ftgr_icvencimentomesfatura
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.faturamento_grupo'::text) table1(ftgr_id integer, ftgr_dsfaturamentogrupo character varying(25), ftgr_dsabreviado character(3), ftgr_icuso smallint, ftgr_tmultimaalteracao timestamp without time zone, ftgr_amreferencia integer, ftgr_nndiavencimento smallint, ftgr_icvencimentomesfatura smallint);


ALTER TABLE vw_faturamento_grupo OWNER TO gsan_admin;

--
-- TOC entry 361 (class 1259 OID 848607)
-- Name: vw_faturamento_situacao_motivo; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_faturamento_situacao_motivo AS
 SELECT table1.ftsm_id,
    table1.ftsm_dsfatsitmotivo,
    table1.ftsm_icuso,
    table1.ftsm_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.faturamento_situacao_motivo'::text) table1(ftsm_id integer, ftsm_dsfatsitmotivo character varying(50), ftsm_icuso smallint, ftsm_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_faturamento_situacao_motivo OWNER TO gsan_admin;

--
-- TOC entry 362 (class 1259 OID 848611)
-- Name: vw_faturamento_situacao_tipo; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_faturamento_situacao_tipo AS
 SELECT table1.ftst_id,
    table1.ftst_dsfaturamentosituacaotipo,
    table1.ftst_icfaturamentoparalisacao,
    table1.ftst_icleituraparalisacao,
    table1.ftst_icuso,
    table1.ftst_tmultimaalteracao,
    table1.lacs_idconsumoacobrarsemleitura,
    table1.lacs_idconsumoacobrarcomleitura,
    table1.lalt_idleituraafaturarsemleitura,
    table1.lalt_idleituraafaturarcomleitura,
    table1.ftst_icfaturamentoparalisacaoesgoto,
    table1.ftst_icvalidoagua,
    table1.ftst_icvalidoesgoto,
    table1.ftst_icinformarconsumo,
    table1.ftst_icinformarvolume
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.faturamento_situacao_tipo'::text) table1(ftst_id integer, ftst_dsfaturamentosituacaotipo character varying(50), ftst_icfaturamentoparalisacao smallint, ftst_icleituraparalisacao smallint, ftst_icuso smallint, ftst_tmultimaalteracao timestamp without time zone, lacs_idconsumoacobrarsemleitura integer, lacs_idconsumoacobrarcomleitura integer, lalt_idleituraafaturarsemleitura integer, lalt_idleituraafaturarcomleitura integer, ftst_icfaturamentoparalisacaoesgoto smallint, ftst_icvalidoagua smallint, ftst_icvalidoesgoto smallint, ftst_icinformarconsumo smallint, ftst_icinformarvolume smallint);


ALTER TABLE vw_faturamento_situacao_tipo OWNER TO gsan_admin;

--
-- TOC entry 363 (class 1259 OID 848615)
-- Name: vw_imposto_tipo; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_imposto_tipo AS
 SELECT table1.imtp_id,
    table1.imtp_dsimposto,
    table1.imtp_dsabreviadaimposto,
    table1.imtp_icuso,
    table1.imtp_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from faturamento.imposto_tipo'::text) table1(imtp_id integer, imtp_dsimposto character varying(50), imtp_dsabreviadaimposto character varying(10), imtp_icuso smallint, imtp_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_imposto_tipo OWNER TO gsan_admin;

--
-- TOC entry 364 (class 1259 OID 848619)
-- Name: vw_un_resumo_faturamento; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_faturamento AS
 SELECT un_resumo_faturamento.refa_id,
    un_resumo_faturamento.refa_amreferencia,
    un_resumo_faturamento.greg_id,
    un_resumo_faturamento.uneg_id,
    un_resumo_faturamento.loca_id,
    un_resumo_faturamento.loca_cdelo,
    un_resumo_faturamento.stcm_id,
    un_resumo_faturamento.rota_id,
    un_resumo_faturamento.qdra_id,
    un_resumo_faturamento.refa_cdsetorcomercial,
    un_resumo_faturamento.refa_nnquadra,
    un_resumo_faturamento.iper_id,
    un_resumo_faturamento.last_id,
    un_resumo_faturamento.lest_id,
    un_resumo_faturamento.catg_id,
    un_resumo_faturamento.scat_id,
    un_resumo_faturamento.epod_id,
    un_resumo_faturamento.cltp_id,
    un_resumo_faturamento.lapf_id,
    un_resumo_faturamento.lepf_id,
    un_resumo_faturamento.refa_vofaturadoagua,
    un_resumo_faturamento.refa_vofaturadoesgoto,
    un_resumo_faturamento.refa_vlfaturadoagua,
    un_resumo_faturamento.refa_vlfaturadoesgoto,
    un_resumo_faturamento.refa_qtcontasemitidas,
    un_resumo_faturamento.refa_tmultimaalteracao,
    un_resumo_faturamento.crog_id,
    ( SELECT li.lict_dsitemlancamentocontabil
           FROM financeiro.g_lancamento_item_contabil li
          WHERE (li.lict_id = un_resumo_faturamento.lict_id)) AS descricaoitemcontabil,
    un_resumo_faturamento.dotp_id,
    un_resumo_faturamento.fntp_id,
    un_resumo_faturamento.refa_vldocsfaturadoscredito AS refa_vldocumentosfaturadoscredito,
    un_resumo_faturamento.refa_qtdocsfaturadoscredito AS refa_qtdocumentosfaturadoscredito,
    un_resumo_faturamento.refa_vldocsfaturadosoutros AS refa_vldocumentosfaturadosoutros,
    un_resumo_faturamento.refa_qtdocsfaturadosoutros AS refa_qtdocumentosfaturadosoutros,
    un_resumo_faturamento.empr_id,
    un_resumo_faturamento.refa_vlfinanincluido,
    un_resumo_faturamento.refa_vlfinancancelado,
    un_resumo_faturamento.refa_qteconomiasfaturadas,
    ( SELECT dt.dbtp_dsdebitotipo
           FROM g_debito_tipo dt
          WHERE (dt.dbtp_id = un_resumo_faturamento.dbtp_id)) AS descricaodebitotipo,
    ( SELECT ct.crti_dscreditotipo
           FROM g_credito_tipo ct
          WHERE (ct.crti_id = un_resumo_faturamento.crti_id)) AS descricaocreditotipo,
    un_resumo_faturamento.refa_ichidrometro,
    un_resumo_faturamento.imtp_id,
    un_resumo_faturamento.refa_vlimposto
   FROM un_resumo_faturamento;


ALTER TABLE vw_un_resumo_faturamento OWNER TO gsan_admin;

--
-- TOC entry 365 (class 1259 OID 848624)
-- Name: vw_un_resumo_faturamento_agua_esgoto; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_faturamento_agua_esgoto AS
 SELECT a.refa_id,
    a.refa_amreferencia,
    substr((a.refa_amreferencia)::text, 1, 4) AS refa_anoreferencia,
        CASE
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END AS refa_mesreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.refa_cdsetorcomercial,
    a.refa_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    a.crog_id,
    a.lict_id,
    a.dotp_id,
    a.fntp_id,
    a.empr_id,
    a.refa_qtcontasemitidas,
    a.refa_qtcontasemitidas AS refa_qteconomiasfaturadas,
    a.refa_vofaturadoagua,
    a.refa_vofaturadoesgoto,
    a.refa_vlfaturadoagua,
    a.refa_vlfaturadoesgoto,
    a.refa_vldocsfaturadoscredito AS refa_vldocumentosfaturadoscredito,
    a.refa_vldocsfaturadosoutros AS refa_vldocumentosfaturadosoutros,
        CASE
            WHEN (a.lict_id = 2) THEN b.refa_vldocsfaturadosoutros
            ELSE (0)::numeric
        END AS refa_vlacrescimoimpontualidade,
    b.refa_qtcontasemitidas AS refa_qtcontasemitidasma,
    b.refa_qtcontasemitidas AS refa_qteconomiasfaturadasma,
    b.refa_vofaturadoagua AS refa_vofaturadoaguama,
    b.refa_vofaturadoesgoto AS refa_vofaturadoesgotoma,
    b.refa_vlfaturadoagua AS refa_vlfaturadoaguama,
    b.refa_vlfaturadoesgoto AS refa_vlfaturadoesgotoma,
    b.refa_vldocsfaturadoscredito AS refa_vldocumentosfaturadoscreditoma,
    b.refa_vldocsfaturadosoutros AS refa_vldocumentosfaturadosoutrosma,
        CASE
            WHEN (a.fntp_id = ANY (ARRAY[5, 6, 7])) THEN (a.refa_vlfinanincluido - a.refa_vlfinancancelado)
            ELSE (0)::numeric
        END AS refa_vlarrastos,
        CASE
            WHEN (a.fntp_id <> ALL (ARRAY[1, 5, 6, 7, 10])) THEN (a.refa_vlfinanincluido - a.refa_vlfinancancelado)
            ELSE (0)::numeric
        END AS refa_vlparcelamento,
    a.refa_tmultimaalteracao
   FROM (un_resumo_faturamento a
     LEFT JOIN un_resumo_faturamento b ON ((((((((((((((((((((((((
        CASE substr((a.refa_amreferencia)::text, 5, 2)
            WHEN '1'::text THEN ((a.refa_amreferencia - 89) = b.refa_amreferencia)
            ELSE ((a.refa_amreferencia - 1) = b.refa_amreferencia)
        END AND (a.greg_id = b.greg_id)) AND (a.uneg_id = b.uneg_id)) AND (a.loca_id = b.loca_id)) AND (a.loca_cdelo = b.loca_cdelo)) AND (a.stcm_id = b.stcm_id)) AND (a.qdra_id = b.qdra_id)) AND (a.rota_id = b.rota_id)) AND (a.refa_cdsetorcomercial = b.refa_cdsetorcomercial)) AND (a.refa_nnquadra = b.refa_nnquadra)) AND (a.iper_id = b.iper_id)) AND (a.last_id = b.last_id)) AND (a.lest_id = b.lest_id)) AND (a.catg_id = b.catg_id)) AND (a.scat_id = b.scat_id)) AND (a.epod_id = b.epod_id)) AND (a.cltp_id = b.cltp_id)) AND (a.lapf_id = b.lapf_id)) AND (a.lepf_id = b.lepf_id)) AND (a.crog_id = b.crog_id)) AND (a.lict_id = b.lict_id)) AND (a.dotp_id = b.dotp_id)) AND (a.fntp_id = b.fntp_id)) AND (a.empr_id = b.empr_id))));


ALTER TABLE vw_un_resumo_faturamento_agua_esgoto OWNER TO gsan_admin;

--
-- TOC entry 366 (class 1259 OID 848629)
-- Name: vw_un_resumo_faturamento_mes_anterior; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_faturamento_mes_anterior AS
 SELECT a.refa_id,
        CASE substr((a.refa_amreferencia)::text, 5, 2)
            WHEN '12'::text THEN (a.refa_amreferencia + 89)
            ELSE (a.refa_amreferencia + 1)
        END AS refa_amreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.refa_cdsetorcomercial,
    a.refa_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    a.crog_id,
    a.lict_id,
    a.dotp_id,
    a.fntp_id,
    a.empr_id,
    a.dbtp_id,
    a.crti_id,
    a.imtp_id,
    a.cstf_id,
    a.ftgr_id,
    a.refa_ichidrometro,
    a.refa_qtcontasemitidas,
    a.refa_qteconomiasfaturadas,
    a.refa_vofaturadoagua,
    a.refa_vofaturadoesgoto,
    a.refa_vlfaturadoagua,
    a.refa_vlfaturadoesgoto,
    a.refa_vldocsfaturadoscredito AS refa_vldocumentosfaturadoscredito,
    a.refa_vldocsfaturadosoutros AS refa_vldocumentosfaturadosoutros,
    a.refa_vlimposto,
        CASE
            WHEN (a.lict_id = 2) THEN a.refa_vldocsfaturadosoutros
            ELSE (0)::numeric
        END AS refa_vlacrescimoimpontualidade,
        CASE
            WHEN (a.fntp_id = ANY (ARRAY[5, 6, 7])) THEN (a.refa_vlfinanincluido - a.refa_vlfinancancelado)
            ELSE (0)::numeric
        END AS refa_vlarrastos,
        CASE
            WHEN (a.fntp_id <> ALL (ARRAY[1, 5, 6, 7, 10])) THEN (a.refa_vlfinanincluido - a.refa_vlfinancancelado)
            ELSE (0)::numeric
        END AS refa_vlparcelamento,
    a.refa_tmultimaalteracao
   FROM un_resumo_faturamento a
  WHERE (a.refa_amreferencia < ( SELECT max(un_resumo_faturamento.refa_amreferencia) AS max
           FROM un_resumo_faturamento));


ALTER TABLE vw_un_resumo_faturamento_mes_anterior OWNER TO gsan_admin;

--
-- TOC entry 367 (class 1259 OID 848634)
-- Name: vw_un_resumo_faturamento_ind; Type: VIEW; Schema: faturamento; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_faturamento_ind AS
 SELECT
        CASE
            WHEN (a.refa_amreferencia IS NULL) THEN b.refa_amreferencia
            ELSE a.refa_amreferencia
        END AS refa_amreferencia,
    to_number(
        CASE
            WHEN (a.refa_amreferencia IS NULL) THEN substr((b.refa_amreferencia)::text, 1, 4)
            ELSE substr((a.refa_amreferencia)::text, 1, 4)
        END, (9999)::text) AS refa_anoreferencia,
        CASE
            WHEN (a.refa_amreferencia IS NULL) THEN
            CASE
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
                ELSE ''::text
            END
            ELSE
            CASE
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
                ELSE ''::text
            END
        END AS refa_mesreferencia,
        CASE
            WHEN (a.greg_id IS NULL) THEN b.greg_id
            ELSE a.greg_id
        END AS greg_id,
        CASE
            WHEN (a.uneg_id IS NULL) THEN b.uneg_id
            ELSE a.uneg_id
        END AS uneg_id,
        CASE
            WHEN (a.loca_id IS NULL) THEN b.loca_id
            ELSE a.loca_id
        END AS loca_id,
        CASE
            WHEN (a.loca_cdelo IS NULL) THEN b.loca_cdelo
            ELSE a.loca_cdelo
        END AS loca_cdelo,
        CASE
            WHEN (a.stcm_id IS NULL) THEN b.stcm_id
            ELSE a.stcm_id
        END AS stcm_id,
        CASE
            WHEN (a.qdra_id IS NULL) THEN b.qdra_id
            ELSE a.qdra_id
        END AS qdra_id,
        CASE
            WHEN (a.rota_id IS NULL) THEN b.rota_id
            ELSE a.rota_id
        END AS rota_id,
        CASE
            WHEN (a.refa_cdsetorcomercial IS NULL) THEN b.refa_cdsetorcomercial
            ELSE a.refa_cdsetorcomercial
        END AS refa_cdsetorcomercial,
        CASE
            WHEN (a.refa_nnquadra IS NULL) THEN b.refa_nnquadra
            ELSE a.refa_nnquadra
        END AS refa_nnquadra,
        CASE
            WHEN (a.iper_id IS NULL) THEN b.iper_id
            ELSE a.iper_id
        END AS iper_id,
        CASE
            WHEN (a.last_id IS NULL) THEN b.last_id
            ELSE a.last_id
        END AS last_id,
        CASE
            WHEN (a.lest_id IS NULL) THEN b.lest_id
            ELSE a.lest_id
        END AS lest_id,
        CASE
            WHEN (a.catg_id IS NULL) THEN b.catg_id
            ELSE a.catg_id
        END AS catg_id,
        CASE
            WHEN (a.scat_id IS NULL) THEN b.scat_id
            ELSE a.scat_id
        END AS scat_id,
        CASE
            WHEN (a.epod_id IS NULL) THEN b.epod_id
            ELSE a.epod_id
        END AS epod_id,
        CASE
            WHEN (a.cltp_id IS NULL) THEN b.cltp_id
            ELSE a.cltp_id
        END AS cltp_id,
        CASE
            WHEN (a.lapf_id IS NULL) THEN b.lapf_id
            ELSE a.lapf_id
        END AS lapf_id,
        CASE
            WHEN (a.lepf_id IS NULL) THEN b.lepf_id
            ELSE a.lepf_id
        END AS lepf_id,
        CASE
            WHEN (a.crog_id IS NULL) THEN b.crog_id
            ELSE a.crog_id
        END AS crog_id,
        CASE
            WHEN (a.lict_id IS NULL) THEN b.lict_id
            ELSE a.lict_id
        END AS lict_id,
        CASE
            WHEN (a.dotp_id IS NULL) THEN b.dotp_id
            ELSE a.dotp_id
        END AS dotp_id,
        CASE
            WHEN (a.fntp_id IS NULL) THEN b.fntp_id
            ELSE a.fntp_id
        END AS fntp_id,
        CASE
            WHEN (a.dbtp_id IS NULL) THEN b.dbtp_id
            ELSE a.dbtp_id
        END AS dbtp_id,
        CASE
            WHEN (a.crti_id IS NULL) THEN b.crti_id
            ELSE a.crti_id
        END AS crti_id,
    sum(
        CASE
            WHEN (a.refa_qtcontasemitidas IS NULL) THEN 0
            ELSE a.refa_qtcontasemitidas
        END) AS refa_qtcontasemitidas,
    sum(
        CASE
            WHEN (a.refa_qteconomiasfaturadas IS NULL) THEN 0
            ELSE a.refa_qteconomiasfaturadas
        END) AS refa_qteconomiasfaturadas,
    sum(
        CASE
            WHEN (a.refa_vofaturadoagua IS NULL) THEN 0
            ELSE a.refa_vofaturadoagua
        END) AS refa_vofaturadoagua,
    sum(
        CASE
            WHEN (a.refa_vofaturadoesgoto IS NULL) THEN 0
            ELSE a.refa_vofaturadoesgoto
        END) AS refa_vofaturadoesgoto,
    sum(
        CASE
            WHEN (a.refa_vlfaturadoagua IS NULL) THEN (0)::numeric
            ELSE a.refa_vlfaturadoagua
        END) AS refa_vlfaturadoagua,
    sum(
        CASE
            WHEN (a.refa_vlfaturadoesgoto IS NULL) THEN (0)::numeric
            ELSE a.refa_vlfaturadoesgoto
        END) AS refa_vlfaturadoesgoto,
    sum(
        CASE
            WHEN (a.refa_vldocsfaturadoscredito IS NULL) THEN (0)::numeric
            ELSE a.refa_vldocsfaturadoscredito
        END) AS refa_vldocumentosfaturadoscredito,
    sum(
        CASE
            WHEN (a.refa_vldocsfaturadosoutros IS NULL) THEN (0)::numeric
            ELSE a.refa_vldocsfaturadosoutros
        END) AS refa_vldocumentosfaturadosoutros,
    sum(
        CASE
            WHEN (a.refa_vlimposto IS NULL) THEN (0)::numeric
            ELSE a.refa_vlimposto
        END) AS refa_vlimposto,
    sum(
        CASE
            WHEN (a.lict_id = 2) THEN a.refa_vldocsfaturadosoutros
            ELSE (0)::numeric
        END) AS refa_vlacrescimoimpontualidade,
    sum(
        CASE
            WHEN (b.refa_qtcontasemitidas IS NULL) THEN 0
            ELSE b.refa_qtcontasemitidas
        END) AS refa_qtcontasemitidasma,
    sum(
        CASE
            WHEN (b.refa_qteconomiasfaturadas IS NULL) THEN 0
            ELSE b.refa_qteconomiasfaturadas
        END) AS refa_qteconomiasfaturadasma,
    sum(
        CASE
            WHEN (b.refa_vofaturadoagua IS NULL) THEN 0
            ELSE b.refa_vofaturadoagua
        END) AS refa_vofaturadoaguama,
    sum(
        CASE
            WHEN (b.refa_vofaturadoesgoto IS NULL) THEN 0
            ELSE b.refa_vofaturadoesgoto
        END) AS refa_vofaturadoesgotoma,
    sum(
        CASE
            WHEN (b.refa_vlfaturadoagua IS NULL) THEN (0)::numeric
            ELSE b.refa_vlfaturadoagua
        END) AS refa_vlfaturadoaguama,
    sum(
        CASE
            WHEN (b.refa_vlfaturadoesgoto IS NULL) THEN (0)::numeric
            ELSE b.refa_vlfaturadoesgoto
        END) AS refa_vlfaturadoesgotoma,
    sum(
        CASE
            WHEN (b.refa_vldocumentosfaturadoscredito IS NULL) THEN (0)::numeric
            ELSE b.refa_vldocumentosfaturadoscredito
        END) AS refa_vldocumentosfaturadoscreditoma,
    sum(
        CASE
            WHEN (b.refa_vldocumentosfaturadosoutros IS NULL) THEN (0)::numeric
            ELSE b.refa_vldocumentosfaturadosoutros
        END) AS refa_vldocumentosfaturadosoutrosma,
    sum(
        CASE
            WHEN (b.refa_vlimposto IS NULL) THEN (0)::numeric
            ELSE b.refa_vlimposto
        END) AS refa_vlimpostoma,
    sum(
        CASE
            WHEN (b.lict_id = 2) THEN b.refa_vldocumentosfaturadosoutros
            ELSE (0)::numeric
        END) AS refa_vlacrescimoimpontualidadema,
    sum(
        CASE
            WHEN (a.fntp_id = ANY (ARRAY[5, 6, 7])) THEN (a.refa_vlfinanincluido - a.refa_vlfinancancelado)
            ELSE (0)::numeric
        END) AS refa_vlarrastos,
    sum(
        CASE
            WHEN (a.fntp_id <> ALL (ARRAY[1, 5, 6, 7, 10])) THEN (a.refa_vlfinanincluido - a.refa_vlfinancancelado)
            ELSE (0)::numeric
        END) AS refa_vlparcelamento
   FROM (un_resumo_faturamento a
     FULL JOIN vw_un_resumo_faturamento_mes_anterior b ON (((((((((((((((((((((((((((((((a.refa_amreferencia = b.refa_amreferencia) AND (a.greg_id = b.greg_id)) AND (a.uneg_id = b.uneg_id)) AND (a.loca_id = b.loca_id)) AND (a.loca_cdelo = b.loca_cdelo)) AND (a.stcm_id = b.stcm_id)) AND (a.qdra_id = b.qdra_id)) AND (a.rota_id = b.rota_id)) AND (a.refa_cdsetorcomercial = b.refa_cdsetorcomercial)) AND (a.refa_nnquadra = b.refa_nnquadra)) AND (a.iper_id = b.iper_id)) AND (a.last_id = b.last_id)) AND (a.lest_id = b.lest_id)) AND (a.catg_id = b.catg_id)) AND (a.scat_id = b.scat_id)) AND (a.epod_id = b.epod_id)) AND (a.cltp_id = b.cltp_id)) AND (a.lapf_id = b.lapf_id)) AND (a.lepf_id = b.lepf_id)) AND (a.crog_id = b.crog_id)) AND (a.lict_id = b.lict_id)) AND (a.dotp_id = b.dotp_id)) AND (a.fntp_id = b.fntp_id)) AND (a.empr_id = b.empr_id)) AND (a.dbtp_id = b.dbtp_id)) AND (a.crti_id = b.crti_id)) AND (a.imtp_id = b.imtp_id)) AND (a.cstf_id = b.cstf_id)) AND (a.ftgr_id = b.ftgr_id)) AND (a.refa_ichidrometro = b.refa_ichidrometro))))
  GROUP BY
        CASE
            WHEN (a.refa_amreferencia IS NULL) THEN b.refa_amreferencia
            ELSE a.refa_amreferencia
        END, to_number(
        CASE
            WHEN (a.refa_amreferencia IS NULL) THEN substr((b.refa_amreferencia)::text, 1, 4)
            ELSE substr((a.refa_amreferencia)::text, 1, 4)
        END, (9999)::text),
        CASE
            WHEN (a.refa_amreferencia IS NULL) THEN
            CASE
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
                WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
                ELSE ''::text
            END
            ELSE
            CASE
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
                WHEN (substr((a.refa_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
                ELSE ''::text
            END
        END,
        CASE
            WHEN (a.greg_id IS NULL) THEN b.greg_id
            ELSE a.greg_id
        END,
        CASE
            WHEN (a.uneg_id IS NULL) THEN b.uneg_id
            ELSE a.uneg_id
        END,
        CASE
            WHEN (a.loca_id IS NULL) THEN b.loca_id
            ELSE a.loca_id
        END,
        CASE
            WHEN (a.loca_cdelo IS NULL) THEN b.loca_cdelo
            ELSE a.loca_cdelo
        END,
        CASE
            WHEN (a.stcm_id IS NULL) THEN b.stcm_id
            ELSE a.stcm_id
        END,
        CASE
            WHEN (a.qdra_id IS NULL) THEN b.qdra_id
            ELSE a.qdra_id
        END,
        CASE
            WHEN (a.rota_id IS NULL) THEN b.rota_id
            ELSE a.rota_id
        END,
        CASE
            WHEN (a.refa_cdsetorcomercial IS NULL) THEN b.refa_cdsetorcomercial
            ELSE a.refa_cdsetorcomercial
        END,
        CASE
            WHEN (a.refa_nnquadra IS NULL) THEN b.refa_nnquadra
            ELSE a.refa_nnquadra
        END,
        CASE
            WHEN (a.iper_id IS NULL) THEN b.iper_id
            ELSE a.iper_id
        END,
        CASE
            WHEN (a.last_id IS NULL) THEN b.last_id
            ELSE a.last_id
        END,
        CASE
            WHEN (a.lest_id IS NULL) THEN b.lest_id
            ELSE a.lest_id
        END,
        CASE
            WHEN (a.catg_id IS NULL) THEN b.catg_id
            ELSE a.catg_id
        END,
        CASE
            WHEN (a.scat_id IS NULL) THEN b.scat_id
            ELSE a.scat_id
        END,
        CASE
            WHEN (a.epod_id IS NULL) THEN b.epod_id
            ELSE a.epod_id
        END,
        CASE
            WHEN (a.cltp_id IS NULL) THEN b.cltp_id
            ELSE a.cltp_id
        END,
        CASE
            WHEN (a.lapf_id IS NULL) THEN b.lapf_id
            ELSE a.lapf_id
        END,
        CASE
            WHEN (a.lepf_id IS NULL) THEN b.lepf_id
            ELSE a.lepf_id
        END,
        CASE
            WHEN (a.crog_id IS NULL) THEN b.crog_id
            ELSE a.crog_id
        END,
        CASE
            WHEN (a.lict_id IS NULL) THEN b.lict_id
            ELSE a.lict_id
        END,
        CASE
            WHEN (a.dotp_id IS NULL) THEN b.dotp_id
            ELSE a.dotp_id
        END,
        CASE
            WHEN (a.fntp_id IS NULL) THEN b.fntp_id
            ELSE a.fntp_id
        END,
        CASE
            WHEN (a.dbtp_id IS NULL) THEN b.dbtp_id
            ELSE a.dbtp_id
        END,
        CASE
            WHEN (a.crti_id IS NULL) THEN b.crti_id
            ELSE a.crti_id
        END;


ALTER TABLE vw_un_resumo_faturamento_ind OWNER TO gsan_admin;

SET search_path = financeiro, pg_catalog;

--
-- TOC entry 368 (class 1259 OID 848639)
-- Name: g_financiamento_tipo; Type: TABLE; Schema: financeiro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_financiamento_tipo (
    fntp_id integer NOT NULL,
    fntp_dsfinanciamentotipo character varying(40),
    fntp_dsabreviado character varying(10),
    fntp_icuso smallint,
    fntp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    fntp_icinclusao smallint DEFAULT 2 NOT NULL
);


ALTER TABLE g_financiamento_tipo OWNER TO gsan_admin;

--
-- TOC entry 369 (class 1259 OID 848649)
-- Name: g_lancamento_item; Type: TABLE; Schema: financeiro; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_lancamento_item (
    lcit_id integer NOT NULL,
    lcit_dsitemlancamento character varying(40),
    lcit_dsabreviado character varying(10),
    lcit_icitemcontabil smallint,
    lcit_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_lancamento_item OWNER TO gsan_admin;

--
-- TOC entry 370 (class 1259 OID 848657)
-- Name: vw_financiamento_tipo; Type: VIEW; Schema: financeiro; Owner: gsan_admin
--

CREATE VIEW vw_financiamento_tipo AS
 SELECT table1.fntp_id,
    table1.fntp_dsfinanciamentotipo,
    table1.fntp_dsabreviado,
    table1.fntp_icuso,
    table1.fntp_tmultimaalteracao,
    table1.fntp_icinclusao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from financeiro.financiamento_tipo'::text) table1(fntp_id integer, fntp_dsfinanciamentotipo character varying(40), fntp_dsabreviado character varying(10), fntp_icuso smallint, fntp_tmultimaalteracao timestamp without time zone, fntp_icinclusao smallint);


ALTER TABLE vw_financiamento_tipo OWNER TO gsan_admin;

--
-- TOC entry 371 (class 1259 OID 848661)
-- Name: vw_lancamento_item; Type: VIEW; Schema: financeiro; Owner: gsan_admin
--

CREATE VIEW vw_lancamento_item AS
 SELECT table1.lcit_id,
    table1.lcit_dsitemlancamento,
    table1.lcit_dsabreviado,
    table1.lcit_icitemcontabil,
    table1.lcit_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from financeiro.lancamento_item'::text) table1(lcit_id integer, lcit_dsitemlancamento character varying(40), lcit_dsabreviado character varying(10), lcit_icitemcontabil smallint, lcit_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_lancamento_item OWNER TO gsan_admin;

--
-- TOC entry 372 (class 1259 OID 848665)
-- Name: vw_lancamento_item_contabil; Type: VIEW; Schema: financeiro; Owner: gsan_admin
--

CREATE VIEW vw_lancamento_item_contabil AS
 SELECT table1.lict_id,
    table1.lict_dsitemlancamentocontabil,
    table1.lict_dsabreviado,
    table1.lict_nnsequenciaimpressao,
    table1.lict_tmultimaalteracao,
    table1.lcit_id,
    table1.lict_icuso
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from financeiro.lancamento_item_contabil'::text) table1(lict_id integer, lict_dsitemlancamentocontabil character varying(35), lict_dsabreviado character(5), lict_nnsequenciaimpressao smallint, lict_tmultimaalteracao timestamp without time zone, lcit_id integer, lict_icuso smallint);


ALTER TABLE vw_lancamento_item_contabil OWNER TO gsan_admin;

SET search_path = micromedicao, pg_catalog;

--
-- TOC entry 373 (class 1259 OID 848669)
-- Name: g_consumo_tipo; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_consumo_tipo (
    cstp_id integer NOT NULL,
    cstp_dsconsumotipo character varying(20),
    cstp_dsabreviadaconsumotipo character varying(10),
    cstp_icuso smallint,
    cstp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_consumo_tipo OWNER TO gsan_admin;

--
-- TOC entry 374 (class 1259 OID 848677)
-- Name: g_hidr_classe_metrlg; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidr_classe_metrlg (
    hicm_id integer NOT NULL,
    hicm_dshidrclassemetrologica character varying(20),
    hicm_dsabrvhidmtclassemetl character(5),
    hicm_icuso smallint,
    hicm_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_hidr_classe_metrlg OWNER TO gsan_admin;

--
-- TOC entry 375 (class 1259 OID 848681)
-- Name: g_hidr_local_armaz; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidr_local_armaz (
    hila_id integer NOT NULL,
    hila_dshidrlocalarmazenagem character varying(45),
    hila_dsabrvhidmtlocalarmz character(5),
    hila_icuso smallint,
    hila_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_hidr_local_armaz OWNER TO gsan_admin;

--
-- TOC entry 376 (class 1259 OID 848685)
-- Name: g_hidr_motivo_baixa; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidr_motivo_baixa (
    himb_id integer NOT NULL,
    himb_dshidrometromotivobaixa character varying(20),
    himb_icuso smallint,
    himb_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_hidr_motivo_baixa OWNER TO gsan_admin;

--
-- TOC entry 377 (class 1259 OID 848689)
-- Name: g_hidrometro_capacidade; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidrometro_capacidade (
    hicp_id integer NOT NULL,
    hicp_dshidrometrocapacidade character varying(20),
    hicp_dsabreviadahidrcapacidade character(6),
    hicp_nndigitosleituraminimo smallint,
    hicp_nndigitosleituramaximo smallint,
    hicp_icuso smallint,
    hicp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    hicp_nnordem smallint
);


ALTER TABLE g_hidrometro_capacidade OWNER TO gsan_admin;

--
-- TOC entry 378 (class 1259 OID 848697)
-- Name: g_hidrometro_diametro; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidrometro_diametro (
    hidm_id integer NOT NULL,
    hidm_dshidrometrodiametro character varying(20) NOT NULL,
    hidm_dsabreviadahidrdiametro character(5) NOT NULL,
    hidm_icuso smallint,
    hidm_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    hidm_nnordem smallint
);


ALTER TABLE g_hidrometro_diametro OWNER TO gsan_admin;

--
-- TOC entry 379 (class 1259 OID 848701)
-- Name: g_hidrometro_marca; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidrometro_marca (
    himc_id integer NOT NULL,
    himc_dshidrometromarca character varying(30) NOT NULL,
    himc_dsabreviadahidrmarca character(3) NOT NULL,
    himc_nndiarevisao smallint NOT NULL,
    himc_icuso smallint,
    himc_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_hidrometro_marca OWNER TO gsan_admin;

--
-- TOC entry 380 (class 1259 OID 848705)
-- Name: g_hidrometro_situacao; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidrometro_situacao (
    hist_id integer NOT NULL,
    hist_dshidrometrosituacao character varying(20),
    hist_icuso smallint,
    hist_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_hidrometro_situacao OWNER TO gsan_admin;

--
-- TOC entry 381 (class 1259 OID 848709)
-- Name: g_hidrometro_tipo; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_hidrometro_tipo (
    hitp_id integer NOT NULL,
    hitp_dshidrometrotipo character varying(20) NOT NULL,
    hitp_dcabreviadahidrometrotipo character(5) NOT NULL,
    hitp_icuso smallint,
    hitp_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_hidrometro_tipo OWNER TO gsan_admin;

--
-- TOC entry 382 (class 1259 OID 848713)
-- Name: g_leitura_anormalidade; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_leitura_anormalidade (
    ltan_id integer NOT NULL,
    ltan_dsleituraanormalidade character varying(25) NOT NULL,
    ltan_dsabreviadaleituraanormalidade character(5),
    ltan_icrelativohidrometro smallint NOT NULL,
    ltan_icimovelsemhidrometro smallint,
    ltan_icusosistema smallint,
    ltan_icemissaoordemservico smallint NOT NULL,
    ltan_icuso smallint,
    ltan_icperdatarifasocial smallint,
    ltan_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_leitura_anormalidade OWNER TO gsan_admin;

--
-- TOC entry 383 (class 1259 OID 848717)
-- Name: g_leitura_anormalidade_consumo; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_leitura_anormalidade_consumo (
    lacs_id integer NOT NULL,
    lacs_dsconsumoacobrar character varying(30),
    lacs_icsemleitura smallint,
    lacs_iccomleitura smallint,
    lacs_icuso smallint,
    lacs_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_leitura_anormalidade_consumo OWNER TO gsan_admin;

--
-- TOC entry 384 (class 1259 OID 848721)
-- Name: g_leitura_anormalidade_leitura; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_leitura_anormalidade_leitura (
    lalt_id integer NOT NULL,
    lalt_dsleituraafaturar character varying(30),
    lalt_icsemleitura smallint,
    lalt_iccomleitura smallint,
    lalt_icuso smallint,
    lalt_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_leitura_anormalidade_leitura OWNER TO gsan_admin;

--
-- TOC entry 385 (class 1259 OID 848725)
-- Name: g_leitura_situacao; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_leitura_situacao (
    ltst_id integer NOT NULL,
    ltst_dsleiturasituacao character varying(30),
    ltst_icuso smallint,
    ltst_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_leitura_situacao OWNER TO gsan_admin;

--
-- TOC entry 386 (class 1259 OID 848729)
-- Name: g_medicao_tipo; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_medicao_tipo (
    medt_id integer NOT NULL,
    medt_dsmedicaotipo character varying(25),
    medt_icuso smallint,
    medt_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_medicao_tipo OWNER TO gsan_admin;

--
-- TOC entry 387 (class 1259 OID 848733)
-- Name: g_rota; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_rota (
    rota_id integer NOT NULL,
    rota_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    stcm_id integer NOT NULL,
    rota_cdrota smallint NOT NULL,
    ftgr_id integer
);


ALTER TABLE g_rota OWNER TO gsan_admin;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 387
-- Name: COLUMN g_rota.ftgr_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN g_rota.ftgr_id IS 'id do grupo de faturamento';


--
-- TOC entry 388 (class 1259 OID 848740)
-- Name: seq_un_res_ins_hidr; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_res_ins_hidr
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_res_ins_hidr OWNER TO gsan_admin;

--
-- TOC entry 389 (class 1259 OID 848742)
-- Name: seq_un_res_lt_anorm; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_res_lt_anorm
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_res_lt_anorm OWNER TO gsan_admin;

--
-- TOC entry 390 (class 1259 OID 848744)
-- Name: seq_un_resi_des_mmd; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resi_des_mmd
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resi_des_mmd OWNER TO gsan_admin;

--
-- TOC entry 391 (class 1259 OID 848746)
-- Name: seq_un_resumo_coleta_esgoto; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resumo_coleta_esgoto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resumo_coleta_esgoto OWNER TO gsan_admin;

--
-- TOC entry 392 (class 1259 OID 848748)
-- Name: seq_un_resumo_consumo_agua; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resumo_consumo_agua
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resumo_consumo_agua OWNER TO gsan_admin;

--
-- TOC entry 393 (class 1259 OID 848750)
-- Name: seq_un_resumo_hidrometro; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE seq_un_resumo_hidrometro
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_un_resumo_hidrometro OWNER TO gsan_admin;

--
-- TOC entry 394 (class 1259 OID 848752)
-- Name: sequence_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicador_desempenho_micromedicao_ref_2007
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicador_desempenho_micromedicao_ref_2007 OWNER TO gsan_admin;

--
-- TOC entry 395 (class 1259 OID 848754)
-- Name: sequence_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicador_desempenho_micromedicao_ref_2008
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicador_desempenho_micromedicao_ref_2008 OWNER TO gsan_admin;

--
-- TOC entry 396 (class 1259 OID 848756)
-- Name: sequence_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_indicador_desempenho_micromedicao_ref_2009
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_indicador_desempenho_micromedicao_ref_2009 OWNER TO gsan_admin;

--
-- TOC entry 397 (class 1259 OID 848758)
-- Name: sequence_un_resumo_metas; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_metas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_metas OWNER TO gsan_admin;

--
-- TOC entry 398 (class 1259 OID 848760)
-- Name: sequence_un_resumo_metas_acumulado; Type: SEQUENCE; Schema: micromedicao; Owner: gsan_admin
--

CREATE SEQUENCE sequence_un_resumo_metas_acumulado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sequence_un_resumo_metas_acumulado OWNER TO gsan_admin;

--
-- TOC entry 399 (class 1259 OID 848762)
-- Name: un_res_ins_hidr; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_res_ins_hidr (
    reih_id integer NOT NULL,
    reih_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    reih_cdsetorcomercial integer NOT NULL,
    epod_id integer NOT NULL,
    reih_nnquadra integer NOT NULL,
    cltp_id integer NOT NULL,
    rota_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    reih_qthidr_instalado_ramal integer NOT NULL,
    reih_qthidr_substituido_ramal integer NOT NULL,
    reih_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    reih_qthidr_remanejado_ramal integer NOT NULL,
    reih_qthidr_retirado_ramal integer NOT NULL,
    reih_qthidr_dadosatualizados integer,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    reih_qthidr_instalado_poco integer NOT NULL,
    reih_qthidr_substituido_poco integer NOT NULL,
    reih_qthidr_retirado_poco integer NOT NULL,
    reih_qthidr_remanejado_poco integer NOT NULL,
    reih_qthidratualinstaladoramal integer,
    reih_qthidratualinstaladospoco integer,
    reih_cdrota integer,
    cstf_id integer,
    himc_id integer,
    hitp_id integer,
    hicp_id integer,
    hidm_id integer,
    hicm_id integer
);


ALTER TABLE un_res_ins_hidr OWNER TO gsan_admin;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 399
-- Name: COLUMN un_res_ins_hidr.cstf_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_ins_hidr.cstf_id IS 'Consumo Tarifa';


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 399
-- Name: COLUMN un_res_ins_hidr.himc_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_ins_hidr.himc_id IS 'Marca do Hidrometro';


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 399
-- Name: COLUMN un_res_ins_hidr.hitp_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_ins_hidr.hitp_id IS 'Tipo do Hidrometro';


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 399
-- Name: COLUMN un_res_ins_hidr.hicp_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_ins_hidr.hicp_id IS 'Capacidade do Hidrometro';


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 399
-- Name: COLUMN un_res_ins_hidr.hidm_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_ins_hidr.hidm_id IS 'Diametro do Hidrometro';


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 399
-- Name: COLUMN un_res_ins_hidr.hicm_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_ins_hidr.hicm_id IS 'Classe do Hidrometro';


--
-- TOC entry 400 (class 1259 OID 848766)
-- Name: un_res_lt_anorm; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_res_lt_anorm (
    relt_id integer NOT NULL,
    uneg_id integer NOT NULL,
    relt_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    relt_cdsetorcomercial integer NOT NULL,
    relt_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    rota_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    medt_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    relt_qtleituras integer NOT NULL,
    ltan_id integer NOT NULL,
    relt_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    empr_id integer,
    ltst_id integer,
    cstf_id integer NOT NULL,
    ftgr_id integer NOT NULL,
    relt_cdrota integer,
    ltan_idanormalidadeinformada integer,
    relt_qtleituraseanorminformada integer
);


ALTER TABLE un_res_lt_anorm OWNER TO gsan_admin;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 400
-- Name: COLUMN un_res_lt_anorm.ltan_idanormalidadeinformada; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_lt_anorm.ltan_idanormalidadeinformada IS 'Acumula os cÃ³digos de anormalidades informadas pelo leiturista';


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 400
-- Name: COLUMN un_res_lt_anorm.relt_qtleituraseanorminformada; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_res_lt_anorm.relt_qtleituraseanorminformada IS 'Acumula a quantidade de anormalidades e leituras informadas pelos leituristas';


--
-- TOC entry 401 (class 1259 OID 848770)
-- Name: un_res_mt_acum; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_res_mt_acum (
    rema_id integer NOT NULL,
    rema_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    rota_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rema_cdsetorcomercial integer NOT NULL,
    rema_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rema_cdgruposubcat integer,
    rema_qtligacoescadastradas integer NOT NULL,
    rema_qtligacoescortadas integer NOT NULL,
    rema_qtligacoessuprimidas integer NOT NULL,
    rema_qtligacoesativas integer NOT NULL,
    rema_qtligacoesativasdebito3m integer NOT NULL,
    rema_qtligacoesconsumomedido integer NOT NULL,
    rema_qtligacoesconsumonaomed integer NOT NULL,
    rema_qtligacoesconsumoate5m3 integer NOT NULL,
    rema_qtligacoesconsumomedia integer NOT NULL,
    rema_qteconomias integer NOT NULL,
    rema_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE un_res_mt_acum OWNER TO gsan_admin;

--
-- TOC entry 402 (class 1259 OID 848774)
-- Name: un_resi_des_mmd; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resi_des_mmd (
    reca_id integer DEFAULT nextval('seq_un_resi_des_mmd'::regclass) NOT NULL,
    reca_amreferencia integer NOT NULL,
    reca_anoreferencia integer NOT NULL,
    reca_mesreferencia character(6) NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL,
    reca_cdsetorcomercial integer NOT NULL,
    reca_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    reca_qtligacoes_ativas integer NOT NULL,
    reca_qtligacoes_com_hidrometro integer NOT NULL,
    reca_qtligacoes_com_med_real integer NOT NULL,
    reca_qtlig_com_hidr_e_med_est integer NOT NULL,
    reca_qteconomias_ativas integer NOT NULL,
    reca_qteconomias_com_hidr integer NOT NULL,
    reca_qteconomias_com_med_real integer NOT NULL,
    reca_qtecon_com_hidr_e_med_est integer NOT NULL,
    reca_consumoagua_ativas integer NOT NULL,
    reca_consumoagua_com_hidr integer NOT NULL,
    reca_consumoagua_com_med_real integer NOT NULL,
    reca_cons_ag_com_hidr_med_est integer NOT NULL,
    reca_vofaturadoagua integer NOT NULL,
    reca_vofaturadoaguamedido integer NOT NULL,
    reca_vofaturadoaguanaomedido integer NOT NULL,
    rece_qtligacoes integer NOT NULL,
    rece_qteconomias integer NOT NULL,
    rece_voesgoto integer NOT NULL,
    rece_vofaturadoesgoto integer NOT NULL,
    rece_vofaturadoesgotomedido integer NOT NULL,
    rece_vofaturadoesgotonaomedido integer NOT NULL,
    relt_qtvisitas_realizadas integer NOT NULL,
    relt_qtleituras_efetuadas integer NOT NULL,
    relt_qtleituras_com_anorm_hidr integer NOT NULL,
    reih_qthidr_instalado_ramal integer NOT NULL,
    reih_qthidr_substituido_ramal integer NOT NULL,
    reih_qthidr_remanejado_ramal integer NOT NULL,
    reih_qthidr_retirado_ramal integer NOT NULL,
    reih_qthidratualinstaladoramal integer NOT NULL,
    reih_qthidr_instalado_poco integer NOT NULL,
    reih_qthidr_substituido_poco integer NOT NULL,
    reih_qthidr_remanejado_poco integer NOT NULL,
    reih_qthidr_retirado_poco integer NOT NULL,
    reih_qthidratualinstaladospoco integer NOT NULL,
    reih_qthidr_dadosatualizados integer NOT NULL,
    reca_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE un_resi_des_mmd OWNER TO gsan_admin;

--
-- TOC entry 403 (class 1259 OID 848779)
-- Name: un_resumo_analitico; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_analitico (
    rena_cdmatriculaimovel integer,
    ltan_id integer,
    rena_nmendereco character varying(100),
    rena_cdimovelinscricao character varying(21),
    rena_nnleiturahidrometro integer,
    rena_ammovimento integer,
    greg_id integer,
    uneg_id integer,
    rena_dshidrometrolocalinst character varying(20),
    rena_nnhidrometro character(10),
    rena_nmusuario character varying(50)
);


ALTER TABLE un_resumo_analitico OWNER TO gsan_admin;

--
-- TOC entry 404 (class 1259 OID 848782)
-- Name: un_resumo_coleta_esgoto; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_coleta_esgoto (
    rece_id integer NOT NULL,
    uneg_id integer NOT NULL,
    rece_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    rota_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    rece_qteconomias integer NOT NULL,
    lepf_id integer NOT NULL,
    rece_voesgoto integer NOT NULL,
    rece_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    rece_qtligacoes integer NOT NULL,
    rece_voexcedente integer NOT NULL,
    cstp_id integer NOT NULL,
    rece_cdsetorcomercial integer NOT NULL,
    rece_nnquadra integer NOT NULL,
    rece_icmedidoagua smallint NOT NULL,
    rece_icpoco smallint NOT NULL,
    rece_icmedidofontealternativa smallint NOT NULL,
    rece_icvlexcedente smallint NOT NULL,
    rece_pcesgoto numeric(5,2),
    rece_pccoleta numeric(5,2),
    rece_icvlminimoesgoto smallint NOT NULL,
    rece_vofaturado integer,
    rece_ichidrometro smallint,
    rece_cdrota integer,
    rece_icfaturamento smallint,
    ftst_id integer,
    ftsm_id integer
);


ALTER TABLE un_resumo_coleta_esgoto OWNER TO gsan_admin;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 404
-- Name: COLUMN un_resumo_coleta_esgoto.rece_icfaturamento; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_coleta_esgoto.rece_icfaturamento IS 'Indicador de Faturamento';


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 404
-- Name: COLUMN un_resumo_coleta_esgoto.ftst_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_coleta_esgoto.ftst_id IS 'Tipo da Situação de Faturamento';


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 404
-- Name: COLUMN un_resumo_coleta_esgoto.ftsm_id; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_coleta_esgoto.ftsm_id IS 'Motivo da Situação de Faturamento';


--
-- TOC entry 405 (class 1259 OID 848786)
-- Name: un_resumo_consumo_agua; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_consumo_agua (
    reca_id integer NOT NULL,
    uneg_id integer NOT NULL,
    reca_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    reca_cdsetorcomercial integer NOT NULL,
    rota_id integer NOT NULL,
    reca_nnquadra integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    reca_qteconomias integer NOT NULL,
    lepf_id integer NOT NULL,
    reca_consumoagua integer NOT NULL,
    reca_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    reca_consumoexcedente integer NOT NULL,
    reca_qtligacoes integer NOT NULL,
    iper_id integer NOT NULL,
    cstp_id integer NOT NULL,
    reca_icvolumeexcedente smallint NOT NULL,
    reca_voconsumofaturado integer,
    reca_ichidrometro smallint,
    reca_cdrota integer,
    reca_icligacaofaturada smallint DEFAULT 1 NOT NULL
);


ALTER TABLE un_resumo_consumo_agua OWNER TO gsan_admin;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 405
-- Name: COLUMN un_resumo_consumo_agua.reca_icligacaofaturada; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_consumo_agua.reca_icligacaofaturada IS ' Indicador para saber se a ligação e faturada ou nao:1 para Faturada,2 para Não faturada';


--
-- TOC entry 406 (class 1259 OID 848791)
-- Name: un_resumo_hidrometro; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_hidrometro (
    rehi_id integer NOT NULL,
    rehi_amreferencia integer NOT NULL,
    hila_id integer,
    hitp_id integer NOT NULL,
    hist_id integer NOT NULL,
    rehi_nnanofabricacao smallint NOT NULL,
    himc_id integer NOT NULL,
    hidm_id integer NOT NULL,
    hicp_id integer NOT NULL,
    rehi_icmacro smallint,
    rehi_qthidrometro integer NOT NULL,
    rehi_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    himb_id integer,
    hicm_id integer
);


ALTER TABLE un_resumo_hidrometro OWNER TO gsan_admin;

--
-- TOC entry 407 (class 1259 OID 848795)
-- Name: un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicador_desempenho_micromedicao_ref_2007 (
    reca_id integer DEFAULT nextval('sequence_un_resumo_indicador_desempenho_micromedicao_ref_2007'::regclass) NOT NULL,
    reca_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    reca_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    reca_qtligacoes_ativas integer NOT NULL,
    reca_qtligacoes_com_hidrometro integer NOT NULL,
    reca_qtligacoes_com_medicao_real integer NOT NULL,
    reca_qtligacoes_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_qteconomias_ativas integer NOT NULL,
    reca_qteconomias_com_hidrometro integer NOT NULL,
    reca_qteconomias_com_medicao_real integer NOT NULL,
    reca_qteconomias_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_consumoagua_ativas integer NOT NULL,
    reca_consumoagua_com_hidrometro integer NOT NULL,
    reca_consumoagua_com_medicao_real integer NOT NULL,
    reca_consumoagua_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_vofaturadoagua integer NOT NULL,
    reca_vofaturadoaguamedido integer NOT NULL,
    reca_vofaturadoaguanaomedido integer NOT NULL,
    rece_qtligacoes integer NOT NULL,
    rece_qteconomias integer NOT NULL,
    rece_voesgoto integer NOT NULL,
    rece_vofaturadoesgoto integer NOT NULL,
    rece_vofaturadoesgotomedido integer NOT NULL,
    rece_vofaturadoesgotonaomedido integer NOT NULL,
    relt_qtvisitas_realizadas integer NOT NULL,
    relt_qtleituras_efetuadas integer NOT NULL,
    relt_qtleituras_com_anormalidade_hidrometro integer NOT NULL,
    reih_qthidrometro_instalado_ramal integer NOT NULL,
    reih_qthidrometro_substituido_ramal integer NOT NULL,
    reih_qthidrometro_remanejado_ramal integer NOT NULL,
    reih_qthidrometro_retirado_ramal integer NOT NULL,
    reih_qthidrometrosatualinstaladosramal integer NOT NULL,
    reih_qthidrometro_instalado_poco integer NOT NULL,
    reih_qthidrometro_substituido_poco integer NOT NULL,
    reih_qthidrometro_remanejado_poco integer NOT NULL,
    reih_qthidrometro_retirado_poco integer NOT NULL,
    reih_qthidrometrosatualinstaladospoco integer NOT NULL,
    reih_qthidrometro_dadosatualizados integer NOT NULL,
    reca_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    scat_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL
);


ALTER TABLE un_resumo_indicador_desempenho_micromedicao_ref_2007 OWNER TO gsan_admin;

--
-- TOC entry 408 (class 1259 OID 848800)
-- Name: un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicador_desempenho_micromedicao_ref_2008 (
    reca_id integer DEFAULT nextval('sequence_un_resumo_indicador_desempenho_micromedicao_ref_2008'::regclass) NOT NULL,
    reca_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    reca_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    reca_qtligacoes_ativas integer NOT NULL,
    reca_qtligacoes_com_hidrometro integer NOT NULL,
    reca_qtligacoes_com_medicao_real integer NOT NULL,
    reca_qtligacoes_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_qteconomias_ativas integer NOT NULL,
    reca_qteconomias_com_hidrometro integer NOT NULL,
    reca_qteconomias_com_medicao_real integer NOT NULL,
    reca_qteconomias_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_consumoagua_ativas integer NOT NULL,
    reca_consumoagua_com_hidrometro integer NOT NULL,
    reca_consumoagua_com_medicao_real integer NOT NULL,
    reca_consumoagua_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_vofaturadoagua integer NOT NULL,
    reca_vofaturadoaguamedido integer NOT NULL,
    reca_vofaturadoaguanaomedido integer NOT NULL,
    rece_qtligacoes integer NOT NULL,
    rece_qteconomias integer NOT NULL,
    rece_voesgoto integer NOT NULL,
    rece_vofaturadoesgoto integer NOT NULL,
    rece_vofaturadoesgotomedido integer NOT NULL,
    rece_vofaturadoesgotonaomedido integer NOT NULL,
    relt_qtvisitas_realizadas integer NOT NULL,
    relt_qtleituras_efetuadas integer NOT NULL,
    relt_qtleituras_com_anormalidade_hidrometro integer NOT NULL,
    reih_qthidrometro_instalado_ramal integer NOT NULL,
    reih_qthidrometro_substituido_ramal integer NOT NULL,
    reih_qthidrometro_remanejado_ramal integer NOT NULL,
    reih_qthidrometro_retirado_ramal integer NOT NULL,
    reih_qthidrometrosatualinstaladosramal integer NOT NULL,
    reih_qthidrometro_instalado_poco integer NOT NULL,
    reih_qthidrometro_substituido_poco integer NOT NULL,
    reih_qthidrometro_remanejado_poco integer NOT NULL,
    reih_qthidrometro_retirado_poco integer NOT NULL,
    reih_qthidrometrosatualinstaladospoco integer NOT NULL,
    reih_qthidrometro_dadosatualizados integer NOT NULL,
    reca_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    scat_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL
);


ALTER TABLE un_resumo_indicador_desempenho_micromedicao_ref_2008 OWNER TO gsan_admin;

--
-- TOC entry 409 (class 1259 OID 848805)
-- Name: un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_indicador_desempenho_micromedicao_ref_2009 (
    reca_id integer DEFAULT nextval('sequence_un_resumo_indicador_desempenho_micromedicao_ref_2009'::regclass) NOT NULL,
    reca_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    reca_cdsetorcomercial integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    reca_qtligacoes_ativas integer NOT NULL,
    reca_qtligacoes_com_hidrometro integer NOT NULL,
    reca_qtligacoes_com_medicao_real integer NOT NULL,
    reca_qtligacoes_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_qteconomias_ativas integer NOT NULL,
    reca_qteconomias_com_hidrometro integer NOT NULL,
    reca_qteconomias_com_medicao_real integer NOT NULL,
    reca_qteconomias_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_consumoagua_ativas integer NOT NULL,
    reca_consumoagua_com_hidrometro integer NOT NULL,
    reca_consumoagua_com_medicao_real integer NOT NULL,
    reca_consumoagua_com_hidrometro_e_medicao_estimada integer NOT NULL,
    reca_vofaturadoagua integer NOT NULL,
    reca_vofaturadoaguamedido integer NOT NULL,
    reca_vofaturadoaguanaomedido integer NOT NULL,
    rece_qtligacoes integer NOT NULL,
    rece_qteconomias integer NOT NULL,
    rece_voesgoto integer NOT NULL,
    rece_vofaturadoesgoto integer NOT NULL,
    rece_vofaturadoesgotomedido integer NOT NULL,
    rece_vofaturadoesgotonaomedido integer NOT NULL,
    relt_qtvisitas_realizadas integer NOT NULL,
    relt_qtleituras_efetuadas integer NOT NULL,
    relt_qtleituras_com_anormalidade_hidrometro integer NOT NULL,
    reih_qthidrometro_instalado_ramal integer NOT NULL,
    reih_qthidrometro_substituido_ramal integer NOT NULL,
    reih_qthidrometro_remanejado_ramal integer NOT NULL,
    reih_qthidrometro_retirado_ramal integer NOT NULL,
    reih_qthidrometrosatualinstaladosramal integer NOT NULL,
    reih_qthidrometro_instalado_poco integer NOT NULL,
    reih_qthidrometro_substituido_poco integer NOT NULL,
    reih_qthidrometro_remanejado_poco integer NOT NULL,
    reih_qthidrometro_retirado_poco integer NOT NULL,
    reih_qthidrometrosatualinstaladospoco integer NOT NULL,
    reih_qthidrometro_dadosatualizados integer NOT NULL,
    reca_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    scat_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL
);


ALTER TABLE un_resumo_indicador_desempenho_micromedicao_ref_2009 OWNER TO gsan_admin;

--
-- TOC entry 410 (class 1259 OID 848810)
-- Name: un_resumo_metas; Type: TABLE; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_metas (
    remt_id integer NOT NULL,
    remt_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    rota_id integer NOT NULL,
    qdra_id integer NOT NULL,
    remt_cdsetorcomercial integer NOT NULL,
    remt_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    remt_cdgruposubcat integer,
    remt_qtligacoescadastradas integer NOT NULL,
    remt_qtligacoescortadas integer NOT NULL,
    remt_qtligacoessuprimidas integer NOT NULL,
    remt_qtligacoesativas integer NOT NULL,
    remt_qtligacoesativasdebito3m integer NOT NULL,
    remt_qtligacoesconsumomedido integer NOT NULL,
    remt_qtligacoesconsumonaomed integer NOT NULL,
    remt_qtligacoesconsumoate5m3 integer NOT NULL,
    remt_qtligacoesconsumomedia integer NOT NULL,
    remt_qteconomias integer NOT NULL,
    remt_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE un_resumo_metas OWNER TO gsan_admin;

--
-- TOC entry 411 (class 1259 OID 848814)
-- Name: vw_consumo_tipo; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_consumo_tipo AS
 SELECT table1.cstp_id,
    table1.cstp_dsconsumotipo,
    table1.cstp_dsabreviadaconsumotipo,
    table1.cstp_icuso,
    table1.cstp_tmultimaalteracao,
    table1.cstp_iccalculomedia
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.consumo_tipo'::text) table1(cstp_id integer, cstp_dsconsumotipo character varying(20), cstp_dsabreviadaconsumotipo character varying(10), cstp_icuso smallint, cstp_tmultimaalteracao timestamp without time zone, cstp_iccalculomedia smallint);


ALTER TABLE vw_consumo_tipo OWNER TO gsan_admin;

--
-- TOC entry 412 (class 1259 OID 848818)
-- Name: vw_hidrometro_capacidade; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_capacidade AS
 SELECT table1.hicp_id,
    table1.hicp_dshidrometrocapacidade,
    table1.hicp_dsabreviadahidrometrocapacidade,
    table1.hicp_nndigitosleituraminimo,
    table1.hicp_nndigitosleituramaximo,
    table1.hicp_icuso,
    table1.hicp_tmultimaalteracao,
    table1.hicp_nnordem,
    table1.hicp_cdhidrometrocapacidade
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_capacidade'::text) table1(hicp_id integer, hicp_dshidrometrocapacidade character varying(20), hicp_dsabreviadahidrometrocapacidade character(6), hicp_nndigitosleituraminimo smallint, hicp_nndigitosleituramaximo smallint, hicp_icuso smallint, hicp_tmultimaalteracao timestamp without time zone, hicp_nnordem smallint, hicp_cdhidrometrocapacidade character(1));


ALTER TABLE vw_hidrometro_capacidade OWNER TO gsan_admin;

--
-- TOC entry 413 (class 1259 OID 848822)
-- Name: vw_hidrometro_classe_metrologica; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_classe_metrologica AS
 SELECT table1.hicm_id,
    table1.hicm_dshidrometroclassemetrologica,
    table1.hicm_dsabreviadahidrometroclassemetrologica,
    table1.hicm_icuso,
    table1.hicm_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_classe_metrlg '::text) table1(hicm_id integer, hicm_dshidrometroclassemetrologica character varying(20), hicm_dsabreviadahidrometroclassemetrologica character(5), hicm_icuso smallint, hicm_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_hidrometro_classe_metrologica OWNER TO gsan_admin;

--
-- TOC entry 414 (class 1259 OID 848826)
-- Name: vw_hidrometro_diametro; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_diametro AS
 SELECT table1.hidm_id,
    table1.hidm_dshidrometrodiametro,
    table1.hidm_dsabreviadahidrometrodiametro,
    table1.hidm_icuso,
    table1.hidm_tmultimaalteracao,
    table1.hidm_nnordem
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_diametro'::text) table1(hidm_id integer, hidm_dshidrometrodiametro character varying(20), hidm_dsabreviadahidrometrodiametro character(5), hidm_icuso smallint, hidm_tmultimaalteracao timestamp without time zone, hidm_nnordem smallint);


ALTER TABLE vw_hidrometro_diametro OWNER TO gsan_admin;

--
-- TOC entry 415 (class 1259 OID 848830)
-- Name: vw_hidrometro_local_armazenagem; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_local_armazenagem AS
 SELECT table1.hila_id,
    table1.hila_dshidrometrolocalarmazenagem,
    table1.hila_dsabreviadahidrometrolocalarmazenagem,
    table1.hila_icuso,
    table1.hila_tmultimaalteracao,
    table1.hila_icoficina
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_local_armaz'::text) table1(hila_id integer, hila_dshidrometrolocalarmazenagem character varying(45), hila_dsabreviadahidrometrolocalarmazenagem character(5), hila_icuso smallint, hila_tmultimaalteracao timestamp without time zone, hila_icoficina smallint);


ALTER TABLE vw_hidrometro_local_armazenagem OWNER TO gsan_admin;

--
-- TOC entry 416 (class 1259 OID 848834)
-- Name: vw_hidrometro_marca; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_marca AS
 SELECT table1.himc_id,
    table1.himc_dshidrometromarca,
    table1.himc_dsabreviadahidrometromarca,
    table1.himc_nndiarevisao,
    table1.himc_icuso,
    table1.himc_tmultimaalteracao,
    table1.himc_cdhidrometromarca,
    table1.himc_icmicro,
    table1.himc_icmacro
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_marca'::text) table1(himc_id integer, himc_dshidrometromarca character varying(30), himc_dsabreviadahidrometromarca character(3), himc_nndiarevisao smallint, himc_icuso smallint, himc_tmultimaalteracao timestamp without time zone, himc_cdhidrometromarca character(1), himc_icmicro smallint, himc_icmacro smallint);


ALTER TABLE vw_hidrometro_marca OWNER TO gsan_admin;

--
-- TOC entry 417 (class 1259 OID 848838)
-- Name: vw_hidrometro_motivo_baixa; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_motivo_baixa AS
 SELECT table1.himb_id,
    table1.himb_dshidrometromotivobaixa,
    table1.himb_icuso,
    table1.himb_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_motivo_baixa '::text) table1(himb_id integer, himb_dshidrometromotivobaixa character varying(20), himb_icuso smallint, himb_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_hidrometro_motivo_baixa OWNER TO gsan_admin;

--
-- TOC entry 418 (class 1259 OID 848842)
-- Name: vw_hidrometro_situacao; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_situacao AS
 SELECT table1.hist_id,
    table1.hist_dshidrometrosituacao,
    table1.hist_icuso,
    table1.hist_tmultimaalteracao,
    table1.hist_ichidrometroextraviado
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_situacao'::text) table1(hist_id integer, hist_dshidrometrosituacao character varying(20), hist_icuso smallint, hist_tmultimaalteracao timestamp without time zone, hist_ichidrometroextraviado smallint);


ALTER TABLE vw_hidrometro_situacao OWNER TO gsan_admin;

--
-- TOC entry 419 (class 1259 OID 848846)
-- Name: vw_hidrometro_tipo; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_hidrometro_tipo AS
 SELECT table1.hitp_id,
    table1.hitp_dshidrometrotipo,
    table1.hitp_dcabreviadahidrometrotipo,
    table1.hitp_icuso,
    table1.hitp_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.hidrometro_tipo'::text) table1(hitp_id integer, hitp_dshidrometrotipo character varying(20), hitp_dcabreviadahidrometrotipo character(5), hitp_icuso smallint, hitp_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_hidrometro_tipo OWNER TO gsan_admin;

--
-- TOC entry 445 (class 1259 OID 873686)
-- Name: vw_leitura_anormalidade; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_leitura_anormalidade AS
 SELECT table1.ltan_id,
    table1.ltan_dsleituraanormalidade,
    table1.ltan_icrelativohidrometro,
    table1.ltan_icimovelsemhidrometro,
    table1.ltan_icusosistema,
    table1.ltan_icemissaoordemservico,
    table1.ltan_icuso,
    table1.lacs_idconsumoacobrarsemleitura,
    table1.lacs_idconsumoacobrarcomleitura,
    table1.lalt_idleituraafaturarsemleitura,
    table1.lalt_idleituraafaturarcomleitura,
    table1.ltan_icperdatarifasocial,
    table1.ltan_tmultimaalteracao,
    table1.svtp_id,
    table1.ltan_nnfatorsemleitura,
    table1.ltan_nnfatorcomleitura,
    table1.ltan_icleitura,
    table1.ltan_dsabreviadaleituraanormalidade,
    table1.ltan_icimpressaosimultanea,
    table1.ltan_nnvezessuspendeleitura,
    table1.ltan_nnmesesleiturasuspensa,
    table1.ltan_icexibirrelatorio,
    table1.ltan_iccalcadamsg,
    table1.ltan_icsubshidrometrormsg,
    table1.ltan_icnaoimprimirconta
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.leitura_anormalidade'::text) table1(ltan_id integer, ltan_dsleituraanormalidade character varying(25), ltan_icrelativohidrometro smallint, ltan_icimovelsemhidrometro smallint, ltan_icusosistema smallint, ltan_icemissaoordemservico smallint, ltan_icuso smallint, lacs_idconsumoacobrarsemleitura integer, lacs_idconsumoacobrarcomleitura integer, lalt_idleituraafaturarsemleitura integer, lalt_idleituraafaturarcomleitura integer, ltan_icperdatarifasocial smallint, ltan_tmultimaalteracao timestamp without time zone, svtp_id integer, ltan_nnfatorsemleitura numeric(3,2), ltan_nnfatorcomleitura numeric(3,2), ltan_icleitura smallint, ltan_dsabreviadaleituraanormalidade character(5), ltan_icimpressaosimultanea smallint, ltan_nnvezessuspendeleitura integer, ltan_nnmesesleiturasuspensa integer, ltan_icexibirrelatorio smallint, ltan_iccalcadamsg smallint, ltan_icsubshidrometrormsg smallint, ltan_icnaoimprimirconta smallint);


ALTER TABLE vw_leitura_anormalidade OWNER TO gsan_admin;

--
-- TOC entry 420 (class 1259 OID 848855)
-- Name: vw_leitura_anormalidade_consumo; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_leitura_anormalidade_consumo AS
 SELECT table1.lacs_id,
    table1.lacs_dsconsumoacobrar,
    table1.lacs_icsemleitura,
    table1.lacs_iccomleitura,
    table1.lacs_icuso,
    table1.lacs_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.leitura_anormalidade_consumo'::text) table1(lacs_id integer, lacs_dsconsumoacobrar character varying(30), lacs_icsemleitura smallint, lacs_iccomleitura smallint, lacs_icuso smallint, lacs_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_leitura_anormalidade_consumo OWNER TO gsan_admin;

--
-- TOC entry 421 (class 1259 OID 848859)
-- Name: vw_leitura_anormalidade_informada; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_leitura_anormalidade_informada AS
 SELECT g_leitura_anormalidade.ltan_id AS ltan_idanormalidadeinformada,
    g_leitura_anormalidade.ltan_dsleituraanormalidade,
    g_leitura_anormalidade.ltan_dsabreviadaleituraanormalidade,
    g_leitura_anormalidade.ltan_icrelativohidrometro,
    g_leitura_anormalidade.ltan_icimovelsemhidrometro,
    g_leitura_anormalidade.ltan_icusosistema,
    g_leitura_anormalidade.ltan_icemissaoordemservico,
    g_leitura_anormalidade.ltan_icuso,
    g_leitura_anormalidade.ltan_icperdatarifasocial,
    g_leitura_anormalidade.ltan_tmultimaalteracao
   FROM g_leitura_anormalidade;


ALTER TABLE vw_leitura_anormalidade_informada OWNER TO gsan_admin;

--
-- TOC entry 422 (class 1259 OID 848863)
-- Name: vw_leitura_anormalidade_leitura; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_leitura_anormalidade_leitura AS
 SELECT table1.lalt_id,
    table1.lalt_dsleituraafaturar,
    table1.lalt_icsemleitura,
    table1.lalt_iccomleitura,
    table1.lalt_icuso,
    table1.lalt_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.leitura_anormalidade_leitura'::text) table1(lalt_id integer, lalt_dsleituraafaturar character varying(30), lalt_icsemleitura smallint, lalt_iccomleitura smallint, lalt_icuso smallint, lalt_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_leitura_anormalidade_leitura OWNER TO gsan_admin;

--
-- TOC entry 423 (class 1259 OID 848867)
-- Name: vw_leitura_situacao; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_leitura_situacao AS
 SELECT table1.ltst_id,
    table1.ltst_dsleiturasituacao,
    table1.ltst_icuso,
    table1.ltst_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 
user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.leitura_situacao'::text) table1(ltst_id integer, ltst_dsleiturasituacao character varying(30), ltst_icuso smallint, ltst_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_leitura_situacao OWNER TO gsan_admin;

--
-- TOC entry 424 (class 1259 OID 848871)
-- Name: vw_medicao_tipo; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_medicao_tipo AS
 SELECT table1.medt_id,
    table1.medt_dsmedicaotipo,
    table1.medt_icuso,
    table1.medt_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.medicao_tipo'::text) table1(medt_id integer, medt_dsmedicaotipo character varying(25), medt_icuso smallint, medt_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_medicao_tipo OWNER TO gsan_admin;

--
-- TOC entry 425 (class 1259 OID 848875)
-- Name: vw_rota; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_rota AS
 SELECT table1.rota_id,
    table1.lttp_id,
    table1.empr_id,
    table1.rota_icconsumoajuste,
    table1.rota_icleiturafiscalizacaocortado,
    table1.rota_icleiturafiscalizacaosuprimido,
    table1.rota_icfaixafalsageracao,
    table1.rota_pcfaixafalsageracao,
    table1.rota_icleiturafiscalizacaogeracao,
    table1.rota_pcleiturafiscalizacaogeracao,
    table1.rota_icuso,
    table1.rota_tmultimaalteracao,
    table1.ftgr_id,
    table1.stcm_id,
    table1.rota_dtleituraajuste,
    table1.cbgr_id,
    table1.rota_cdrota,
    table1.empr_idcobranca,
    table1.leit_id,
    table1.rota_nnsequencialeiturista,
    table1.empr_identregacontas,
    table1.rota_icalternativa,
    table1.rota_ictransmissaooffline,
    table1.ftgr_idoriginal,
    table1.rota_nnlimiteimoveis,
    table1.rota_icseqleitura,
    table1.rota_nndiasconsumoajuste,
    table1.rota_icdividerota,
    table1.rota_icimpressaotermicafinalgrupo
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1 user=gsan_olap password= ol@p port=5432'::text, 'select * from micromedicao.rota'::text) table1(rota_id integer, lttp_id integer, empr_id integer, rota_icconsumoajuste smallint, rota_icleiturafiscalizacaocortado smallint, rota_icleiturafiscalizacaosuprimido smallint, rota_icfaixafalsageracao smallint, rota_pcfaixafalsageracao numeric(5,2), rota_icleiturafiscalizacaogeracao smallint, rota_pcleiturafiscalizacaogeracao numeric(5,2), rota_icuso smallint, rota_tmultimaalteracao timestamp without time zone, ftgr_id integer, stcm_id integer, rota_dtleituraajuste date, cbgr_id integer, rota_cdrota smallint, empr_idcobranca integer, leit_id integer, rota_nnsequencialeiturista integer, empr_identregacontas integer, rota_icalternativa smallint, rota_ictransmissaooffline smallint, ftgr_idoriginal integer, rota_nnlimiteimoveis integer, rota_icseqleitura integer, rota_nndiasconsumoajuste integer, rota_icdividerota smallint, rota_icimpressaotermicafinalgrupo smallint);


ALTER TABLE vw_rota OWNER TO gsan_admin;

--
-- TOC entry 426 (class 1259 OID 848880)
-- Name: vw_un_resumo_indicador_coleta_esgoto; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_indicador_coleta_esgoto AS
 SELECT a.rece_amreferencia,
    substr((a.rece_amreferencia)::text, 1, 4) AS rece_anoreferencia,
        CASE
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END AS rece_mesreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.rece_cdsetorcomercial,
    a.rece_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    sum(a.rece_qtligacoes) AS rece_qtligacoes,
    sum(a.rece_qteconomias) AS rece_qteconomias,
    sum(a.rece_voesgoto) AS rece_voesgoto,
    sum(a.rece_vofaturado) AS rece_vofaturadoesgoto,
    sum(
        CASE
            WHEN (a.cstp_id <> ALL (ARRAY[5, 7])) THEN a.rece_vofaturado
            ELSE 0
        END) AS rece_vofaturadoesgotomedido,
    sum(
        CASE
            WHEN (a.cstp_id = ANY (ARRAY[5, 7])) THEN a.rece_vofaturado
            ELSE 0
        END) AS rece_vofaturadoesgotonaomedido
   FROM un_resumo_coleta_esgoto a
  GROUP BY a.rece_amreferencia, substr((a.rece_amreferencia)::text, 1, 4),
        CASE
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.rece_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END, a.greg_id, a.uneg_id, a.loca_id, a.loca_cdelo, a.stcm_id, a.qdra_id, a.rota_id, a.rece_cdsetorcomercial, a.rece_nnquadra, a.iper_id, a.last_id, a.lest_id, a.catg_id, a.scat_id, a.epod_id, a.cltp_id, a.lapf_id, a.lepf_id;


ALTER TABLE vw_un_resumo_indicador_coleta_esgoto OWNER TO gsan_admin;

--
-- TOC entry 427 (class 1259 OID 848885)
-- Name: vw_un_resumo_indicador_consumo_agua; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_indicador_consumo_agua AS
 SELECT a.reca_amreferencia,
    substr((a.reca_amreferencia)::text, 1, 4) AS reca_anoreferencia,
        CASE
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END AS reca_mesreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.reca_cdsetorcomercial,
    a.reca_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    sum(a.reca_qtligacoes) AS reca_qtligacoes_ativas,
    sum(
        CASE
            WHEN (a.reca_ichidrometro = 1) THEN a.reca_qtligacoes
            ELSE 0
        END) AS reca_qtligacoes_com_hidrometro,
    sum(
        CASE
            WHEN (a.cstp_id = 1) THEN a.reca_qtligacoes
            ELSE 0
        END) AS reca_qtligacoes_com_medicao_real,
    sum(
        CASE
            WHEN ((a.reca_ichidrometro = 1) AND (a.cstp_id <> 1)) THEN a.reca_qtligacoes
            ELSE 0
        END) AS reca_qtligacoes_com_hidrometro_e_medicao_estimada,
    sum(a.reca_qteconomias) AS reca_qteconomias_ativas,
    sum(
        CASE
            WHEN (a.reca_ichidrometro = 1) THEN a.reca_qteconomias
            ELSE 0
        END) AS reca_qteconomias_com_hidrometro,
    sum(
        CASE
            WHEN (a.cstp_id = 1) THEN a.reca_qteconomias
            ELSE 0
        END) AS reca_qteconomias_com_medicao_real,
    sum(
        CASE
            WHEN ((a.reca_ichidrometro = 1) AND (a.cstp_id <> 1)) THEN a.reca_qteconomias
            ELSE 0
        END) AS reca_qteconomias_com_hidrometro_e_medicao_estimada,
    sum(a.reca_consumoagua) AS reca_consumoagua_ativas,
    sum(
        CASE
            WHEN (a.reca_ichidrometro = 1) THEN a.reca_consumoagua
            ELSE 0
        END) AS reca_consumoagua_com_hidrometro,
    sum(
        CASE
            WHEN (a.cstp_id = 1) THEN a.reca_consumoagua
            ELSE 0
        END) AS reca_consumoagua_com_medicao_real,
    sum(
        CASE
            WHEN ((a.reca_ichidrometro = 1) AND (a.cstp_id <> 1)) THEN a.reca_consumoagua
            ELSE 0
        END) AS reca_consumoagua_com_hidrometro_e_medicao_estimada,
    sum(a.reca_voconsumofaturado) AS reca_vofaturadoagua,
    sum(
        CASE
            WHEN (a.cstp_id <> ALL (ARRAY[5, 7])) THEN a.reca_voconsumofaturado
            ELSE 0
        END) AS reca_vofaturadoaguamedido,
    sum(
        CASE
            WHEN (a.cstp_id = ANY (ARRAY[5, 7])) THEN a.reca_voconsumofaturado
            ELSE 0
        END) AS reca_vofaturadoaguanaomedido
   FROM un_resumo_consumo_agua a
  GROUP BY a.reca_amreferencia, substr((a.reca_amreferencia)::text, 1, 4),
        CASE
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.reca_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END, a.greg_id, a.uneg_id, a.loca_id, a.loca_cdelo, a.stcm_id, a.qdra_id, a.rota_id, a.reca_cdsetorcomercial, a.reca_nnquadra, a.iper_id, a.last_id, a.lest_id, a.catg_id, a.scat_id, a.epod_id, a.cltp_id, a.lapf_id, a.lepf_id;


ALTER TABLE vw_un_resumo_indicador_consumo_agua OWNER TO gsan_admin;

--
-- TOC entry 428 (class 1259 OID 848890)
-- Name: vw_un_resumo_indicador_agua_esgoto; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_indicador_agua_esgoto AS
 SELECT
        CASE
            WHEN (a.reca_amreferencia IS NULL) THEN b.rece_amreferencia
            ELSE a.reca_amreferencia
        END AS reca_amreferencia,
        CASE
            WHEN (a.reca_amreferencia IS NULL) THEN b.rece_anoreferencia
            ELSE a.reca_anoreferencia
        END AS reca_anoreferencia,
        CASE
            WHEN (a.reca_amreferencia IS NULL) THEN b.rece_mesreferencia
            ELSE a.reca_mesreferencia
        END AS reca_mesreferencia,
        CASE
            WHEN (a.greg_id IS NULL) THEN b.greg_id
            ELSE a.greg_id
        END AS greg_id,
        CASE
            WHEN (a.uneg_id IS NULL) THEN b.uneg_id
            ELSE a.uneg_id
        END AS uneg_id,
        CASE
            WHEN (a.loca_id IS NULL) THEN b.loca_id
            ELSE a.loca_id
        END AS loca_id,
        CASE
            WHEN (a.loca_cdelo IS NULL) THEN b.loca_cdelo
            ELSE a.loca_cdelo
        END AS loca_cdelo,
        CASE
            WHEN (a.stcm_id IS NULL) THEN b.stcm_id
            ELSE a.stcm_id
        END AS stcm_id,
        CASE
            WHEN (a.qdra_id IS NULL) THEN b.qdra_id
            ELSE a.qdra_id
        END AS qdra_id,
        CASE
            WHEN (a.rota_id IS NULL) THEN b.rota_id
            ELSE a.rota_id
        END AS rota_id,
        CASE
            WHEN (a.reca_cdsetorcomercial IS NULL) THEN b.rece_cdsetorcomercial
            ELSE a.reca_cdsetorcomercial
        END AS reca_cdsetorcomercial,
        CASE
            WHEN (a.reca_nnquadra IS NULL) THEN b.rece_nnquadra
            ELSE a.reca_nnquadra
        END AS reca_nnquadra,
        CASE
            WHEN (a.iper_id IS NULL) THEN b.iper_id
            ELSE a.iper_id
        END AS iper_id,
        CASE
            WHEN (a.last_id IS NULL) THEN b.last_id
            ELSE a.last_id
        END AS last_id,
        CASE
            WHEN (a.lest_id IS NULL) THEN b.lest_id
            ELSE a.lest_id
        END AS lest_id,
        CASE
            WHEN (a.catg_id IS NULL) THEN b.catg_id
            ELSE a.catg_id
        END AS catg_id,
        CASE
            WHEN (a.scat_id IS NULL) THEN b.scat_id
            ELSE a.scat_id
        END AS scat_id,
        CASE
            WHEN (a.epod_id IS NULL) THEN b.epod_id
            ELSE a.epod_id
        END AS epod_id,
        CASE
            WHEN (a.cltp_id IS NULL) THEN b.cltp_id
            ELSE a.cltp_id
        END AS cltp_id,
        CASE
            WHEN (a.lapf_id IS NULL) THEN b.lapf_id
            ELSE a.lapf_id
        END AS lapf_id,
        CASE
            WHEN (a.lepf_id IS NULL) THEN b.lepf_id
            ELSE a.lepf_id
        END AS lepf_id,
        CASE
            WHEN (a.reca_qtligacoes_ativas IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_ativas
        END AS reca_qtligacoes_ativas,
        CASE
            WHEN (a.reca_qtligacoes_com_hidrometro IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_com_hidrometro
        END AS reca_qtligacoes_com_hidrometro,
        CASE
            WHEN (a.reca_qtligacoes_com_medicao_real IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_com_medicao_real
        END AS reca_qtligacoes_com_medicao_real,
        CASE
            WHEN (a.reca_qtligacoes_com_hidrometro_e_medicao_estimada IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_com_hidrometro_e_medicao_estimada
        END AS reca_qtligacoes_com_hidrometro_e_medicao_estimada,
        CASE
            WHEN (a.reca_qteconomias_ativas IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_ativas
        END AS reca_qteconomias_ativas,
        CASE
            WHEN (a.reca_qteconomias_com_hidrometro IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_com_hidrometro
        END AS reca_qteconomias_com_hidrometro,
        CASE
            WHEN (a.reca_qteconomias_com_medicao_real IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_com_medicao_real
        END AS reca_qteconomias_com_medicao_real,
        CASE
            WHEN (a.reca_qteconomias_com_hidrometro_e_medicao_estimada IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_com_hidrometro_e_medicao_estimada
        END AS reca_qteconomias_com_hidrometro_e_medicao_estimada,
        CASE
            WHEN (a.reca_consumoagua_ativas IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_ativas
        END AS reca_consumoagua_ativas,
        CASE
            WHEN (a.reca_consumoagua_com_hidrometro IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_com_hidrometro
        END AS reca_consumoagua_com_hidrometro,
        CASE
            WHEN (a.reca_consumoagua_com_medicao_real IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_com_medicao_real
        END AS reca_consumoagua_com_medicao_real,
        CASE
            WHEN (a.reca_consumoagua_com_hidrometro_e_medicao_estimada IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_com_hidrometro_e_medicao_estimada
        END AS reca_consumoagua_com_hidrometro_e_medicao_estimada,
        CASE
            WHEN (a.reca_vofaturadoagua IS NULL) THEN (0)::bigint
            ELSE a.reca_vofaturadoagua
        END AS reca_vofaturadoagua,
        CASE
            WHEN (a.reca_vofaturadoaguamedido IS NULL) THEN (0)::bigint
            ELSE a.reca_vofaturadoaguamedido
        END AS reca_vofaturadoaguamedido,
        CASE
            WHEN (a.reca_vofaturadoaguanaomedido IS NULL) THEN (0)::bigint
            ELSE a.reca_vofaturadoaguanaomedido
        END AS reca_vofaturadoaguanaomedido,
        CASE
            WHEN (b.rece_qtligacoes IS NULL) THEN (0)::bigint
            ELSE b.rece_qtligacoes
        END AS rece_qtligacoes,
        CASE
            WHEN (b.rece_qteconomias IS NULL) THEN (0)::bigint
            ELSE b.rece_qteconomias
        END AS rece_qteconomias,
        CASE
            WHEN (b.rece_voesgoto IS NULL) THEN (0)::bigint
            ELSE b.rece_voesgoto
        END AS rece_voesgoto,
        CASE
            WHEN (b.rece_vofaturadoesgoto IS NULL) THEN (0)::bigint
            ELSE b.rece_vofaturadoesgoto
        END AS rece_vofaturadoesgoto,
        CASE
            WHEN (b.rece_vofaturadoesgotomedido IS NULL) THEN (0)::bigint
            ELSE b.rece_vofaturadoesgotomedido
        END AS rece_vofaturadoesgotomedido,
        CASE
            WHEN (b.rece_vofaturadoesgotonaomedido IS NULL) THEN (0)::bigint
            ELSE b.rece_vofaturadoesgotonaomedido
        END AS rece_vofaturadoesgotonaomedido
   FROM (vw_un_resumo_indicador_consumo_agua a
     FULL JOIN vw_un_resumo_indicador_coleta_esgoto b ON ((((((((((((((((((((a.reca_amreferencia = b.rece_amreferencia) AND (a.greg_id = b.greg_id)) AND (a.uneg_id = b.uneg_id)) AND (a.loca_id = b.loca_id)) AND (a.loca_cdelo = b.loca_cdelo)) AND (a.stcm_id = b.stcm_id)) AND (a.qdra_id = b.qdra_id)) AND (a.rota_id = b.rota_id)) AND (a.reca_cdsetorcomercial = b.rece_cdsetorcomercial)) AND (a.reca_nnquadra = b.rece_nnquadra)) AND (a.iper_id = b.iper_id)) AND (a.last_id = b.last_id)) AND (a.lest_id = b.lest_id)) AND (a.catg_id = b.catg_id)) AND (a.scat_id = b.scat_id)) AND (a.epod_id = b.epod_id)) AND (a.cltp_id = b.cltp_id)) AND (a.lapf_id = b.lapf_id)) AND (a.lepf_id = b.lepf_id))));


ALTER TABLE vw_un_resumo_indicador_agua_esgoto OWNER TO gsan_admin;

--
-- TOC entry 429 (class 1259 OID 848895)
-- Name: vw_un_resumo_indicador_hidrometro; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_indicador_hidrometro AS
 SELECT a.reih_amreferencia,
    substr((a.reih_amreferencia)::text, 1, 4) AS reih_anoreferencia,
        CASE
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END AS reih_mesreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.reih_cdsetorcomercial,
    a.reih_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    sum(a.reih_qthidr_instalado_ramal) AS reih_qthidrometro_instalado_ramal,
    sum(a.reih_qthidr_substituido_ramal) AS reih_qthidrometro_substituido_ramal,
    sum(a.reih_qthidr_remanejado_ramal) AS reih_qthidrometro_remanejado_ramal,
    sum(a.reih_qthidr_retirado_ramal) AS reih_qthidrometro_retirado_ramal,
    sum(
        CASE
            WHEN (a.reih_qthidratualinstaladoramal IS NULL) THEN 0
            ELSE a.reih_qthidratualinstaladoramal
        END) AS reih_qthidrometrosatualinstaladosramal,
    sum(a.reih_qthidr_instalado_poco) AS reih_qthidrometro_instalado_poco,
    sum(a.reih_qthidr_substituido_poco) AS reih_qthidrometro_substituido_poco,
    sum(a.reih_qthidr_remanejado_poco) AS reih_qthidrometro_remanejado_poco,
    sum(a.reih_qthidr_retirado_poco) AS reih_qthidrometro_retirado_poco,
    sum(
        CASE
            WHEN (a.reih_qthidratualinstaladospoco IS NULL) THEN 0
            ELSE a.reih_qthidratualinstaladospoco
        END) AS reih_qthidrometrosatualinstaladospoco,
    sum(
        CASE
            WHEN (a.reih_qthidr_dadosatualizados IS NULL) THEN 0
            ELSE a.reih_qthidr_dadosatualizados
        END) AS reih_qthidrometro_dadosatualizados
   FROM un_res_ins_hidr a
  GROUP BY a.reih_amreferencia, substr((a.reih_amreferencia)::text, 1, 4),
        CASE
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.reih_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END, a.greg_id, a.uneg_id, a.loca_id, a.loca_cdelo, a.stcm_id, a.qdra_id, a.rota_id, a.reih_cdsetorcomercial, a.reih_nnquadra, a.iper_id, a.last_id, a.lest_id, a.catg_id, a.scat_id, a.epod_id, a.cltp_id, a.lapf_id, a.lepf_id;


ALTER TABLE vw_un_resumo_indicador_hidrometro OWNER TO gsan_admin;

--
-- TOC entry 430 (class 1259 OID 848900)
-- Name: vw_un_resumo_indicador_leitura_anormalidade; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_indicador_leitura_anormalidade AS
 SELECT a.relt_amreferencia,
    substr((a.relt_amreferencia)::text, 1, 4) AS relt_anoreferencia,
        CASE
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END AS relt_mesreferencia,
    a.greg_id,
    a.uneg_id,
    a.loca_id,
    a.loca_cdelo,
    a.stcm_id,
    a.qdra_id,
    a.rota_id,
    a.relt_cdsetorcomercial,
    a.relt_nnquadra,
    a.iper_id,
    a.last_id,
    a.lest_id,
    a.catg_id,
    a.scat_id,
    a.epod_id,
    a.cltp_id,
    a.lapf_id,
    a.lepf_id,
    sum(
        CASE
            WHEN ((a.ltst_id = ANY (ARRAY[1, 3, 4])) OR (a.ltan_id <> 0)) THEN a.relt_qtleituras
            ELSE 0
        END) AS relt_qtvisitas_realizadas,
    sum(
        CASE
            WHEN (a.ltst_id = ANY (ARRAY[1, 3, 4])) THEN a.relt_qtleituras
            ELSE 0
        END) AS relt_qtleituras_efetuadas,
    sum(
        CASE
            WHEN ((a.ltan_id <> 0) AND (b.ltan_icrelativohidrometro = 1)) THEN a.relt_qtleituras
            ELSE 0
        END) AS relt_qtleituras_com_anormalidade_hidrometro
   FROM (un_res_lt_anorm a
     LEFT JOIN g_leitura_anormalidade b ON ((a.ltan_id = b.ltan_id)))
  GROUP BY a.relt_amreferencia, substr((a.relt_amreferencia)::text, 1, 4),
        CASE
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((a.relt_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END, a.greg_id, a.uneg_id, a.loca_id, a.loca_cdelo, a.stcm_id, a.qdra_id, a.rota_id, a.relt_cdsetorcomercial, a.relt_nnquadra, a.iper_id, a.last_id, a.lest_id, a.catg_id, a.scat_id, a.epod_id, a.cltp_id, a.lapf_id, a.lepf_id;


ALTER TABLE vw_un_resumo_indicador_leitura_anormalidade OWNER TO gsan_admin;

--
-- TOC entry 431 (class 1259 OID 848905)
-- Name: vw_un_resumo_indicador_anormalidade_hidrometro; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_indicador_anormalidade_hidrometro AS
 SELECT
        CASE
            WHEN (a.relt_amreferencia IS NULL) THEN b.reih_amreferencia
            ELSE a.relt_amreferencia
        END AS relt_amreferencia,
        CASE
            WHEN (a.relt_amreferencia IS NULL) THEN b.reih_anoreferencia
            ELSE a.relt_anoreferencia
        END AS relt_anoreferencia,
        CASE
            WHEN (a.relt_amreferencia IS NULL) THEN b.reih_mesreferencia
            ELSE a.relt_mesreferencia
        END AS relt_mesreferencia,
        CASE
            WHEN (a.greg_id IS NULL) THEN b.greg_id
            ELSE a.greg_id
        END AS greg_id,
        CASE
            WHEN (a.uneg_id IS NULL) THEN b.uneg_id
            ELSE a.uneg_id
        END AS uneg_id,
        CASE
            WHEN (a.loca_id IS NULL) THEN b.loca_id
            ELSE a.loca_id
        END AS loca_id,
        CASE
            WHEN (a.loca_cdelo IS NULL) THEN b.loca_cdelo
            ELSE a.loca_cdelo
        END AS loca_cdelo,
        CASE
            WHEN (a.stcm_id IS NULL) THEN b.stcm_id
            ELSE a.stcm_id
        END AS stcm_id,
        CASE
            WHEN (a.qdra_id IS NULL) THEN b.qdra_id
            ELSE a.qdra_id
        END AS qdra_id,
        CASE
            WHEN (a.rota_id IS NULL) THEN b.rota_id
            ELSE a.rota_id
        END AS rota_id,
        CASE
            WHEN (a.relt_cdsetorcomercial IS NULL) THEN b.reih_cdsetorcomercial
            ELSE a.relt_cdsetorcomercial
        END AS relt_cdsetorcomercial,
        CASE
            WHEN (a.relt_nnquadra IS NULL) THEN b.reih_nnquadra
            ELSE a.relt_nnquadra
        END AS relt_nnquadra,
        CASE
            WHEN (a.iper_id IS NULL) THEN b.iper_id
            ELSE a.iper_id
        END AS iper_id,
        CASE
            WHEN (a.last_id IS NULL) THEN b.last_id
            ELSE a.last_id
        END AS last_id,
        CASE
            WHEN (a.lest_id IS NULL) THEN b.lest_id
            ELSE a.lest_id
        END AS lest_id,
        CASE
            WHEN (a.catg_id IS NULL) THEN b.catg_id
            ELSE a.catg_id
        END AS catg_id,
        CASE
            WHEN (a.scat_id IS NULL) THEN b.scat_id
            ELSE a.scat_id
        END AS scat_id,
        CASE
            WHEN (a.epod_id IS NULL) THEN b.epod_id
            ELSE a.epod_id
        END AS epod_id,
        CASE
            WHEN (a.cltp_id IS NULL) THEN b.cltp_id
            ELSE a.cltp_id
        END AS cltp_id,
        CASE
            WHEN (a.lapf_id IS NULL) THEN b.lapf_id
            ELSE a.lapf_id
        END AS lapf_id,
        CASE
            WHEN (a.lepf_id IS NULL) THEN b.lepf_id
            ELSE a.lepf_id
        END AS lepf_id,
        CASE
            WHEN (a.relt_qtvisitas_realizadas IS NULL) THEN (0)::bigint
            ELSE a.relt_qtvisitas_realizadas
        END AS relt_qtvisitas_realizadas,
        CASE
            WHEN (a.relt_qtleituras_efetuadas IS NULL) THEN (0)::bigint
            ELSE a.relt_qtleituras_efetuadas
        END AS relt_qtleituras_efetuadas,
        CASE
            WHEN (a.relt_qtleituras_com_anormalidade_hidrometro IS NULL) THEN (0)::bigint
            ELSE a.relt_qtleituras_com_anormalidade_hidrometro
        END AS relt_qtleituras_com_anormalidade_hidrometro,
        CASE
            WHEN (b.reih_qthidrometro_instalado_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_instalado_ramal
        END AS reih_qthidrometro_instalado_ramal,
        CASE
            WHEN (b.reih_qthidrometro_substituido_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_substituido_ramal
        END AS reih_qthidrometro_substituido_ramal,
        CASE
            WHEN (b.reih_qthidrometro_remanejado_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_remanejado_ramal
        END AS reih_qthidrometro_remanejado_ramal,
        CASE
            WHEN (b.reih_qthidrometro_retirado_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_retirado_ramal
        END AS reih_qthidrometro_retirado_ramal,
        CASE
            WHEN (b.reih_qthidrometrosatualinstaladosramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometrosatualinstaladosramal
        END AS reih_qthidrometrosatualinstaladosramal,
        CASE
            WHEN (b.reih_qthidrometro_instalado_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_instalado_poco
        END AS reih_qthidrometro_instalado_poco,
        CASE
            WHEN (b.reih_qthidrometro_substituido_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_substituido_poco
        END AS reih_qthidrometro_substituido_poco,
        CASE
            WHEN (b.reih_qthidrometro_remanejado_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_remanejado_poco
        END AS reih_qthidrometro_remanejado_poco,
        CASE
            WHEN (b.reih_qthidrometro_retirado_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_retirado_poco
        END AS reih_qthidrometro_retirado_poco,
        CASE
            WHEN (b.reih_qthidrometrosatualinstaladospoco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometrosatualinstaladospoco
        END AS reih_qthidrometrosatualinstaladospoco,
        CASE
            WHEN (b.reih_qthidrometro_dadosatualizados IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_dadosatualizados
        END AS reih_qthidrometro_dadosatualizados
   FROM (vw_un_resumo_indicador_leitura_anormalidade a
     FULL JOIN vw_un_resumo_indicador_hidrometro b ON ((((((((((((((((((((a.relt_amreferencia = b.reih_amreferencia) AND (a.greg_id = b.greg_id)) AND (a.uneg_id = b.uneg_id)) AND (a.loca_id = b.loca_id)) AND (a.loca_cdelo = b.loca_cdelo)) AND (a.stcm_id = b.stcm_id)) AND (a.qdra_id = b.qdra_id)) AND (a.rota_id = b.rota_id)) AND (a.relt_cdsetorcomercial = b.reih_cdsetorcomercial)) AND (a.relt_nnquadra = b.reih_nnquadra)) AND (a.iper_id = b.iper_id)) AND (a.last_id = b.last_id)) AND (a.lest_id = b.lest_id)) AND (a.catg_id = b.catg_id)) AND (a.scat_id = b.scat_id)) AND (a.epod_id = b.epod_id)) AND (a.cltp_id = b.cltp_id)) AND (a.lapf_id = b.lapf_id)) AND (a.lepf_id = b.lepf_id))));


ALTER TABLE vw_un_resumo_indicador_anormalidade_hidrometro OWNER TO gsan_admin;

--
-- TOC entry 432 (class 1259 OID 848910)
-- Name: vw_un_resi_des_mmd; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resi_des_mmd AS
 SELECT
        CASE
            WHEN (a.reca_amreferencia IS NULL) THEN b.relt_amreferencia
            ELSE a.reca_amreferencia
        END AS reca_amreferencia,
        CASE
            WHEN (a.reca_amreferencia IS NULL) THEN b.relt_anoreferencia
            ELSE a.reca_anoreferencia
        END AS reca_anoreferencia,
        CASE
            WHEN (a.reca_amreferencia IS NULL) THEN b.relt_mesreferencia
            ELSE a.reca_mesreferencia
        END AS reca_mesreferencia,
        CASE
            WHEN (a.greg_id IS NULL) THEN b.greg_id
            ELSE a.greg_id
        END AS greg_id,
        CASE
            WHEN (a.uneg_id IS NULL) THEN b.uneg_id
            ELSE a.uneg_id
        END AS uneg_id,
        CASE
            WHEN (a.loca_id IS NULL) THEN b.loca_id
            ELSE a.loca_id
        END AS loca_id,
        CASE
            WHEN (a.loca_cdelo IS NULL) THEN b.loca_cdelo
            ELSE a.loca_cdelo
        END AS loca_cdelo,
        CASE
            WHEN (a.stcm_id IS NULL) THEN b.stcm_id
            ELSE a.stcm_id
        END AS stcm_id,
        CASE
            WHEN (a.qdra_id IS NULL) THEN b.qdra_id
            ELSE a.qdra_id
        END AS qdra_id,
        CASE
            WHEN (a.rota_id IS NULL) THEN b.rota_id
            ELSE a.rota_id
        END AS rota_id,
        CASE
            WHEN (a.reca_cdsetorcomercial IS NULL) THEN b.relt_cdsetorcomercial
            ELSE a.reca_cdsetorcomercial
        END AS reca_cdsetorcomercial,
        CASE
            WHEN (a.reca_nnquadra IS NULL) THEN b.relt_nnquadra
            ELSE a.reca_nnquadra
        END AS reca_nnquadra,
        CASE
            WHEN (a.iper_id IS NULL) THEN b.iper_id
            ELSE a.iper_id
        END AS iper_id,
        CASE
            WHEN (a.last_id IS NULL) THEN b.last_id
            ELSE a.last_id
        END AS last_id,
        CASE
            WHEN (a.lest_id IS NULL) THEN b.lest_id
            ELSE a.lest_id
        END AS lest_id,
        CASE
            WHEN (a.catg_id IS NULL) THEN b.catg_id
            ELSE a.catg_id
        END AS catg_id,
        CASE
            WHEN (a.scat_id IS NULL) THEN b.scat_id
            ELSE a.scat_id
        END AS scat_id,
        CASE
            WHEN (a.epod_id IS NULL) THEN b.epod_id
            ELSE a.epod_id
        END AS epod_id,
        CASE
            WHEN (a.cltp_id IS NULL) THEN b.cltp_id
            ELSE a.cltp_id
        END AS cltp_id,
        CASE
            WHEN (a.lapf_id IS NULL) THEN b.lapf_id
            ELSE a.lapf_id
        END AS lapf_id,
        CASE
            WHEN (a.lepf_id IS NULL) THEN b.lepf_id
            ELSE a.lepf_id
        END AS lepf_id,
        CASE
            WHEN (a.reca_qtligacoes_ativas IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_ativas
        END AS reca_qtligacoes_ativas,
        CASE
            WHEN (a.reca_qtligacoes_com_hidrometro IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_com_hidrometro
        END AS reca_qtligacoes_com_hidrometro,
        CASE
            WHEN (a.reca_qtligacoes_com_medicao_real IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_com_medicao_real
        END AS reca_qtligacoes_com_medicao_real,
        CASE
            WHEN (a.reca_qtligacoes_com_hidrometro_e_medicao_estimada IS NULL) THEN (0)::bigint
            ELSE a.reca_qtligacoes_com_hidrometro_e_medicao_estimada
        END AS reca_qtligacoes_com_hidrometro_e_medicao_estimada,
        CASE
            WHEN (a.reca_qteconomias_ativas IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_ativas
        END AS reca_qteconomias_ativas,
        CASE
            WHEN (a.reca_qteconomias_com_hidrometro IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_com_hidrometro
        END AS reca_qteconomias_com_hidrometro,
        CASE
            WHEN (a.reca_qteconomias_com_medicao_real IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_com_medicao_real
        END AS reca_qteconomias_com_medicao_real,
        CASE
            WHEN (a.reca_qteconomias_com_hidrometro_e_medicao_estimada IS NULL) THEN (0)::bigint
            ELSE a.reca_qteconomias_com_hidrometro_e_medicao_estimada
        END AS reca_qteconomias_com_hidrometro_e_medicao_estimada,
        CASE
            WHEN (a.reca_consumoagua_ativas IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_ativas
        END AS reca_consumoagua_ativas,
        CASE
            WHEN (a.reca_consumoagua_com_hidrometro IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_com_hidrometro
        END AS reca_consumoagua_com_hidrometro,
        CASE
            WHEN (a.reca_consumoagua_com_medicao_real IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_com_medicao_real
        END AS reca_consumoagua_com_medicao_real,
        CASE
            WHEN (a.reca_consumoagua_com_hidrometro_e_medicao_estimada IS NULL) THEN (0)::bigint
            ELSE a.reca_consumoagua_com_hidrometro_e_medicao_estimada
        END AS reca_consumoagua_com_hidrometro_e_medicao_estimada,
        CASE
            WHEN (a.reca_vofaturadoagua IS NULL) THEN (0)::bigint
            ELSE a.reca_vofaturadoagua
        END AS reca_vofaturadoagua,
        CASE
            WHEN (a.reca_vofaturadoaguamedido IS NULL) THEN (0)::bigint
            ELSE a.reca_vofaturadoaguamedido
        END AS reca_vofaturadoaguamedido,
        CASE
            WHEN (a.reca_vofaturadoaguanaomedido IS NULL) THEN (0)::bigint
            ELSE a.reca_vofaturadoaguanaomedido
        END AS reca_vofaturadoaguanaomedido,
        CASE
            WHEN (a.rece_qtligacoes IS NULL) THEN (0)::bigint
            ELSE a.rece_qtligacoes
        END AS rece_qtligacoes,
        CASE
            WHEN (a.rece_qteconomias IS NULL) THEN (0)::bigint
            ELSE a.rece_qteconomias
        END AS rece_qteconomias,
        CASE
            WHEN (a.rece_voesgoto IS NULL) THEN (0)::bigint
            ELSE a.rece_voesgoto
        END AS rece_voesgoto,
        CASE
            WHEN (a.rece_vofaturadoesgoto IS NULL) THEN (0)::bigint
            ELSE a.rece_vofaturadoesgoto
        END AS rece_vofaturadoesgoto,
        CASE
            WHEN (a.rece_vofaturadoesgotomedido IS NULL) THEN (0)::bigint
            ELSE a.rece_vofaturadoesgotomedido
        END AS rece_vofaturadoesgotomedido,
        CASE
            WHEN (a.rece_vofaturadoesgotonaomedido IS NULL) THEN (0)::bigint
            ELSE a.rece_vofaturadoesgotonaomedido
        END AS rece_vofaturadoesgotonaomedido,
        CASE
            WHEN (b.relt_qtvisitas_realizadas IS NULL) THEN (0)::bigint
            ELSE b.relt_qtvisitas_realizadas
        END AS relt_qtvisitas_realizadas,
        CASE
            WHEN (b.relt_qtleituras_efetuadas IS NULL) THEN (0)::bigint
            ELSE b.relt_qtleituras_efetuadas
        END AS relt_qtleituras_efetuadas,
        CASE
            WHEN (b.relt_qtleituras_com_anormalidade_hidrometro IS NULL) THEN (0)::bigint
            ELSE b.relt_qtleituras_com_anormalidade_hidrometro
        END AS relt_qtleituras_com_anormalidade_hidrometro,
        CASE
            WHEN (b.reih_qthidrometro_instalado_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_instalado_ramal
        END AS reih_qthidrometro_instalado_ramal,
        CASE
            WHEN (b.reih_qthidrometro_substituido_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_substituido_ramal
        END AS reih_qthidrometro_substituido_ramal,
        CASE
            WHEN (b.reih_qthidrometro_remanejado_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_remanejado_ramal
        END AS reih_qthidrometro_remanejado_ramal,
        CASE
            WHEN (b.reih_qthidrometro_retirado_ramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_retirado_ramal
        END AS reih_qthidrometro_retirado_ramal,
        CASE
            WHEN (b.reih_qthidrometrosatualinstaladosramal IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometrosatualinstaladosramal
        END AS reih_qthidrometrosatualinstaladosramal,
        CASE
            WHEN (b.reih_qthidrometro_instalado_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_instalado_poco
        END AS reih_qthidrometro_instalado_poco,
        CASE
            WHEN (b.reih_qthidrometro_substituido_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_substituido_poco
        END AS reih_qthidrometro_substituido_poco,
        CASE
            WHEN (b.reih_qthidrometro_remanejado_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_remanejado_poco
        END AS reih_qthidrometro_remanejado_poco,
        CASE
            WHEN (b.reih_qthidrometro_retirado_poco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_retirado_poco
        END AS reih_qthidrometro_retirado_poco,
        CASE
            WHEN (b.reih_qthidrometrosatualinstaladospoco IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometrosatualinstaladospoco
        END AS reih_qthidrometrosatualinstaladospoco,
        CASE
            WHEN (b.reih_qthidrometro_dadosatualizados IS NULL) THEN (0)::bigint
            ELSE b.reih_qthidrometro_dadosatualizados
        END AS reih_qthidrometro_dadosatualizados
   FROM (vw_un_resumo_indicador_agua_esgoto a
     FULL JOIN vw_un_resumo_indicador_anormalidade_hidrometro b ON ((((((((((((((((((((a.reca_amreferencia = b.relt_amreferencia) AND (a.greg_id = b.greg_id)) AND (a.uneg_id = b.uneg_id)) AND (a.loca_id = b.loca_id)) AND (a.loca_cdelo = b.loca_cdelo)) AND (a.stcm_id = b.stcm_id)) AND (a.qdra_id = b.qdra_id)) AND (a.rota_id = b.rota_id)) AND (a.reca_cdsetorcomercial = b.relt_cdsetorcomercial)) AND (a.reca_nnquadra = b.relt_nnquadra)) AND (a.iper_id = b.iper_id)) AND (a.last_id = b.last_id)) AND (a.lest_id = b.lest_id)) AND (a.catg_id = b.catg_id)) AND (a.scat_id = b.scat_id)) AND (a.epod_id = b.epod_id)) AND (a.cltp_id = b.cltp_id)) AND (a.lapf_id = b.lapf_id)) AND (a.lepf_id = b.lepf_id))));


ALTER TABLE vw_un_resi_des_mmd OWNER TO gsan_admin;

--
-- TOC entry 433 (class 1259 OID 848915)
-- Name: vw_un_resumo_indicador_faturamento; Type: VIEW; Schema: micromedicao; Owner: gsan_admin
--

CREATE VIEW vw_un_resumo_indicador_faturamento AS
 SELECT b.refa_id,
    b.refa_amreferencia,
    substr((b.refa_amreferencia)::text, 1, 4) AS refa_anoreferencia,
        CASE
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '01'::text) THEN '01-Jan'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '02'::text) THEN '02-Fev'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '03'::text) THEN '03-Mar'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '04'::text) THEN '04-Abr'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '05'::text) THEN '05-Mai'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '06'::text) THEN '06-Jun'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '07'::text) THEN '07-Jul'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '08'::text) THEN '08-Ago'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '09'::text) THEN '09-Set'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '10'::text) THEN '10-Out'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '11'::text) THEN '11-Nov'::text
            WHEN (substr((b.refa_amreferencia)::text, 5, 2) = '12'::text) THEN '12-Dez'::text
            ELSE ''::text
        END AS refa_mesreferencia,
    b.greg_id,
    b.uneg_id,
    b.loca_id,
    b.loca_cdelo,
    b.stcm_id,
    b.qdra_id,
    b.rota_id,
    b.refa_cdsetorcomercial,
    b.refa_nnquadra,
    b.iper_id,
    b.last_id,
    b.lest_id,
    b.catg_id,
    b.scat_id,
    b.epod_id,
    b.cltp_id,
    b.lapf_id,
    b.lepf_id,
    b.refa_qtcontasemitidas,
        CASE
            WHEN (b.refa_ichidrometro = 1) THEN b.refa_qtcontasemitidas
            ELSE 0
        END AS refa_qtcontasemitidascomhidrometro,
        CASE
            WHEN (b.refa_ichidrometro = 2) THEN b.refa_qtcontasemitidas
            ELSE 0
        END AS refa_qtcontasemitidassemhidrometro,
    b.refa_qteconomiasfaturadas,
        CASE
            WHEN (b.refa_ichidrometro = 1) THEN b.refa_qteconomiasfaturadas
            ELSE 0
        END AS refa_qteconomiasfaturadascomhidrometro,
        CASE
            WHEN (b.refa_ichidrometro = 2) THEN b.refa_qteconomiasfaturadas
            ELSE 0
        END AS refa_qteconomiasfaturadassemhidrometro,
    b.refa_vofaturadoagua,
        CASE
            WHEN (b.refa_ichidrometro = 1) THEN b.refa_vofaturadoagua
            ELSE 0
        END AS refa_vofaturadoaguamedido,
        CASE
            WHEN (b.refa_ichidrometro = 2) THEN b.refa_vofaturadoagua
            ELSE 0
        END AS refa_vofaturadoaguanaomedido,
    b.refa_vofaturadoesgoto,
        CASE
            WHEN (b.refa_ichidrometro = 1) THEN b.refa_vofaturadoesgoto
            ELSE 0
        END AS refa_vofaturadoesgotomedido,
        CASE
            WHEN (b.refa_ichidrometro = 2) THEN b.refa_vofaturadoesgoto
            ELSE 0
        END AS refa_vofaturadoesgotonaomedido,
    b.refa_tmultimaalteracao
   FROM faturamento.un_resumo_faturamento b;


ALTER TABLE vw_un_resumo_indicador_faturamento OWNER TO gsan_admin;

SET search_path = myschema, pg_catalog;

--
-- TOC entry 434 (class 1259 OID 848920)
-- Name: foo; Type: TABLE; Schema: myschema; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE foo (
    f1 integer NOT NULL,
    f2 text NOT NULL,
    f3 text[]
);


ALTER TABLE foo OWNER TO gsan_admin;

SET search_path = operacional, pg_catalog;

--
-- TOC entry 435 (class 1259 OID 848926)
-- Name: g_distrito_operacional; Type: TABLE; Schema: operacional; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE g_distrito_operacional (
    diop_id integer NOT NULL,
    diop_dsdistritooperacional character varying(30),
    diop_dsabreviado character(3),
    diop_icuso smallint,
    diop_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE g_distrito_operacional OWNER TO gsan_admin;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 435
-- Name: COLUMN g_distrito_operacional.diop_id; Type: COMMENT; Schema: operacional; Owner: gsan_admin
--

COMMENT ON COLUMN g_distrito_operacional.diop_id IS 'id do distrito operacional';


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 435
-- Name: COLUMN g_distrito_operacional.diop_dsdistritooperacional; Type: COMMENT; Schema: operacional; Owner: gsan_admin
--

COMMENT ON COLUMN g_distrito_operacional.diop_dsdistritooperacional IS 'descrição do distrito operacional ';


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 435
-- Name: COLUMN g_distrito_operacional.diop_dsabreviado; Type: COMMENT; Schema: operacional; Owner: gsan_admin
--

COMMENT ON COLUMN g_distrito_operacional.diop_dsabreviado IS 'descricao abreviado';


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 435
-- Name: COLUMN g_distrito_operacional.diop_icuso; Type: COMMENT; Schema: operacional; Owner: gsan_admin
--

COMMENT ON COLUMN g_distrito_operacional.diop_icuso IS 'indicador de uso';


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 435
-- Name: COLUMN g_distrito_operacional.diop_tmultimaalteracao; Type: COMMENT; Schema: operacional; Owner: gsan_admin
--

COMMENT ON COLUMN g_distrito_operacional.diop_tmultimaalteracao IS 'ultima alteracao';


--
-- TOC entry 436 (class 1259 OID 848930)
-- Name: vw_distrito_operacional; Type: VIEW; Schema: operacional; Owner: gsan_admin
--

CREATE VIEW vw_distrito_operacional AS
 SELECT table1.diop_id,
    table1.stab_id,
    table1.diop_dsdistritooperacional,
    table1.diop_dsabreviado,
    table1.diop_icuso,
    table1.zabs_id,
    table1.diop_tmultimaalteracao
   FROM public.dblink('dbname=comercial hostaddr=127.0.0.1
user=gsan_olap password= ol@p port=5432'::text, 'select * from operacional.distrito_operacional'::text) table1(diop_id integer, stab_id integer, diop_dsdistritooperacional character varying(30), diop_dsabreviado character(3), diop_icuso smallint, zabs_id integer, diop_tmultimaalteracao timestamp without time zone);


ALTER TABLE vw_distrito_operacional OWNER TO gsan_admin;

SET search_path = public, pg_catalog;

--
-- TOC entry 437 (class 1259 OID 848934)
-- Name: foo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE foo (
    f1 integer NOT NULL,
    f2 text NOT NULL,
    f3 text[]
);


ALTER TABLE foo OWNER TO postgres;

--
-- TOC entry 438 (class 1259 OID 848940)
-- Name: myremote_pg_proc; Type: VIEW; Schema: public; Owner: gsan_admin
--

CREATE VIEW myremote_pg_proc AS
 SELECT t1.cd_rota
   FROM dblink('dbname=comercial
		 hostaddr=10.20.100.21
                 user=postgres
                 password=C0sanpa2011.
                 port=5432'::text, 'SELECT rota_cdrota FROM micromedicao.rota;'::text) t1(cd_rota smallint);


ALTER TABLE myremote_pg_proc OWNER TO gsan_admin;

SET default_with_oids = true;

--
-- TOC entry 439 (class 1259 OID 848944)
-- Name: pg_ts_cfg; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_cfg (
    ts_name text NOT NULL,
    prs_name text NOT NULL,
    locale text
);


ALTER TABLE pg_ts_cfg OWNER TO postgres;

--
-- TOC entry 440 (class 1259 OID 848950)
-- Name: pg_ts_cfgmap; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_cfgmap (
    ts_name text NOT NULL,
    tok_alias text NOT NULL,
    dict_name text[]
);


ALTER TABLE pg_ts_cfgmap OWNER TO postgres;

--
-- TOC entry 441 (class 1259 OID 848956)
-- Name: pg_ts_dict; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_dict (
    dict_name text NOT NULL,
    dict_init regprocedure,
    dict_initoption text,
    dict_lexize regprocedure NOT NULL,
    dict_comment text
);


ALTER TABLE pg_ts_dict OWNER TO postgres;

--
-- TOC entry 442 (class 1259 OID 848962)
-- Name: pg_ts_parser; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pg_ts_parser (
    prs_name text NOT NULL,
    prs_start regprocedure NOT NULL,
    prs_nexttoken regprocedure NOT NULL,
    prs_end regprocedure NOT NULL,
    prs_headline regprocedure NOT NULL,
    prs_lextype regprocedure NOT NULL,
    prs_comment text
);


ALTER TABLE pg_ts_parser OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 443 (class 1259 OID 848968)
-- Name: un_resumo_ligacao_economia; Type: TABLE; Schema: public; Owner: gsan_admin; Tablespace: 
--

CREATE TABLE un_resumo_ligacao_economia (
    rele_id integer NOT NULL,
    rele_amreferencia integer NOT NULL,
    greg_id integer NOT NULL,
    uneg_id integer NOT NULL,
    loca_id integer NOT NULL,
    loca_cdelo integer NOT NULL,
    stcm_id integer NOT NULL,
    qdra_id integer NOT NULL,
    rota_id integer NOT NULL,
    rele_cdsetorcomercial integer NOT NULL,
    rele_nnquadra integer NOT NULL,
    iper_id integer NOT NULL,
    last_id integer NOT NULL,
    lest_id integer NOT NULL,
    catg_id integer NOT NULL,
    scat_id integer NOT NULL,
    epod_id integer NOT NULL,
    cltp_id integer NOT NULL,
    lapf_id integer NOT NULL,
    lepf_id integer NOT NULL,
    rele_ichidrometro smallint NOT NULL,
    rele_icvolumefixadoagua smallint NOT NULL,
    rele_icvolumefixadoesgoto smallint NOT NULL,
    rele_icpoco smallint NOT NULL,
    rele_qtligacoes integer NOT NULL,
    rele_qteconomias integer NOT NULL,
    rele_tmultimaalteracao timestamp without time zone DEFAULT now() NOT NULL,
    rele_ichidrometropoco smallint NOT NULL,
    cstf_id integer DEFAULT 0,
    rele_cdrota integer,
    rele_qtligacoesnovasagua integer DEFAULT 0 NOT NULL,
    rele_qtligacoesnovasesgoto integer DEFAULT 0 NOT NULL,
    rele_qtligacoescortesmes integer,
    rele_qtligacoesreligadasmes integer
);


ALTER TABLE un_resumo_ligacao_economia OWNER TO gsan_admin;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 443
-- Name: COLUMN un_resumo_ligacao_economia.rele_qtligacoesnovasagua; Type: COMMENT; Schema: public; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia.rele_qtligacoesnovasagua IS 'Quantidade de novas ligacoes de agua cadastradas no mes';


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 443
-- Name: COLUMN un_resumo_ligacao_economia.rele_qtligacoesnovasesgoto; Type: COMMENT; Schema: public; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia.rele_qtligacoesnovasesgoto IS 'Quantidade de novas ligacoes de esgoto cadastradas no mes';


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 443
-- Name: COLUMN un_resumo_ligacao_economia.rele_qtligacoescortesmes; Type: COMMENT; Schema: public; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia.rele_qtligacoescortesmes IS 'Quantidade de ligacoes de agua cortadas no mes';


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 443
-- Name: COLUMN un_resumo_ligacao_economia.rele_qtligacoesreligadasmes; Type: COMMENT; Schema: public; Owner: gsan_admin
--

COMMENT ON COLUMN un_resumo_ligacao_economia.rele_qtligacoesreligadasmes IS 'Quantidade de ligacoes de agua religadas no mes';


SET search_path = admindb, pg_catalog;

--
-- TOC entry 3957 (class 2606 OID 848996)
-- Name: db_backup_pkey; Type: CONSTRAINT; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY db_backup
    ADD CONSTRAINT db_backup_pkey PRIMARY KEY (dbbk_id);


--
-- TOC entry 3959 (class 2606 OID 848998)
-- Name: db_empresa_pkey; Type: CONSTRAINT; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY db_empresa
    ADD CONSTRAINT db_empresa_pkey PRIMARY KEY (dbem_id);


--
-- TOC entry 3961 (class 2606 OID 849000)
-- Name: db_vacuum_pkey; Type: CONSTRAINT; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY db_vacuum
    ADD CONSTRAINT db_vacuum_pkey PRIMARY KEY (dbva_id);


--
-- TOC entry 3963 (class 2606 OID 849002)
-- Name: db_versao_base_pkey; Type: CONSTRAINT; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY db_versao_base
    ADD CONSTRAINT db_versao_base_pkey PRIMARY KEY (dbvb_id);


--
-- TOC entry 3965 (class 2606 OID 849004)
-- Name: db_versao_sincronismo_pkey; Type: CONSTRAINT; Schema: admindb; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY db_versao_sincronismo
    ADD CONSTRAINT db_versao_sincronismo_pkey PRIMARY KEY (dbvf_id);


SET search_path = arrecadacao, pg_catalog;

--
-- TOC entry 3967 (class 2606 OID 849006)
-- Name: g_arrecadacao_forma_pkey; Type: CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_arrecadacao_forma
    ADD CONSTRAINT g_arrecadacao_forma_pkey PRIMARY KEY (arfm_id);


--
-- TOC entry 3969 (class 2606 OID 849008)
-- Name: g_arrecadador_pkey; Type: CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_arrecadador
    ADD CONSTRAINT g_arrecadador_pkey PRIMARY KEY (arrc_id);


--
-- TOC entry 3971 (class 2606 OID 849010)
-- Name: g_devolucao_situacao_pkey; Type: CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_devolucao_situacao
    ADD CONSTRAINT g_devolucao_situacao_pkey PRIMARY KEY (dvst_id);


--
-- TOC entry 3973 (class 2606 OID 849012)
-- Name: g_epoca_pagamento_pkey; Type: CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_epoca_pagamento
    ADD CONSTRAINT g_epoca_pagamento_pkey PRIMARY KEY (eppa_id);


--
-- TOC entry 3975 (class 2606 OID 849014)
-- Name: un_resumo_arrecadacao_pkey; Type: CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_arrecadacao
    ADD CONSTRAINT un_resumo_arrecadacao_pkey PRIMARY KEY (rear_id);


SET search_path = atendimentopublico, pg_catalog;

--
-- TOC entry 4000 (class 2606 OID 849016)
-- Name: un_resumo_registro_atendimento_pkey; Type: CONSTRAINT; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_ra
    ADD CONSTRAINT un_resumo_registro_atendimento_pkey PRIMARY KEY (rera_id);


SET search_path = cadastro, pg_catalog;

--
-- TOC entry 4021 (class 2606 OID 849018)
-- Name: g_bairro_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_bairro
    ADD CONSTRAINT g_bairro_pkey PRIMARY KEY (bair_id);


--
-- TOC entry 4025 (class 2606 OID 849020)
-- Name: g_categoria_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_categoria
    ADD CONSTRAINT g_categoria_pkey PRIMARY KEY (catg_id);


--
-- TOC entry 4028 (class 2606 OID 849022)
-- Name: g_cliente_relacao_tipo_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_cliente_relacao_tipo
    ADD CONSTRAINT g_cliente_relacao_tipo_pkey PRIMARY KEY (crtp_id);


--
-- TOC entry 4031 (class 2606 OID 849024)
-- Name: g_localidade_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_localidade
    ADD CONSTRAINT g_localidade_pkey PRIMARY KEY (loca_id);


--
-- TOC entry 4046 (class 2606 OID 849026)
-- Name: g_superintendencia_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_superintendencia
    ADD CONSTRAINT g_superintendencia_pkey PRIMARY KEY (supt_id);


--
-- TOC entry 4049 (class 2606 OID 849028)
-- Name: indicador_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY indicador
    ADD CONSTRAINT indicador_pkey PRIMARY KEY (indi_id);


--
-- TOC entry 4038 (class 2606 OID 849030)
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (muni_id);


--
-- TOC entry 4051 (class 2606 OID 849032)
-- Name: rg_resumo_ligacao_economia_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY rg_res_lig_econ
    ADD CONSTRAINT rg_resumo_ligacao_economia_pkey PRIMARY KEY (rele_id);


--
-- TOC entry 4066 (class 2606 OID 849034)
-- Name: un_resumo_ligacao_economia_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_res_lig_econ
    ADD CONSTRAINT un_resumo_ligacao_economia_pkey PRIMARY KEY (rele_id);


--
-- TOC entry 4105 (class 2606 OID 849036)
-- Name: un_resumo_ligacao_economia_ref_2007_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_ligacao_economia_ref_2007
    ADD CONSTRAINT un_resumo_ligacao_economia_ref_2007_pkey PRIMARY KEY (rele_id);


--
-- TOC entry 4126 (class 2606 OID 849038)
-- Name: un_resumo_ligacao_economia_ref_2008_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_ligacao_economia_ref_2008
    ADD CONSTRAINT un_resumo_ligacao_economia_ref_2008_pkey PRIMARY KEY (rele_id);


--
-- TOC entry 4147 (class 2606 OID 849040)
-- Name: un_resumo_ligacao_economia_ref_2009_pkey; Type: CONSTRAINT; Schema: cadastro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_ligacao_economia_ref_2009
    ADD CONSTRAINT un_resumo_ligacao_economia_ref_2009_pkey PRIMARY KEY (rele_id);


SET search_path = cobranca, pg_catalog;

--
-- TOC entry 4168 (class 2606 OID 849042)
-- Name: faixa_valor_pkey; Type: CONSTRAINT; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY faixa_valor
    ADD CONSTRAINT faixa_valor_pkey PRIMARY KEY (fxvl_id);


--
-- TOC entry 4170 (class 2606 OID 849044)
-- Name: un_resumo_indicadores_cobranca_pkey; Type: CONSTRAINT; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicadores_cobranca
    ADD CONSTRAINT un_resumo_indicadores_cobranca_pkey PRIMARY KEY (rpen_id);


--
-- TOC entry 4188 (class 2606 OID 849046)
-- Name: un_resumo_parcelamento_pkey; Type: CONSTRAINT; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_parcelamento
    ADD CONSTRAINT un_resumo_parcelamento_pkey PRIMARY KEY (repa_id);


--
-- TOC entry 4190 (class 2606 OID 849048)
-- Name: un_resumo_pendencia_pkey; Type: CONSTRAINT; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_pendencia
    ADD CONSTRAINT un_resumo_pendencia_pkey PRIMARY KEY (rpen_id);


--
-- TOC entry 4194 (class 2606 OID 849053)
-- Name: un_resumo_pendencia_sem_quadra_pkey; Type: CONSTRAINT; Schema: cobranca; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_pendencia_sem_quadra
    ADD CONSTRAINT un_resumo_pendencia_sem_quadra_pkey PRIMARY KEY (rpsq_id);


SET search_path = corporativo, pg_catalog;

--
-- TOC entry 4220 (class 2606 OID 849055)
-- Name: un_resumo_corporativo_pkey; Type: CONSTRAINT; Schema: corporativo; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_corporativo
    ADD CONSTRAINT un_resumo_corporativo_pkey PRIMARY KEY (corr_id);


SET search_path = faturamento, pg_catalog;

--
-- TOC entry 4225 (class 2606 OID 849057)
-- Name: g_fat_sit_motivo_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_fat_sit_motivo
    ADD CONSTRAINT g_fat_sit_motivo_pkey PRIMARY KEY (ftsm_id);


--
-- TOC entry 4227 (class 2606 OID 849059)
-- Name: g_faturamento_situacao_tipo_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_faturamento_situacao_tipo
    ADD CONSTRAINT g_faturamento_situacao_tipo_pkey PRIMARY KEY (ftst_id);


--
-- TOC entry 4229 (class 2606 OID 849061)
-- Name: un_resumo_faturamento_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_faturamento
    ADD CONSTRAINT un_resumo_faturamento_pkey PRIMARY KEY (refa_id);


--
-- TOC entry 4198 (class 2606 OID 849065)
-- Name: un_resumo_indicadores_faturamento_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicadores_faturamento
    ADD CONSTRAINT un_resumo_indicadores_faturamento_pkey PRIMARY KEY (refa_id);


--
-- TOC entry 4235 (class 2606 OID 849067)
-- Name: un_resumo_indicadores_faturamento_ref_2007_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicadores_faturamento_ref_2007
    ADD CONSTRAINT un_resumo_indicadores_faturamento_ref_2007_pkey PRIMARY KEY (refa_id);


--
-- TOC entry 4257 (class 2606 OID 849069)
-- Name: un_resumo_indicadores_faturamento_ref_2008_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicadores_faturamento_ref_2008
    ADD CONSTRAINT un_resumo_indicadores_faturamento_ref_2008_pkey PRIMARY KEY (refa_id);


--
-- TOC entry 4279 (class 2606 OID 849071)
-- Name: un_resumo_indicadores_faturamento_ref_2009_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicadores_faturamento_ref_2009
    ADD CONSTRAINT un_resumo_indicadores_faturamento_ref_2009_pkey PRIMARY KEY (refa_id);


--
-- TOC entry 4304 (class 2606 OID 849073)
-- Name: un_resumo_refaturamento_pkey; Type: CONSTRAINT; Schema: faturamento; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_refaturamento
    ADD CONSTRAINT un_resumo_refaturamento_pkey PRIMARY KEY (rerf_id);


SET search_path = financeiro, pg_catalog;

--
-- TOC entry 3997 (class 2606 OID 849075)
-- Name: g_lancamento_item_contabil_pkey; Type: CONSTRAINT; Schema: financeiro; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_lancamento_item_contabil
    ADD CONSTRAINT g_lancamento_item_contabil_pkey PRIMARY KEY (lict_id);


SET search_path = micromedicao, pg_catalog;

--
-- TOC entry 4306 (class 2606 OID 849077)
-- Name: g_leitura_anormalidade_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_leitura_anormalidade
    ADD CONSTRAINT g_leitura_anormalidade_pkey PRIMARY KEY (ltan_id);


--
-- TOC entry 4308 (class 2606 OID 849079)
-- Name: leitura_anormalidade_consumo_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_leitura_anormalidade_consumo
    ADD CONSTRAINT leitura_anormalidade_consumo_pkey PRIMARY KEY (lacs_id);


--
-- TOC entry 4310 (class 2606 OID 849081)
-- Name: leitura_anormalidade_leitura_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_leitura_anormalidade_leitura
    ADD CONSTRAINT leitura_anormalidade_leitura_pkey PRIMARY KEY (lalt_id);


--
-- TOC entry 4312 (class 2606 OID 849083)
-- Name: rota_pkey_g; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY g_rota
    ADD CONSTRAINT rota_pkey_g PRIMARY KEY (rota_id);


--
-- TOC entry 4378 (class 2606 OID 849085)
-- Name: un_resumo_coleta_esgoto_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_coleta_esgoto
    ADD CONSTRAINT un_resumo_coleta_esgoto_pkey PRIMARY KEY (rece_id);


--
-- TOC entry 4398 (class 2606 OID 849087)
-- Name: un_resumo_consumo_agua_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_consumo_agua
    ADD CONSTRAINT un_resumo_consumo_agua_pkey PRIMARY KEY (reca_id);


--
-- TOC entry 4418 (class 2606 OID 849089)
-- Name: un_resumo_hidrometro_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_hidrometro
    ADD CONSTRAINT un_resumo_hidrometro_pkey PRIMARY KEY (rehi_id);


--
-- TOC entry 4359 (class 2606 OID 849091)
-- Name: un_resumo_indicador_desempenho_micromedicao_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resi_des_mmd
    ADD CONSTRAINT un_resumo_indicador_desempenho_micromedicao_pkey PRIMARY KEY (reca_id);


--
-- TOC entry 4426 (class 2606 OID 849093)
-- Name: un_resumo_indicador_desempenho_micromedicao_ref_2007_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicador_desempenho_micromedicao_ref_2007
    ADD CONSTRAINT un_resumo_indicador_desempenho_micromedicao_ref_2007_pkey PRIMARY KEY (reca_id);


--
-- TOC entry 4445 (class 2606 OID 849095)
-- Name: un_resumo_indicador_desempenho_micromedicao_ref_2008_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicador_desempenho_micromedicao_ref_2008
    ADD CONSTRAINT un_resumo_indicador_desempenho_micromedicao_ref_2008_pkey PRIMARY KEY (reca_id);


--
-- TOC entry 4464 (class 2606 OID 849097)
-- Name: un_resumo_indicador_desempenho_micromedicao_ref_2009_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_indicador_desempenho_micromedicao_ref_2009
    ADD CONSTRAINT un_resumo_indicador_desempenho_micromedicao_ref_2009_pkey PRIMARY KEY (reca_id);


--
-- TOC entry 4316 (class 2606 OID 849099)
-- Name: un_resumo_instalacao_hidrometro_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_res_ins_hidr
    ADD CONSTRAINT un_resumo_instalacao_hidrometro_pkey PRIMARY KEY (reih_id);


--
-- TOC entry 4335 (class 2606 OID 849101)
-- Name: un_resumo_leitura_anormalidade_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_res_lt_anorm
    ADD CONSTRAINT un_resumo_leitura_anormalidade_pkey PRIMARY KEY (relt_id);


--
-- TOC entry 4357 (class 2606 OID 849103)
-- Name: un_resumo_metas_acumulado_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_res_mt_acum
    ADD CONSTRAINT un_resumo_metas_acumulado_pkey PRIMARY KEY (rema_id);


--
-- TOC entry 4483 (class 2606 OID 849105)
-- Name: un_resumo_metas_pkey; Type: CONSTRAINT; Schema: micromedicao; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_metas
    ADD CONSTRAINT un_resumo_metas_pkey PRIMARY KEY (remt_id);


SET search_path = myschema, pg_catalog;

--
-- TOC entry 4485 (class 2606 OID 849107)
-- Name: foo_pkey; Type: CONSTRAINT; Schema: myschema; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY foo
    ADD CONSTRAINT foo_pkey PRIMARY KEY (f1, f2);


SET search_path = public, pg_catalog;

--
-- TOC entry 4487 (class 2606 OID 849109)
-- Name: foo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY foo
    ADD CONSTRAINT foo_pkey PRIMARY KEY (f1, f2);


--
-- TOC entry 4489 (class 2606 OID 849111)
-- Name: pg_ts_cfg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfg
    ADD CONSTRAINT pg_ts_cfg_pkey PRIMARY KEY (ts_name);


--
-- TOC entry 4491 (class 2606 OID 849113)
-- Name: pg_ts_cfgmap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfgmap
    ADD CONSTRAINT pg_ts_cfgmap_pkey PRIMARY KEY (ts_name, tok_alias);


--
-- TOC entry 4493 (class 2606 OID 849115)
-- Name: pg_ts_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_dict
    ADD CONSTRAINT pg_ts_dict_pkey PRIMARY KEY (dict_name);


--
-- TOC entry 4495 (class 2606 OID 849117)
-- Name: pg_ts_parser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pg_ts_parser
    ADD CONSTRAINT pg_ts_parser_pkey PRIMARY KEY (prs_name);


--
-- TOC entry 4497 (class 2606 OID 849119)
-- Name: un_resumo_ligacao_economia_pkey; Type: CONSTRAINT; Schema: public; Owner: gsan_admin; Tablespace: 
--

ALTER TABLE ONLY un_resumo_ligacao_economia
    ADD CONSTRAINT un_resumo_ligacao_economia_pkey PRIMARY KEY (rele_id);


SET search_path = arrecadacao, pg_catalog;

SET default_tablespace = indices;

--
-- TOC entry 3976 (class 1259 OID 849120)
-- Name: xfk10_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (epod_id);


--
-- TOC entry 3977 (class 1259 OID 849121)
-- Name: xfk11_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (cltp_id);


--
-- TOC entry 3978 (class 1259 OID 849122)
-- Name: xfk12_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (catg_id);


--
-- TOC entry 3979 (class 1259 OID 849123)
-- Name: xfk13_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (scat_id);


--
-- TOC entry 3980 (class 1259 OID 849124)
-- Name: xfk14_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (eppa_id);


--
-- TOC entry 3981 (class 1259 OID 849125)
-- Name: xfk15_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (dotp_id);


--
-- TOC entry 3982 (class 1259 OID 849126)
-- Name: xfk16_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (loca_cdelo);


--
-- TOC entry 3983 (class 1259 OID 849127)
-- Name: xfk17_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (lest_id);


--
-- TOC entry 3984 (class 1259 OID 849128)
-- Name: xfk18_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk18_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (rota_id);


--
-- TOC entry 3985 (class 1259 OID 849129)
-- Name: xfk19_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk19_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (pgst_id);


--
-- TOC entry 3986 (class 1259 OID 849130)
-- Name: xfk1_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (greg_id);


--
-- TOC entry 3987 (class 1259 OID 849131)
-- Name: xfk2_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (last_id);


--
-- TOC entry 3988 (class 1259 OID 849132)
-- Name: xfk3_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (loca_id);


--
-- TOC entry 3989 (class 1259 OID 849133)
-- Name: xfk4_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (uneg_id);


--
-- TOC entry 3990 (class 1259 OID 849134)
-- Name: xfk5_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (lapf_id);


--
-- TOC entry 3991 (class 1259 OID 849135)
-- Name: xfk6_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (stcm_id);


--
-- TOC entry 3992 (class 1259 OID 849136)
-- Name: xfk7_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (qdra_id);


--
-- TOC entry 3993 (class 1259 OID 849137)
-- Name: xfk8_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (lepf_id);


--
-- TOC entry 3994 (class 1259 OID 849138)
-- Name: xfk9_un_resumo_arrecadacao_agua_esgoto; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_arrecadacao_agua_esgoto ON un_resumo_arrecadacao USING btree (iper_id);


--
-- TOC entry 3995 (class 1259 OID 849139)
-- Name: xix1_un_resumo_arrecadacao; Type: INDEX; Schema: arrecadacao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_arrecadacao ON un_resumo_arrecadacao USING btree (rear_amreferencia, rear_amreferenciadocumento);


SET search_path = atendimentopublico, pg_catalog;

--
-- TOC entry 4001 (class 1259 OID 849140)
-- Name: xfk10_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_registro_atendimento ON un_resumo_ra USING btree (uneg_id);


--
-- TOC entry 4002 (class 1259 OID 849141)
-- Name: xfk11_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_registro_atendimento ON un_resumo_ra USING btree (loca_id);


--
-- TOC entry 4003 (class 1259 OID 849142)
-- Name: xfk12_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_registro_atendimento ON un_resumo_ra USING btree (lest_id);


--
-- TOC entry 4004 (class 1259 OID 849143)
-- Name: xfk13_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_registro_atendimento ON un_resumo_ra USING btree (last_id);


--
-- TOC entry 4005 (class 1259 OID 849144)
-- Name: xfk14_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_registro_atendimento ON un_resumo_ra USING btree (greg_id);


--
-- TOC entry 4006 (class 1259 OID 849145)
-- Name: xfk15_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_registro_atendimento ON un_resumo_ra USING btree (step_id);


--
-- TOC entry 4007 (class 1259 OID 849146)
-- Name: xfk16_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_registro_atendimento ON un_resumo_ra USING btree (sotp_id);


--
-- TOC entry 4008 (class 1259 OID 849147)
-- Name: xfk17_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_registro_atendimento ON un_resumo_ra USING btree (meso_id);


--
-- TOC entry 4009 (class 1259 OID 849148)
-- Name: xfk18_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk18_un_resumo_registro_atendimento ON un_resumo_ra USING btree (loca_cdelo);


--
-- TOC entry 4010 (class 1259 OID 849149)
-- Name: xfk19_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk19_un_resumo_registro_atendimento ON un_resumo_ra USING btree (rota_id);


--
-- TOC entry 4011 (class 1259 OID 849150)
-- Name: xfk1_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_registro_atendimento ON un_resumo_ra USING btree (scat_id);


--
-- TOC entry 4012 (class 1259 OID 849151)
-- Name: xfk2_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_registro_atendimento ON un_resumo_ra USING btree (catg_id);


--
-- TOC entry 4013 (class 1259 OID 849152)
-- Name: xfk3_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_registro_atendimento ON un_resumo_ra USING btree (epod_id);


--
-- TOC entry 4014 (class 1259 OID 849153)
-- Name: xfk4_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_registro_atendimento ON un_resumo_ra USING btree (iper_id);


--
-- TOC entry 4015 (class 1259 OID 849154)
-- Name: xfk5_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_registro_atendimento ON un_resumo_ra USING btree (cltp_id);


--
-- TOC entry 4016 (class 1259 OID 849155)
-- Name: xfk6_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_registro_atendimento ON un_resumo_ra USING btree (qdra_id);


--
-- TOC entry 4017 (class 1259 OID 849156)
-- Name: xfk7_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_registro_atendimento ON un_resumo_ra USING btree (stcm_id);


--
-- TOC entry 4018 (class 1259 OID 849157)
-- Name: xfk8_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_registro_atendimento ON un_resumo_ra USING btree (lepf_id);


--
-- TOC entry 4019 (class 1259 OID 849158)
-- Name: xfk9_un_resumo_registro_atendimento; Type: INDEX; Schema: atendimentopublico; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_registro_atendimento ON un_resumo_ra USING btree (lapf_id);


SET search_path = cadastro, pg_catalog;

--
-- TOC entry 4087 (class 1259 OID 849159)
-- Name: xfk01_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (lepf_id);


--
-- TOC entry 4088 (class 1259 OID 849160)
-- Name: xfk02_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (lapf_id);


--
-- TOC entry 4089 (class 1259 OID 849161)
-- Name: xfk03_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (cltp_id);


--
-- TOC entry 4090 (class 1259 OID 849162)
-- Name: xfk04_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (epod_id);


--
-- TOC entry 4091 (class 1259 OID 849163)
-- Name: xfk05_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk05_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (scat_id);


--
-- TOC entry 4092 (class 1259 OID 849164)
-- Name: xfk06_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (catg_id);


--
-- TOC entry 4093 (class 1259 OID 849165)
-- Name: xfk07_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (lest_id);


--
-- TOC entry 4094 (class 1259 OID 849166)
-- Name: xfk08_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (last_id);


--
-- TOC entry 4095 (class 1259 OID 849167)
-- Name: xfk09_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk09_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (qdra_id);


--
-- TOC entry 4052 (class 1259 OID 849168)
-- Name: xfk10_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (iper_id);


--
-- TOC entry 4096 (class 1259 OID 849169)
-- Name: xfk10_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (iper_id);


--
-- TOC entry 4067 (class 1259 OID 849170)
-- Name: xfk10_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (iper_id);


--
-- TOC entry 4106 (class 1259 OID 849171)
-- Name: xfk10_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (iper_id);


--
-- TOC entry 4127 (class 1259 OID 849172)
-- Name: xfk10_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (iper_id);


--
-- TOC entry 4148 (class 1259 OID 849173)
-- Name: xfk10_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (iper_id);


--
-- TOC entry 4053 (class 1259 OID 849174)
-- Name: xfk11_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (bair_id);


--
-- TOC entry 4097 (class 1259 OID 849175)
-- Name: xfk11_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (stcm_id);


--
-- TOC entry 4068 (class 1259 OID 849176)
-- Name: xfk11_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (stcm_id);


--
-- TOC entry 4107 (class 1259 OID 849177)
-- Name: xfk11_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (stcm_id);


--
-- TOC entry 4128 (class 1259 OID 849178)
-- Name: xfk11_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (stcm_id);


--
-- TOC entry 4149 (class 1259 OID 849179)
-- Name: xfk11_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (stcm_id);


--
-- TOC entry 4054 (class 1259 OID 849180)
-- Name: xfk12_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (mreg_id);


--
-- TOC entry 4098 (class 1259 OID 849181)
-- Name: xfk12_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (loca_id);


--
-- TOC entry 4069 (class 1259 OID 849182)
-- Name: xfk12_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (loca_id);


--
-- TOC entry 4108 (class 1259 OID 849183)
-- Name: xfk12_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (loca_id);


--
-- TOC entry 4129 (class 1259 OID 849184)
-- Name: xfk12_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (loca_id);


--
-- TOC entry 4150 (class 1259 OID 849185)
-- Name: xfk12_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (loca_id);


--
-- TOC entry 4099 (class 1259 OID 849186)
-- Name: xfk13_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (uneg_id);


--
-- TOC entry 4070 (class 1259 OID 849187)
-- Name: xfk13_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (uneg_id);


--
-- TOC entry 4109 (class 1259 OID 849188)
-- Name: xfk13_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (uneg_id);


--
-- TOC entry 4130 (class 1259 OID 849189)
-- Name: xfk13_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (uneg_id);


--
-- TOC entry 4151 (class 1259 OID 849190)
-- Name: xfk13_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (uneg_id);


--
-- TOC entry 4055 (class 1259 OID 849191)
-- Name: xfk14_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (regi_id);


--
-- TOC entry 4100 (class 1259 OID 849192)
-- Name: xfk14_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (greg_id);


--
-- TOC entry 4071 (class 1259 OID 849193)
-- Name: xfk14_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (greg_id);


--
-- TOC entry 4110 (class 1259 OID 849194)
-- Name: xfk14_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (greg_id);


--
-- TOC entry 4131 (class 1259 OID 849195)
-- Name: xfk14_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (greg_id);


--
-- TOC entry 4152 (class 1259 OID 849196)
-- Name: xfk14_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (greg_id);


--
-- TOC entry 4056 (class 1259 OID 849197)
-- Name: xfk15_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (muni_id);


--
-- TOC entry 4101 (class 1259 OID 849198)
-- Name: xfk15_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (loca_cdelo);


--
-- TOC entry 4072 (class 1259 OID 849199)
-- Name: xfk15_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (loca_cdelo);


--
-- TOC entry 4111 (class 1259 OID 849200)
-- Name: xfk15_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (loca_cdelo);


--
-- TOC entry 4132 (class 1259 OID 849201)
-- Name: xfk15_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (loca_cdelo);


--
-- TOC entry 4153 (class 1259 OID 849202)
-- Name: xfk15_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (loca_cdelo);


--
-- TOC entry 4102 (class 1259 OID 849203)
-- Name: xfk16_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (rota_id);


--
-- TOC entry 4073 (class 1259 OID 849204)
-- Name: xfk16_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (rota_id);


--
-- TOC entry 4103 (class 1259 OID 849205)
-- Name: xfk17_un_resumo_indicador_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_indicador_ligacao_economia ON un_resi_lig_eco USING btree (cstf_id);


--
-- TOC entry 4112 (class 1259 OID 849206)
-- Name: xfk17_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (cstf_id);


--
-- TOC entry 4133 (class 1259 OID 849207)
-- Name: xfk17_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (cstf_id);


--
-- TOC entry 4154 (class 1259 OID 849208)
-- Name: xfk17_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (cstf_id);


--
-- TOC entry 4029 (class 1259 OID 849209)
-- Name: xfk1_cliente_tipo; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_cliente_tipo ON g_cliente_tipo USING btree (epod_id);


--
-- TOC entry 4022 (class 1259 OID 849210)
-- Name: xfk1_g_bairro; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_g_bairro ON g_bairro USING btree (muni_id);


--
-- TOC entry 4026 (class 1259 OID 849213)
-- Name: xfk1_g_categoria; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_g_categoria ON g_categoria USING btree (catg_id);


--
-- TOC entry 4036 (class 1259 OID 849215)
-- Name: xfk1_g_microrregiao; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_g_microrregiao ON g_microrregiao USING btree (regi_id);


--
-- TOC entry 4032 (class 1259 OID 849217)
-- Name: xfk1_localidade; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_localidade ON g_localidade USING btree (loca_cdelo);


--
-- TOC entry 4040 (class 1259 OID 849219)
-- Name: xfk1_quadra; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_quadra ON g_quadra USING btree (stcm_id);


--
-- TOC entry 4057 (class 1259 OID 849220)
-- Name: xfk1_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (lepf_id);


--
-- TOC entry 4043 (class 1259 OID 849221)
-- Name: xfk1_setor_comercial; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_setor_comercial ON g_setor_comercial USING btree (loca_id);


--
-- TOC entry 4044 (class 1259 OID 849222)
-- Name: xfk1_subcategoria; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_subcategoria ON g_subcategoria USING btree (catg_id);


--
-- TOC entry 4074 (class 1259 OID 849223)
-- Name: xfk1_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (lepf_id);


--
-- TOC entry 4113 (class 1259 OID 849224)
-- Name: xfk1_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (lepf_id);


--
-- TOC entry 4134 (class 1259 OID 849225)
-- Name: xfk1_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (lepf_id);


--
-- TOC entry 4155 (class 1259 OID 849226)
-- Name: xfk1_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (lepf_id);


--
-- TOC entry 4047 (class 1259 OID 849227)
-- Name: xfk1_unidade_negocio; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_unidade_negocio ON g_unidade_negocio USING btree (greg_id);


--
-- TOC entry 4023 (class 1259 OID 849229)
-- Name: xfk2_g_bairro; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_g_bairro ON g_bairro USING btree (bair_cdbairro);


--
-- TOC entry 4039 (class 1259 OID 849232)
-- Name: xfk2_g_municipio; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_g_municipio ON g_municipio USING btree (mreg_id);


--
-- TOC entry 4033 (class 1259 OID 849233)
-- Name: xfk2_localidade; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_localidade ON g_localidade USING btree (greg_id);


--
-- TOC entry 4058 (class 1259 OID 849235)
-- Name: xfk2_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (lapf_id);


--
-- TOC entry 4075 (class 1259 OID 849236)
-- Name: xfk2_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (lapf_id);


--
-- TOC entry 4114 (class 1259 OID 849237)
-- Name: xfk2_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (lapf_id);


--
-- TOC entry 4135 (class 1259 OID 849238)
-- Name: xfk2_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (lapf_id);


--
-- TOC entry 4156 (class 1259 OID 849239)
-- Name: xfk2_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (lapf_id);


--
-- TOC entry 4034 (class 1259 OID 849240)
-- Name: xfk3_localidade; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_localidade ON g_localidade USING btree (uneg_id);


--
-- TOC entry 4041 (class 1259 OID 849242)
-- Name: xfk3_quadra; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_quadra ON g_quadra USING btree (rota_id);


--
-- TOC entry 4059 (class 1259 OID 849243)
-- Name: xfk3_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (cltp_id);


--
-- TOC entry 4076 (class 1259 OID 849244)
-- Name: xfk3_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (cltp_id);


--
-- TOC entry 4115 (class 1259 OID 849245)
-- Name: xfk3_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (cltp_id);


--
-- TOC entry 4136 (class 1259 OID 849246)
-- Name: xfk3_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (cltp_id);


--
-- TOC entry 4157 (class 1259 OID 849247)
-- Name: xfk3_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (cltp_id);


--
-- TOC entry 4042 (class 1259 OID 849248)
-- Name: xfk4_quadra; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_quadra ON g_quadra USING btree (diop_id);


--
-- TOC entry 4060 (class 1259 OID 849249)
-- Name: xfk4_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (epod_id);


--
-- TOC entry 4077 (class 1259 OID 849250)
-- Name: xfk4_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (epod_id);


--
-- TOC entry 4116 (class 1259 OID 849251)
-- Name: xfk4_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (epod_id);


--
-- TOC entry 4137 (class 1259 OID 849252)
-- Name: xfk4_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (epod_id);


--
-- TOC entry 4158 (class 1259 OID 849253)
-- Name: xfk4_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (epod_id);


--
-- TOC entry 4061 (class 1259 OID 849254)
-- Name: xfk5_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (scat_id);


--
-- TOC entry 4078 (class 1259 OID 849255)
-- Name: xfk5_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (scat_id);


--
-- TOC entry 4117 (class 1259 OID 849256)
-- Name: xfk5_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (scat_id);


--
-- TOC entry 4138 (class 1259 OID 849257)
-- Name: xfk5_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (scat_id);


--
-- TOC entry 4159 (class 1259 OID 849258)
-- Name: xfk5_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (scat_id);


--
-- TOC entry 4035 (class 1259 OID 849259)
-- Name: xfk6_localidade; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_localidade ON g_localidade USING btree (lpor_id);


--
-- TOC entry 4062 (class 1259 OID 849261)
-- Name: xfk6_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (catg_id);


--
-- TOC entry 4079 (class 1259 OID 849262)
-- Name: xfk6_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (catg_id);


--
-- TOC entry 4118 (class 1259 OID 849265)
-- Name: xfk6_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (catg_id);


--
-- TOC entry 4139 (class 1259 OID 849266)
-- Name: xfk6_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (catg_id);


--
-- TOC entry 4160 (class 1259 OID 849267)
-- Name: xfk6_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (catg_id);


--
-- TOC entry 4063 (class 1259 OID 849268)
-- Name: xfk7_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (lest_id);


--
-- TOC entry 4080 (class 1259 OID 849269)
-- Name: xfk7_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (lest_id);


--
-- TOC entry 4119 (class 1259 OID 849270)
-- Name: xfk7_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (lest_id);


--
-- TOC entry 4140 (class 1259 OID 849272)
-- Name: xfk7_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (lest_id);


--
-- TOC entry 4161 (class 1259 OID 849273)
-- Name: xfk7_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (lest_id);


--
-- TOC entry 4064 (class 1259 OID 849274)
-- Name: xfk8_rg_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_rg_resumo_ligacao_economia ON rg_res_lig_econ USING btree (last_id);


--
-- TOC entry 4081 (class 1259 OID 849275)
-- Name: xfk8_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (last_id);


--
-- TOC entry 4120 (class 1259 OID 849278)
-- Name: xfk8_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (last_id);


--
-- TOC entry 4141 (class 1259 OID 849279)
-- Name: xfk8_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (last_id);


--
-- TOC entry 4162 (class 1259 OID 849280)
-- Name: xfk8_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (last_id);


--
-- TOC entry 4082 (class 1259 OID 849281)
-- Name: xfk9_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (qdra_id);


--
-- TOC entry 4083 (class 1259 OID 849282)
-- Name: xix1_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (rele_amreferencia, greg_id);


--
-- TOC entry 4121 (class 1259 OID 849283)
-- Name: xix1_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (rele_amreferencia, greg_id);


--
-- TOC entry 4142 (class 1259 OID 849284)
-- Name: xix1_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (rele_amreferencia, greg_id);


--
-- TOC entry 4163 (class 1259 OID 849285)
-- Name: xix1_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (rele_amreferencia, greg_id);


--
-- TOC entry 4084 (class 1259 OID 849286)
-- Name: xix2_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (rele_amreferencia, uneg_id);


--
-- TOC entry 4122 (class 1259 OID 849287)
-- Name: xix2_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (rele_amreferencia, uneg_id);


--
-- TOC entry 4143 (class 1259 OID 849288)
-- Name: xix2_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (rele_amreferencia, uneg_id);


--
-- TOC entry 4164 (class 1259 OID 849289)
-- Name: xix2_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (rele_amreferencia, uneg_id);


--
-- TOC entry 4085 (class 1259 OID 849290)
-- Name: xix3_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix3_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (rele_amreferencia, loca_id);


--
-- TOC entry 4123 (class 1259 OID 849291)
-- Name: xix3_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix3_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (rele_amreferencia, loca_id);


--
-- TOC entry 4144 (class 1259 OID 849292)
-- Name: xix3_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix3_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (rele_amreferencia, loca_id);


--
-- TOC entry 4165 (class 1259 OID 849293)
-- Name: xix3_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix3_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (rele_amreferencia, loca_id);


--
-- TOC entry 4086 (class 1259 OID 849294)
-- Name: xix4_un_resumo_ligacao_economia; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix4_un_resumo_ligacao_economia ON un_res_lig_econ USING btree (rele_amreferencia);


--
-- TOC entry 4124 (class 1259 OID 849295)
-- Name: xix4_un_resumo_ligacao_economia_ref_2007; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix4_un_resumo_ligacao_economia_ref_2007 ON un_resumo_ligacao_economia_ref_2007 USING btree (rele_amreferencia);


--
-- TOC entry 4145 (class 1259 OID 849296)
-- Name: xix4_un_resumo_ligacao_economia_ref_2008; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix4_un_resumo_ligacao_economia_ref_2008 ON un_resumo_ligacao_economia_ref_2008 USING btree (rele_amreferencia);


--
-- TOC entry 4166 (class 1259 OID 849297)
-- Name: xix4_un_resumo_ligacao_economia_ref_2009; Type: INDEX; Schema: cadastro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix4_un_resumo_ligacao_economia_ref_2009 ON un_resumo_ligacao_economia_ref_2009 USING btree (rele_amreferencia);


SET search_path = cobranca, pg_catalog;

--
-- TOC entry 4171 (class 1259 OID 849298)
-- Name: xfk01_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (lepf_id);


--
-- TOC entry 4172 (class 1259 OID 849299)
-- Name: xfk02_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (lapf_id);


--
-- TOC entry 4173 (class 1259 OID 849300)
-- Name: xfk03_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (cltp_id);


--
-- TOC entry 4174 (class 1259 OID 849301)
-- Name: xfk04_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (epod_id);


--
-- TOC entry 4175 (class 1259 OID 849302)
-- Name: xfk05_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk05_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (scat_id);


--
-- TOC entry 4176 (class 1259 OID 849303)
-- Name: xfk06_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (catg_id);


--
-- TOC entry 4177 (class 1259 OID 849304)
-- Name: xfk07_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (lest_id);


--
-- TOC entry 4178 (class 1259 OID 849305)
-- Name: xfk08_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (last_id);


--
-- TOC entry 4179 (class 1259 OID 849306)
-- Name: xfk09_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk09_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (qdra_id);


--
-- TOC entry 4180 (class 1259 OID 849307)
-- Name: xfk10_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (iper_id);


--
-- TOC entry 4181 (class 1259 OID 849308)
-- Name: xfk11_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (stcm_id);


--
-- TOC entry 4182 (class 1259 OID 849309)
-- Name: xfk12_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (loca_id);


--
-- TOC entry 4183 (class 1259 OID 849310)
-- Name: xfk13_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (uneg_id);


--
-- TOC entry 4184 (class 1259 OID 849311)
-- Name: xfk14_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (greg_id);


--
-- TOC entry 4185 (class 1259 OID 849312)
-- Name: xfk15_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (loca_cdelo);


--
-- TOC entry 4186 (class 1259 OID 849313)
-- Name: xfk16_un_resumo_indicadores_cobranca; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_indicadores_cobranca ON un_resumo_indicadores_cobranca USING btree (rota_id);


--
-- TOC entry 4195 (class 1259 OID 849314)
-- Name: xix1_un_res_pend_sqd; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_res_pend_sqd ON un_resumo_pendencia_sem_quadra USING btree (rpsq_amreferencia);


--
-- TOC entry 4191 (class 1259 OID 849315)
-- Name: xix1_un_resumo_pendencia; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_pendencia ON un_resumo_pendencia USING btree (rpen_amreferencia);


--
-- TOC entry 4196 (class 1259 OID 849316)
-- Name: xix2_un_res_pend_sqd; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_res_pend_sqd ON un_resumo_pendencia_sem_quadra USING btree (rpsq_amreferencia, stcm_id);


--
-- TOC entry 4192 (class 1259 OID 849317)
-- Name: xix2_un_resumo_pendencia; Type: INDEX; Schema: cobranca; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_resumo_pendencia ON un_resumo_pendencia USING btree (rpen_amreferencia, stcm_id);


SET search_path = faturamento, pg_catalog;

--
-- TOC entry 4199 (class 1259 OID 849318)
-- Name: xfk01_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (lepf_id);


--
-- TOC entry 4236 (class 1259 OID 849319)
-- Name: xfk01_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (lepf_id);


--
-- TOC entry 4258 (class 1259 OID 849320)
-- Name: xfk01_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (lepf_id);


--
-- TOC entry 4280 (class 1259 OID 849321)
-- Name: xfk01_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (lepf_id);


--
-- TOC entry 4200 (class 1259 OID 849322)
-- Name: xfk02_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (lapf_id);


--
-- TOC entry 4237 (class 1259 OID 849323)
-- Name: xfk02_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (lapf_id);


--
-- TOC entry 4259 (class 1259 OID 849324)
-- Name: xfk02_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (lapf_id);


--
-- TOC entry 4281 (class 1259 OID 849325)
-- Name: xfk02_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (lapf_id);


--
-- TOC entry 4201 (class 1259 OID 849326)
-- Name: xfk03_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (cltp_id);


--
-- TOC entry 4238 (class 1259 OID 849327)
-- Name: xfk03_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (cltp_id);


--
-- TOC entry 4260 (class 1259 OID 849328)
-- Name: xfk03_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (cltp_id);


--
-- TOC entry 4282 (class 1259 OID 849329)
-- Name: xfk03_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (cltp_id);


--
-- TOC entry 4202 (class 1259 OID 849330)
-- Name: xfk04_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (epod_id);


--
-- TOC entry 4239 (class 1259 OID 849331)
-- Name: xfk04_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (epod_id);


--
-- TOC entry 4261 (class 1259 OID 849332)
-- Name: xfk04_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (epod_id);


--
-- TOC entry 4283 (class 1259 OID 849333)
-- Name: xfk04_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (epod_id);


--
-- TOC entry 4284 (class 1259 OID 849334)
-- Name: xfk05_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk05_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (scat_id);


--
-- TOC entry 4203 (class 1259 OID 849335)
-- Name: xfk06_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (catg_id);


--
-- TOC entry 4240 (class 1259 OID 849336)
-- Name: xfk06_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (catg_id);


--
-- TOC entry 4262 (class 1259 OID 849337)
-- Name: xfk06_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (catg_id);


--
-- TOC entry 4285 (class 1259 OID 849338)
-- Name: xfk06_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (catg_id);


--
-- TOC entry 4204 (class 1259 OID 849339)
-- Name: xfk07_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (lest_id);


--
-- TOC entry 4241 (class 1259 OID 849340)
-- Name: xfk07_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (lest_id);


--
-- TOC entry 4263 (class 1259 OID 849341)
-- Name: xfk07_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (lest_id);


--
-- TOC entry 4286 (class 1259 OID 849342)
-- Name: xfk07_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (lest_id);


--
-- TOC entry 4205 (class 1259 OID 849343)
-- Name: xfk08_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (last_id);


--
-- TOC entry 4242 (class 1259 OID 849344)
-- Name: xfk08_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (last_id);


--
-- TOC entry 4264 (class 1259 OID 849345)
-- Name: xfk08_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (last_id);


--
-- TOC entry 4287 (class 1259 OID 849346)
-- Name: xfk08_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (last_id);


--
-- TOC entry 4288 (class 1259 OID 849347)
-- Name: xfk09_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk09_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (qdra_id);


--
-- TOC entry 4206 (class 1259 OID 849348)
-- Name: xfk10_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (iper_id);


--
-- TOC entry 4243 (class 1259 OID 849349)
-- Name: xfk10_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (iper_id);


--
-- TOC entry 4265 (class 1259 OID 849350)
-- Name: xfk10_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (iper_id);


--
-- TOC entry 4289 (class 1259 OID 849351)
-- Name: xfk10_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (iper_id);


--
-- TOC entry 4207 (class 1259 OID 849352)
-- Name: xfk11_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (stcm_id);


--
-- TOC entry 4244 (class 1259 OID 849353)
-- Name: xfk11_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (stcm_id);


--
-- TOC entry 4266 (class 1259 OID 849354)
-- Name: xfk11_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (stcm_id);


--
-- TOC entry 4290 (class 1259 OID 849355)
-- Name: xfk11_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (stcm_id);


--
-- TOC entry 4208 (class 1259 OID 849356)
-- Name: xfk12_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (loca_id);


--
-- TOC entry 4245 (class 1259 OID 849357)
-- Name: xfk12_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (loca_id);


--
-- TOC entry 4267 (class 1259 OID 849358)
-- Name: xfk12_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (loca_id);


--
-- TOC entry 4291 (class 1259 OID 849359)
-- Name: xfk12_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (loca_id);


--
-- TOC entry 4209 (class 1259 OID 849360)
-- Name: xfk13_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (uneg_id);


--
-- TOC entry 4246 (class 1259 OID 849361)
-- Name: xfk13_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (uneg_id);


--
-- TOC entry 4268 (class 1259 OID 849362)
-- Name: xfk13_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (uneg_id);


--
-- TOC entry 4292 (class 1259 OID 849363)
-- Name: xfk13_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (uneg_id);


--
-- TOC entry 4210 (class 1259 OID 849364)
-- Name: xfk14_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (greg_id);


--
-- TOC entry 4247 (class 1259 OID 849365)
-- Name: xfk14_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (greg_id);


--
-- TOC entry 4269 (class 1259 OID 849366)
-- Name: xfk14_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (greg_id);


--
-- TOC entry 4293 (class 1259 OID 849367)
-- Name: xfk14_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (greg_id);


--
-- TOC entry 4211 (class 1259 OID 849368)
-- Name: xfk15_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (loca_cdelo);


--
-- TOC entry 4248 (class 1259 OID 849369)
-- Name: xfk15_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (loca_cdelo);


--
-- TOC entry 4270 (class 1259 OID 849370)
-- Name: xfk15_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (loca_cdelo);


--
-- TOC entry 4294 (class 1259 OID 849371)
-- Name: xfk15_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (loca_cdelo);


--
-- TOC entry 4295 (class 1259 OID 849372)
-- Name: xfk16_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (rota_id);


--
-- TOC entry 4212 (class 1259 OID 849373)
-- Name: xfk17_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (crog_id);


--
-- TOC entry 4249 (class 1259 OID 849374)
-- Name: xfk17_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (crog_id);


--
-- TOC entry 4271 (class 1259 OID 849375)
-- Name: xfk17_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (crog_id);


--
-- TOC entry 4296 (class 1259 OID 849376)
-- Name: xfk17_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (crog_id);


--
-- TOC entry 4213 (class 1259 OID 849377)
-- Name: xfk18_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk18_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (lict_id);


--
-- TOC entry 4250 (class 1259 OID 849378)
-- Name: xfk18_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk18_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (lict_id);


--
-- TOC entry 4272 (class 1259 OID 849379)
-- Name: xfk18_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk18_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (lict_id);


--
-- TOC entry 4297 (class 1259 OID 849380)
-- Name: xfk18_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk18_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (lict_id);


--
-- TOC entry 4214 (class 1259 OID 849381)
-- Name: xfk19_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk19_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (dotp_id);


--
-- TOC entry 4251 (class 1259 OID 849382)
-- Name: xfk19_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk19_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (dotp_id);


--
-- TOC entry 4273 (class 1259 OID 849383)
-- Name: xfk19_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk19_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (dotp_id);


--
-- TOC entry 4298 (class 1259 OID 849384)
-- Name: xfk19_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk19_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (dotp_id);


--
-- TOC entry 4221 (class 1259 OID 849385)
-- Name: xfk1_g_credito_tipo; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_g_credito_tipo ON g_credito_tipo USING btree (lict_id);


--
-- TOC entry 4222 (class 1259 OID 849387)
-- Name: xfk1_g_debito_tipo; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_g_debito_tipo ON g_debito_tipo USING btree (lict_id);


--
-- TOC entry 4215 (class 1259 OID 849389)
-- Name: xfk20_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk20_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (fntp_id);


--
-- TOC entry 4252 (class 1259 OID 849390)
-- Name: xfk20_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk20_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (fntp_id);


--
-- TOC entry 4274 (class 1259 OID 849391)
-- Name: xfk20_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk20_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (fntp_id);


--
-- TOC entry 4299 (class 1259 OID 849392)
-- Name: xfk20_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk20_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (fntp_id);


--
-- TOC entry 4216 (class 1259 OID 849393)
-- Name: xfk21_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk21_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (dbtp_id);


--
-- TOC entry 4253 (class 1259 OID 849394)
-- Name: xfk21_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk21_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (dbtp_id);


--
-- TOC entry 4275 (class 1259 OID 849395)
-- Name: xfk21_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk21_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (dbtp_id);


--
-- TOC entry 4300 (class 1259 OID 849396)
-- Name: xfk21_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk21_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (dbtp_id);


--
-- TOC entry 4217 (class 1259 OID 849397)
-- Name: xfk22_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk22_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (crti_id);


--
-- TOC entry 4254 (class 1259 OID 849398)
-- Name: xfk22_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk22_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (crti_id);


--
-- TOC entry 4276 (class 1259 OID 849399)
-- Name: xfk22_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk22_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (crti_id);


--
-- TOC entry 4301 (class 1259 OID 849400)
-- Name: xfk22_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk22_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (crti_id);


--
-- TOC entry 4223 (class 1259 OID 849401)
-- Name: xfk2_g_debito_tipo; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_g_debito_tipo ON g_debito_tipo USING btree (fntp_id);


--
-- TOC entry 4218 (class 1259 OID 849403)
-- Name: xix01_un_resumo_indicadores_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicadores_faturamento ON un_resumo_indicadores_faturamento USING btree (refa_amreferencia);


--
-- TOC entry 4255 (class 1259 OID 849404)
-- Name: xix01_un_resumo_indicadores_faturamento_ref_2007; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicadores_faturamento_ref_2007 ON un_resumo_indicadores_faturamento_ref_2007 USING btree (refa_amreferencia);


--
-- TOC entry 4277 (class 1259 OID 849405)
-- Name: xix01_un_resumo_indicadores_faturamento_ref_2008; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicadores_faturamento_ref_2008 ON un_resumo_indicadores_faturamento_ref_2008 USING btree (refa_amreferencia);


--
-- TOC entry 4302 (class 1259 OID 849406)
-- Name: xix01_un_resumo_indicadores_faturamento_ref_2009; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicadores_faturamento_ref_2009 ON un_resumo_indicadores_faturamento_ref_2009 USING btree (refa_amreferencia);


--
-- TOC entry 4230 (class 1259 OID 849407)
-- Name: xix1_un_resumo_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_faturamento ON un_resumo_faturamento USING btree (refa_amreferencia, greg_id);


--
-- TOC entry 4231 (class 1259 OID 849408)
-- Name: xix2_un_resumo_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_resumo_faturamento ON un_resumo_faturamento USING btree (refa_amreferencia, uneg_id);


--
-- TOC entry 4232 (class 1259 OID 849409)
-- Name: xix3_un_resumo_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix3_un_resumo_faturamento ON un_resumo_faturamento USING btree (refa_amreferencia, loca_id);


--
-- TOC entry 4233 (class 1259 OID 849410)
-- Name: xix4_un_resumo_faturamento; Type: INDEX; Schema: faturamento; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix4_un_resumo_faturamento ON un_resumo_faturamento USING btree (refa_amreferencia);


SET search_path = financeiro, pg_catalog;

--
-- TOC entry 3998 (class 1259 OID 849411)
-- Name: xfk1_g_lancamento_item_contabil; Type: INDEX; Schema: financeiro; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_g_lancamento_item_contabil ON g_lancamento_item_contabil USING btree (lcit_id);


SET search_path = micromedicao, pg_catalog;

--
-- TOC entry 4313 (class 1259 OID 849412)
-- Name: xak1_rota; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xak1_rota ON g_rota USING btree (stcm_id, rota_cdrota);


--
-- TOC entry 4360 (class 1259 OID 849413)
-- Name: xfk01_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (lepf_id);


--
-- TOC entry 4427 (class 1259 OID 849414)
-- Name: xfk01_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (lepf_id);


--
-- TOC entry 4446 (class 1259 OID 849415)
-- Name: xfk01_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (lepf_id);


--
-- TOC entry 4465 (class 1259 OID 849416)
-- Name: xfk01_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk01_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (lepf_id);


--
-- TOC entry 4361 (class 1259 OID 849417)
-- Name: xfk02_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (lapf_id);


--
-- TOC entry 4428 (class 1259 OID 849418)
-- Name: xfk02_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (lapf_id);


--
-- TOC entry 4447 (class 1259 OID 849419)
-- Name: xfk02_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (lapf_id);


--
-- TOC entry 4466 (class 1259 OID 849420)
-- Name: xfk02_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk02_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (lapf_id);


--
-- TOC entry 4362 (class 1259 OID 849421)
-- Name: xfk03_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (cltp_id);


--
-- TOC entry 4429 (class 1259 OID 849422)
-- Name: xfk03_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (cltp_id);


--
-- TOC entry 4448 (class 1259 OID 849423)
-- Name: xfk03_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (cltp_id);


--
-- TOC entry 4467 (class 1259 OID 849424)
-- Name: xfk03_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk03_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (cltp_id);


--
-- TOC entry 4363 (class 1259 OID 849425)
-- Name: xfk04_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (epod_id);


--
-- TOC entry 4430 (class 1259 OID 849426)
-- Name: xfk04_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (epod_id);


--
-- TOC entry 4449 (class 1259 OID 849427)
-- Name: xfk04_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (epod_id);


--
-- TOC entry 4468 (class 1259 OID 849428)
-- Name: xfk04_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk04_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (epod_id);


--
-- TOC entry 4364 (class 1259 OID 849429)
-- Name: xfk05_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk05_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (scat_id);


--
-- TOC entry 4431 (class 1259 OID 849430)
-- Name: xfk05_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk05_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (scat_id);


--
-- TOC entry 4450 (class 1259 OID 849431)
-- Name: xfk05_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk05_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (scat_id);


--
-- TOC entry 4469 (class 1259 OID 849432)
-- Name: xfk05_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk05_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (scat_id);


--
-- TOC entry 4365 (class 1259 OID 849433)
-- Name: xfk06_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (catg_id);


--
-- TOC entry 4432 (class 1259 OID 849434)
-- Name: xfk06_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (catg_id);


--
-- TOC entry 4451 (class 1259 OID 849435)
-- Name: xfk06_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (catg_id);


--
-- TOC entry 4470 (class 1259 OID 849436)
-- Name: xfk06_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk06_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (catg_id);


--
-- TOC entry 4366 (class 1259 OID 849437)
-- Name: xfk07_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (lest_id);


--
-- TOC entry 4433 (class 1259 OID 849438)
-- Name: xfk07_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (lest_id);


--
-- TOC entry 4452 (class 1259 OID 849439)
-- Name: xfk07_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (lest_id);


--
-- TOC entry 4471 (class 1259 OID 849440)
-- Name: xfk07_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk07_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (lest_id);


--
-- TOC entry 4367 (class 1259 OID 849441)
-- Name: xfk08_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (last_id);


--
-- TOC entry 4434 (class 1259 OID 849442)
-- Name: xfk08_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (last_id);


--
-- TOC entry 4453 (class 1259 OID 849443)
-- Name: xfk08_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (last_id);


--
-- TOC entry 4472 (class 1259 OID 849444)
-- Name: xfk08_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk08_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (last_id);


--
-- TOC entry 4368 (class 1259 OID 849445)
-- Name: xfk09_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk09_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (qdra_id);


--
-- TOC entry 4435 (class 1259 OID 849446)
-- Name: xfk09_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk09_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (qdra_id);


--
-- TOC entry 4454 (class 1259 OID 849447)
-- Name: xfk09_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk09_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (qdra_id);


--
-- TOC entry 4473 (class 1259 OID 849448)
-- Name: xfk09_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk09_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (qdra_id);


--
-- TOC entry 4379 (class 1259 OID 849449)
-- Name: xfk10_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (cltp_id);


--
-- TOC entry 4399 (class 1259 OID 849450)
-- Name: xfk10_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (cltp_id);


--
-- TOC entry 4369 (class 1259 OID 849451)
-- Name: xfk10_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (iper_id);


--
-- TOC entry 4436 (class 1259 OID 849452)
-- Name: xfk10_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (iper_id);


--
-- TOC entry 4455 (class 1259 OID 849453)
-- Name: xfk10_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (iper_id);


--
-- TOC entry 4474 (class 1259 OID 849454)
-- Name: xfk10_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (iper_id);


--
-- TOC entry 4317 (class 1259 OID 849455)
-- Name: xfk10_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (cltp_id);


--
-- TOC entry 4336 (class 1259 OID 849456)
-- Name: xfk10_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (iper_id);


--
-- TOC entry 4380 (class 1259 OID 849634)
-- Name: xfk11_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (epod_id);


--
-- TOC entry 4400 (class 1259 OID 849635)
-- Name: xfk11_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (epod_id);


--
-- TOC entry 4370 (class 1259 OID 849636)
-- Name: xfk11_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (stcm_id);


--
-- TOC entry 4437 (class 1259 OID 849638)
-- Name: xfk11_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (stcm_id);


--
-- TOC entry 4456 (class 1259 OID 849639)
-- Name: xfk11_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (stcm_id);


--
-- TOC entry 4475 (class 1259 OID 849640)
-- Name: xfk11_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (stcm_id);


--
-- TOC entry 4318 (class 1259 OID 849641)
-- Name: xfk11_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (iper_id);


--
-- TOC entry 4337 (class 1259 OID 849642)
-- Name: xfk11_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (epod_id);


--
-- TOC entry 4381 (class 1259 OID 849643)
-- Name: xfk12_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (iper_id);


--
-- TOC entry 4401 (class 1259 OID 849645)
-- Name: xfk12_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (scat_id);


--
-- TOC entry 4371 (class 1259 OID 849646)
-- Name: xfk12_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (loca_id);


--
-- TOC entry 4438 (class 1259 OID 849652)
-- Name: xfk12_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (loca_id);


--
-- TOC entry 4457 (class 1259 OID 849653)
-- Name: xfk12_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (loca_id);


--
-- TOC entry 4476 (class 1259 OID 849654)
-- Name: xfk12_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (loca_id);


--
-- TOC entry 4319 (class 1259 OID 849655)
-- Name: xfk12_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (epod_id);


--
-- TOC entry 4338 (class 1259 OID 849656)
-- Name: xfk12_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (cltp_id);


--
-- TOC entry 4382 (class 1259 OID 849657)
-- Name: xfk13_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (scat_id);


--
-- TOC entry 4402 (class 1259 OID 849658)
-- Name: xfk13_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (catg_id);


--
-- TOC entry 4372 (class 1259 OID 849660)
-- Name: xfk13_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (uneg_id);


--
-- TOC entry 4439 (class 1259 OID 849661)
-- Name: xfk13_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (uneg_id);


--
-- TOC entry 4458 (class 1259 OID 849662)
-- Name: xfk13_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (uneg_id);


--
-- TOC entry 4477 (class 1259 OID 849663)
-- Name: xfk13_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (uneg_id);


--
-- TOC entry 4320 (class 1259 OID 849664)
-- Name: xfk13_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (scat_id);


--
-- TOC entry 4339 (class 1259 OID 849666)
-- Name: xfk13_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (catg_id);


--
-- TOC entry 4383 (class 1259 OID 849667)
-- Name: xfk14_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (catg_id);


--
-- TOC entry 4403 (class 1259 OID 849668)
-- Name: xfk14_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (iper_id);


--
-- TOC entry 4373 (class 1259 OID 849675)
-- Name: xfk14_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (greg_id);


--
-- TOC entry 4440 (class 1259 OID 849677)
-- Name: xfk14_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (greg_id);


--
-- TOC entry 4459 (class 1259 OID 849678)
-- Name: xfk14_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (greg_id);


--
-- TOC entry 4478 (class 1259 OID 849679)
-- Name: xfk14_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (greg_id);


--
-- TOC entry 4321 (class 1259 OID 849680)
-- Name: xfk14_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (catg_id);


--
-- TOC entry 4340 (class 1259 OID 849681)
-- Name: xfk14_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (scat_id);


--
-- TOC entry 4384 (class 1259 OID 849682)
-- Name: xfk15_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (loca_cdelo);


--
-- TOC entry 4404 (class 1259 OID 849683)
-- Name: xfk15_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (loca_cdelo);


--
-- TOC entry 4374 (class 1259 OID 849687)
-- Name: xfk15_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (loca_cdelo);


--
-- TOC entry 4441 (class 1259 OID 849689)
-- Name: xfk15_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (loca_cdelo);


--
-- TOC entry 4460 (class 1259 OID 849690)
-- Name: xfk15_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (loca_cdelo);


--
-- TOC entry 4479 (class 1259 OID 849691)
-- Name: xfk15_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (loca_cdelo);


--
-- TOC entry 4322 (class 1259 OID 849692)
-- Name: xfk15_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (loca_cdelo);


--
-- TOC entry 4341 (class 1259 OID 849693)
-- Name: xfk15_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (ltan_id);


--
-- TOC entry 4385 (class 1259 OID 849694)
-- Name: xfk16_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (rota_id);


--
-- TOC entry 4405 (class 1259 OID 849695)
-- Name: xfk16_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (rota_id);


--
-- TOC entry 4375 (class 1259 OID 849701)
-- Name: xfk16_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (rota_id);


--
-- TOC entry 4442 (class 1259 OID 849702)
-- Name: xfk16_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (rota_id);


--
-- TOC entry 4461 (class 1259 OID 849703)
-- Name: xfk16_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (rota_id);


--
-- TOC entry 4480 (class 1259 OID 849704)
-- Name: xfk16_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (rota_id);


--
-- TOC entry 4323 (class 1259 OID 849705)
-- Name: xfk16_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (rota_id);


--
-- TOC entry 4342 (class 1259 OID 849706)
-- Name: xfk16_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (medt_id);


--
-- TOC entry 4386 (class 1259 OID 849710)
-- Name: xfk17_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (cstp_id);


--
-- TOC entry 4406 (class 1259 OID 849711)
-- Name: xfk17_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (cstp_id);


--
-- TOC entry 4343 (class 1259 OID 849712)
-- Name: xfk17_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk17_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (loca_cdelo);


--
-- TOC entry 4344 (class 1259 OID 849713)
-- Name: xfk18_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk18_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (rota_id);


--
-- TOC entry 4387 (class 1259 OID 849717)
-- Name: xfk1_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (greg_id);


--
-- TOC entry 4407 (class 1259 OID 849718)
-- Name: xfk1_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (greg_id);


--
-- TOC entry 4419 (class 1259 OID 849719)
-- Name: xfk1_un_resumo_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_hidrometro ON un_resumo_hidrometro USING btree (hila_id);


--
-- TOC entry 4324 (class 1259 OID 849720)
-- Name: xfk1_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (uneg_id);


--
-- TOC entry 4345 (class 1259 OID 849721)
-- Name: xfk1_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (greg_id);


--
-- TOC entry 4346 (class 1259 OID 849723)
-- Name: xfk23_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk23_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (ltan_idanormalidadeinformada);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 4346
-- Name: INDEX xfk23_un_resumo_leitura_anormalidade; Type: COMMENT; Schema: micromedicao; Owner: gsan_admin
--

COMMENT ON INDEX xfk23_un_resumo_leitura_anormalidade IS 'ID da Leitura Anormalidade Informada';


--
-- TOC entry 4388 (class 1259 OID 849724)
-- Name: xfk2_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (loca_id);


--
-- TOC entry 4408 (class 1259 OID 849725)
-- Name: xfk2_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (uneg_id);


--
-- TOC entry 4420 (class 1259 OID 849726)
-- Name: xfk2_un_resumo_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_hidrometro ON un_resumo_hidrometro USING btree (hitp_id);


--
-- TOC entry 4325 (class 1259 OID 849727)
-- Name: xfk2_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (greg_id);


--
-- TOC entry 4347 (class 1259 OID 849729)
-- Name: xfk2_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (loca_id);


--
-- TOC entry 4389 (class 1259 OID 849730)
-- Name: xfk3_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (uneg_id);


--
-- TOC entry 4409 (class 1259 OID 849731)
-- Name: xfk3_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (loca_id);


--
-- TOC entry 4421 (class 1259 OID 849732)
-- Name: xfk3_un_resumo_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_hidrometro ON un_resumo_hidrometro USING btree (hist_id);


--
-- TOC entry 4326 (class 1259 OID 849733)
-- Name: xfk3_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (last_id);


--
-- TOC entry 4348 (class 1259 OID 849734)
-- Name: xfk3_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (uneg_id);


--
-- TOC entry 4390 (class 1259 OID 849738)
-- Name: xfk4_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (last_id);


--
-- TOC entry 4410 (class 1259 OID 849739)
-- Name: xfk4_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (last_id);


--
-- TOC entry 4422 (class 1259 OID 849740)
-- Name: xfk4_un_resumo_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_hidrometro ON un_resumo_hidrometro USING btree (himc_id);


--
-- TOC entry 4327 (class 1259 OID 849741)
-- Name: xfk4_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (lest_id);


--
-- TOC entry 4349 (class 1259 OID 849742)
-- Name: xfk4_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (last_id);


--
-- TOC entry 4314 (class 1259 OID 849744)
-- Name: xfk5_rota; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_rota ON g_rota USING btree (stcm_id);


--
-- TOC entry 4391 (class 1259 OID 849745)
-- Name: xfk5_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (lapf_id);


--
-- TOC entry 4411 (class 1259 OID 849746)
-- Name: xfk5_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (lapf_id);


--
-- TOC entry 4423 (class 1259 OID 849747)
-- Name: xfk5_un_resumo_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_hidrometro ON un_resumo_hidrometro USING btree (hidm_id);


--
-- TOC entry 4328 (class 1259 OID 849748)
-- Name: xfk5_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (loca_id);


--
-- TOC entry 4350 (class 1259 OID 849749)
-- Name: xfk5_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (lapf_id);


--
-- TOC entry 4392 (class 1259 OID 849750)
-- Name: xfk6_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (lest_id);


--
-- TOC entry 4412 (class 1259 OID 849752)
-- Name: xfk6_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (lest_id);


--
-- TOC entry 4424 (class 1259 OID 849753)
-- Name: xfk6_un_resumo_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_hidrometro ON un_resumo_hidrometro USING btree (hicp_id);


--
-- TOC entry 4329 (class 1259 OID 849754)
-- Name: xfk6_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (lapf_id);


--
-- TOC entry 4351 (class 1259 OID 849755)
-- Name: xfk6_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (lest_id);


--
-- TOC entry 4393 (class 1259 OID 849756)
-- Name: xfk7_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (lepf_id);


--
-- TOC entry 4413 (class 1259 OID 849757)
-- Name: xfk7_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (lepf_id);


--
-- TOC entry 4330 (class 1259 OID 849765)
-- Name: xfk7_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (lepf_id);


--
-- TOC entry 4352 (class 1259 OID 849766)
-- Name: xfk7_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (lepf_id);


--
-- TOC entry 4394 (class 1259 OID 849767)
-- Name: xfk8_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (qdra_id);


--
-- TOC entry 4414 (class 1259 OID 849768)
-- Name: xfk8_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (stcm_id);


--
-- TOC entry 4331 (class 1259 OID 849772)
-- Name: xfk8_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (stcm_id);


--
-- TOC entry 4353 (class 1259 OID 849773)
-- Name: xfk8_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (qdra_id);


--
-- TOC entry 4395 (class 1259 OID 849774)
-- Name: xfk9_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (stcm_id);


--
-- TOC entry 4415 (class 1259 OID 849775)
-- Name: xfk9_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (qdra_id);


--
-- TOC entry 4332 (class 1259 OID 849781)
-- Name: xfk9_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (qdra_id);


--
-- TOC entry 4354 (class 1259 OID 849782)
-- Name: xfk9_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (stcm_id);


--
-- TOC entry 4376 (class 1259 OID 849783)
-- Name: xix01_un_resumo_indicador_desempenho_micromedicao; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicador_desempenho_micromedicao ON un_resi_des_mmd USING btree (reca_amreferencia);


--
-- TOC entry 4443 (class 1259 OID 849784)
-- Name: xix01_un_resumo_indicador_desempenho_micromedicao_ref_2007; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicador_desempenho_micromedicao_ref_2007 ON un_resumo_indicador_desempenho_micromedicao_ref_2007 USING btree (reca_amreferencia);


--
-- TOC entry 4462 (class 1259 OID 849785)
-- Name: xix01_un_resumo_indicador_desempenho_micromedicao_ref_2008; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicador_desempenho_micromedicao_ref_2008 ON un_resumo_indicador_desempenho_micromedicao_ref_2008 USING btree (reca_amreferencia);


--
-- TOC entry 4481 (class 1259 OID 849786)
-- Name: xix01_un_resumo_indicador_desempenho_micromedicao_ref_2009; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix01_un_resumo_indicador_desempenho_micromedicao_ref_2009 ON un_resumo_indicador_desempenho_micromedicao_ref_2009 USING btree (reca_amreferencia);


--
-- TOC entry 4396 (class 1259 OID 849787)
-- Name: xix1_un_resumo_coleta_esgoto; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_coleta_esgoto ON un_resumo_coleta_esgoto USING btree (rece_amreferencia);


--
-- TOC entry 4416 (class 1259 OID 849788)
-- Name: xix1_un_resumo_consumo_agua; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_consumo_agua ON un_resumo_consumo_agua USING btree (reca_amreferencia);


--
-- TOC entry 4333 (class 1259 OID 849792)
-- Name: xix1_un_resumo_instalacao_hidrometro; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_instalacao_hidrometro ON un_res_ins_hidr USING btree (reih_amreferencia);


--
-- TOC entry 4355 (class 1259 OID 849793)
-- Name: xix1_un_resumo_leitura_anormalidade; Type: INDEX; Schema: micromedicao; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_leitura_anormalidade ON un_res_lt_anorm USING btree (relt_amreferencia);


SET search_path = public, pg_catalog;

--
-- TOC entry 4498 (class 1259 OID 849794)
-- Name: xfk10_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk10_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (iper_id);


--
-- TOC entry 4499 (class 1259 OID 849795)
-- Name: xfk11_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk11_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (stcm_id);


--
-- TOC entry 4500 (class 1259 OID 849796)
-- Name: xfk12_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk12_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (loca_id);


--
-- TOC entry 4501 (class 1259 OID 849797)
-- Name: xfk13_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk13_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (uneg_id);


--
-- TOC entry 4502 (class 1259 OID 849798)
-- Name: xfk14_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk14_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (greg_id);


--
-- TOC entry 4503 (class 1259 OID 849799)
-- Name: xfk15_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk15_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (loca_cdelo);


--
-- TOC entry 4504 (class 1259 OID 849800)
-- Name: xfk16_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk16_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (rota_id);


--
-- TOC entry 4505 (class 1259 OID 849801)
-- Name: xfk1_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk1_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (lepf_id);


--
-- TOC entry 4506 (class 1259 OID 849802)
-- Name: xfk2_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk2_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (lapf_id);


--
-- TOC entry 4507 (class 1259 OID 849803)
-- Name: xfk3_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk3_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (cltp_id);


--
-- TOC entry 4508 (class 1259 OID 849804)
-- Name: xfk4_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk4_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (epod_id);


--
-- TOC entry 4509 (class 1259 OID 849805)
-- Name: xfk5_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk5_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (scat_id);


--
-- TOC entry 4510 (class 1259 OID 849806)
-- Name: xfk6_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk6_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (catg_id);


--
-- TOC entry 4511 (class 1259 OID 849807)
-- Name: xfk7_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk7_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (lest_id);


--
-- TOC entry 4512 (class 1259 OID 849808)
-- Name: xfk8_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk8_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (last_id);


--
-- TOC entry 4513 (class 1259 OID 849809)
-- Name: xfk9_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xfk9_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (qdra_id);


--
-- TOC entry 4514 (class 1259 OID 849810)
-- Name: xix1_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix1_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (rele_amreferencia, greg_id);


--
-- TOC entry 4515 (class 1259 OID 849811)
-- Name: xix2_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix2_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (rele_amreferencia, uneg_id);


--
-- TOC entry 4516 (class 1259 OID 849812)
-- Name: xix3_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix3_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (rele_amreferencia, loca_id);


--
-- TOC entry 4517 (class 1259 OID 849813)
-- Name: xix4_un_resumo_ligacao_economia; Type: INDEX; Schema: public; Owner: gsan_admin; Tablespace: indices
--

CREATE INDEX xix4_un_resumo_ligacao_economia ON un_resumo_ligacao_economia USING btree (rele_amreferencia);


SET search_path = arrecadacao, pg_catalog;

--
-- TOC entry 4518 (class 2606 OID 849814)
-- Name: fk14_un_resumo_arrecadacao; Type: FK CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_arrecadacao
    ADD CONSTRAINT fk14_un_resumo_arrecadacao FOREIGN KEY (eppa_id) REFERENCES g_epoca_pagamento(eppa_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4519 (class 2606 OID 849822)
-- Name: fk20_un_resumo_arrecadacao; Type: FK CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_arrecadacao
    ADD CONSTRAINT fk20_un_resumo_arrecadacao FOREIGN KEY (arfm_id) REFERENCES g_arrecadacao_forma(arfm_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4520 (class 2606 OID 849828)
-- Name: fk21_un_resumo_arrecadacao; Type: FK CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_arrecadacao
    ADD CONSTRAINT fk21_un_resumo_arrecadacao FOREIGN KEY (arrc_id) REFERENCES g_arrecadador(arrc_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4521 (class 2606 OID 849833)
-- Name: fk22_un_resumo_arrecadacao; Type: FK CONSTRAINT; Schema: arrecadacao; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_arrecadacao
    ADD CONSTRAINT fk22_un_resumo_arrecadacao FOREIGN KEY (dvst_idatual) REFERENCES g_devolucao_situacao(dvst_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


SET search_path = cadastro, pg_catalog;

--
-- TOC entry 4522 (class 2606 OID 849838)
-- Name: fk1_g_gerencia_regional; Type: FK CONSTRAINT; Schema: cadastro; Owner: gsan_admin
--

ALTER TABLE ONLY g_gerencia_regional
    ADD CONSTRAINT fk1_g_gerencia_regional FOREIGN KEY (supt_id) REFERENCES g_superintendencia(supt_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4523 (class 2606 OID 849848)
-- Name: fk7_g_localidade; Type: FK CONSTRAINT; Schema: cadastro; Owner: gsan_admin
--

ALTER TABLE ONLY g_localidade
    ADD CONSTRAINT fk7_g_localidade FOREIGN KEY (muni_idprincipal) REFERENCES g_municipio(muni_id);


SET search_path = cobranca, pg_catalog;

--
-- TOC entry 4524 (class 2606 OID 849853)
-- Name: fk20_un_resumo_pendencia; Type: FK CONSTRAINT; Schema: cobranca; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_pendencia
    ADD CONSTRAINT fk20_un_resumo_pendencia FOREIGN KEY (fxvl_id) REFERENCES faixa_valor(fxvl_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4525 (class 2606 OID 849859)
-- Name: fk20_un_resumo_pendencia_sem_quadra; Type: FK CONSTRAINT; Schema: cobranca; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_pendencia_sem_quadra
    ADD CONSTRAINT fk20_un_resumo_pendencia_sem_quadra FOREIGN KEY (fxvl_id) REFERENCES faixa_valor(fxvl_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


SET search_path = faturamento, pg_catalog;

--
-- TOC entry 4530 (class 2606 OID 849864)
-- Name: fk15_un_resumo_refaturamento; Type: FK CONSTRAINT; Schema: faturamento; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_refaturamento
    ADD CONSTRAINT fk15_un_resumo_refaturamento FOREIGN KEY (lict_id) REFERENCES financeiro.g_lancamento_item_contabil(lict_id);


--
-- TOC entry 4526 (class 2606 OID 849869)
-- Name: fk1_g_faturamento_situacao_tipo; Type: FK CONSTRAINT; Schema: faturamento; Owner: gsan_admin
--

ALTER TABLE ONLY g_faturamento_situacao_tipo
    ADD CONSTRAINT fk1_g_faturamento_situacao_tipo FOREIGN KEY (lacs_idconsumoacobrarsemleitura) REFERENCES micromedicao.g_leitura_anormalidade_consumo(lacs_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4531 (class 2606 OID 849874)
-- Name: fk20_un_resumo_refaturamento; Type: FK CONSTRAINT; Schema: faturamento; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_refaturamento
    ADD CONSTRAINT fk20_un_resumo_refaturamento FOREIGN KEY (crtp_id) REFERENCES cadastro.g_cliente_relacao_tipo(crtp_id);


--
-- TOC entry 4527 (class 2606 OID 849879)
-- Name: fk2_g_faturamento_situacao_tipo; Type: FK CONSTRAINT; Schema: faturamento; Owner: gsan_admin
--

ALTER TABLE ONLY g_faturamento_situacao_tipo
    ADD CONSTRAINT fk2_g_faturamento_situacao_tipo FOREIGN KEY (lacs_idconsumoacobrarcomleitura) REFERENCES micromedicao.g_leitura_anormalidade_consumo(lacs_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4528 (class 2606 OID 849884)
-- Name: fk3_g_faturamento_situacao_tipo; Type: FK CONSTRAINT; Schema: faturamento; Owner: gsan_admin
--

ALTER TABLE ONLY g_faturamento_situacao_tipo
    ADD CONSTRAINT fk3_g_faturamento_situacao_tipo FOREIGN KEY (lalt_idleituraafaturarsemleitura) REFERENCES micromedicao.g_leitura_anormalidade_leitura(lalt_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4529 (class 2606 OID 849889)
-- Name: fk4_g_faturamento_situacao_tipo; Type: FK CONSTRAINT; Schema: faturamento; Owner: gsan_admin
--

ALTER TABLE ONLY g_faturamento_situacao_tipo
    ADD CONSTRAINT fk4_g_faturamento_situacao_tipo FOREIGN KEY (lalt_idleituraafaturarcomleitura) REFERENCES micromedicao.g_leitura_anormalidade_leitura(lalt_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


SET search_path = micromedicao, pg_catalog;

--
-- TOC entry 4533 (class 2606 OID 849894)
-- Name: fk18_un_resumo_coleta_esgoto; Type: FK CONSTRAINT; Schema: micromedicao; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_coleta_esgoto
    ADD CONSTRAINT fk18_un_resumo_coleta_esgoto FOREIGN KEY (ftst_id) REFERENCES faturamento.g_faturamento_situacao_tipo(ftst_id);


--
-- TOC entry 4534 (class 2606 OID 849899)
-- Name: fk19_un_resumo_coleta_esgoto; Type: FK CONSTRAINT; Schema: micromedicao; Owner: gsan_admin
--

ALTER TABLE ONLY un_resumo_coleta_esgoto
    ADD CONSTRAINT fk19_un_resumo_coleta_esgoto FOREIGN KEY (ftsm_id) REFERENCES faturamento.g_fat_sit_motivo(ftsm_id);


--
-- TOC entry 4532 (class 2606 OID 849904)
-- Name: fk23_un_resumo_leitura_anormalidade; Type: FK CONSTRAINT; Schema: micromedicao; Owner: gsan_admin
--

ALTER TABLE ONLY un_res_lt_anorm
    ADD CONSTRAINT fk23_un_resumo_leitura_anormalidade FOREIGN KEY (ltan_idanormalidadeinformada) REFERENCES g_leitura_anormalidade(ltan_id);


-- Completed on 2016-01-22 10:34:51 BRT

--
-- PostgreSQL database dump complete
--

