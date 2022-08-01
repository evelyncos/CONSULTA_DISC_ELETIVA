
SELECT DISTINCT A.* 
INTO #TEMP

		
FROM ALUNO A
	INNER JOIN GRADE G
		ON A.CURSO = G.CURSO
		AND A.CURRICULO = G.CURRICULO
		AND A.TURNO = G.TURNO
	INNER JOIN CURSO C
		ON A.CURSO = C.CURSO
		AND C.TIPO IN ('SUP_SEI', 'SUP_SEPI')
	INNER JOIN DISCIPLINA D
		ON G.DISCIPLINA = D.DISCIPLINA 	
	INNER JOIN HISTMATRICULA H
		ON A.ALUNO = H.ALUNO
		AND H.SITUACAO_HIST NOT IN ('APROVADO')
	INNER JOIN CURSOS_CONCL CC
		ON A.ALUNO = CC.ALUNO
		AND CC.MOTIVO = 'CONCLUSAO'
		AND CC.ANO_ENCERRAMENTO = '2022'

SELECT T.ALUNO, GE.* 
FROM #TEMP T
	INNER JOIN GRADE_ELET GE 
	 ON T.CURSO = GE.CURSO
		AND T.CURRICULO = GE.CURRICULO
		AND T.TURNO = GE.TURNO
	WHERE NOT EXISTS (SELECT H.ALUNO FROM HISORICO H WHERE T.ALUNO = H.ALUNO AND GE.DISCIPLINA = H.DISCIPLINA)










