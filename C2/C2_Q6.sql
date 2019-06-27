SELECT P.CLASSID AS ClassId,
	P.CLASSNAME AS ClassName,
	CASE  
	WHEN [2016] IS NOT NULL  THEN [2016]
	ELSE 0
	END AS [CNT2016],
	CASE  
	WHEN [2017] IS NOT NULL  THEN [2017]
	ELSE 0
	END AS [CNT2017],
	CASE  
	WHEN [2018] IS NOT NULL  THEN [2018]
	ELSE 0
	END AS [CNT2018],
	CASE  
	WHEN [2019] IS NOT NULL  THEN [2019]
	ELSE 0
	END AS [CNT2019]
FROM (SELECT BD.BOOK_CLASS_ID AS CLASSID,
			BC.BOOK_CLASS_NAME AS CLASSNAME,
			YEAR(BLR.LEND_DATE) AS CNT,
			COUNT(YEAR(BLR.LEND_DATE)) AS NUMBER
	FROM BOOK_LEND_RECORD AS BLR
	LEFT JOIN BOOK_DATA   AS BD
		ON BD.BOOK_ID = BLR.BOOK_ID
	LEFT JOIN BOOK_CLASS AS BC
		ON BD.BOOK_CLASS_ID = BC.BOOK_CLASS_ID
	GROUP BY YEAR(BLR.LEND_DATE),BD.BOOK_CLASS_ID,BC.BOOK_CLASS_NAME) AS RESULT
PIVOT (
	SUM(RESULT.NUMBER) FOR RESULT.CNT IN ([2016],[2017],[2018],[2019])  
) AS P

ORDER BY P.CLASSID