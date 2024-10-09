select av.avi_in_codigo "Cod",
       av.avi_st_titulo "Título",
        PACOTE.PRC_RETIRA_TAG_HTML(dbms_lob.substr(av.avi_st_descricao, 4000)) "Descrição",
      --PACOTE.PRC_RETIRA_TAG_HTML(av.avi_st_descricao) "Descrição",
       lo.orf_st_descricao "Departamento",
       av.avi_dt_inicio "Data",
       MAX(LEI.AVIL_DT_LEITURA) "Lido em",
       ''"Acompanhar"
       
  from intra_avisos av
 INNER JOIN INTRA_AVISOS_LEITURA LEI
        ON AV.AVI_IN_CODIGO = LEI.AVI_IN_CODIGO
        left join glo_vw_localizacao lo
        on lo.orf_in_reduzido = av.avi_in_depart
 INNER JOIN INTRA_AVISOS_DEPART DP ON DP.ID_INTRA_AVISOS = AV.AVI_IN_CODIGO
 where 1 = 1
   AND LEI.USU_IN_LEITURA = v('USER_APP')
   AND AV.AVI_DT_VALIDACAO IS NOT NULL
   AND DP.DEPARTAMENTO = v('USER_APP')
 GROUP BY AV.AVI_IN_CODIGO,
          AV.AVI_ST_TITULO,
           dbms_lob.substr(av.avi_st_descricao, 4000),
          lo.orf_st_descricao,
          AV.AVI_DT_INICIO
          order by AV.AVI_DT_INICIO desc