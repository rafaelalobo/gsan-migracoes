-- // add_funcionalidade_operacao_relatorio_amae
-- Migration SQL that makes the change goes here.
INSERT INTO seguranca.funcionalidade(
        fncd_id, modu_id, fncd_dsfuncionalidade, fncd_tmultimaalteracao, 
        fncd_dscaminhomenu, fncd_dscaminhourl, fncd_icpontoentrada, fncd_dsabreviado, 
        fncd_nnordemmenu, fncd_icnovajanela, fncd_icolap, fncg_id)
VALUES (16031,9,'Relatorio AMAE',now(),
'Gsan/Relatorios/Faturamento','filtrarRelatorioAgenciaReguladoraAction.do',1,'RelAgReg',0,2,2,104);

INSERT INTO seguranca.operacao(
        oper_id, fncd_id, oper_dsoperacao, oper_dsabreviado, oper_dscaminhourl, 
        oper_tmultimaalteracao, oper_idoperacaopesquisa, tbco_id, optp_id, 
        tbco_idargumento, oper_icregistratransacao)
VALUES (15052, 16031, 'Relatorio AMAE', 'RelAgReg', 'gerarRelatorioAgenciaReguladoraAction.do',now(), null, null, 13, 
null, 2);

INSERT INTO seguranca.grupo_func_operacao(grup_id, oper_id, fncd_id, gfop_tmultimaalteracao)
VALUES (1, 15052, 16031, now());


-- //@UNDO
-- SQL to undo the change goes here.
delete from seguranca.grupo_func_operacao 
where grup_id = 1 
and oper_id = 15052
and fncd_id = 16031;

delete from seguranca.operacao
where oper_id = 15052;

delete from seguranca.funcionalidade
where fncd_id = 16031;
