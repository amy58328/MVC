SELECT	BD.BOOK_ID AS '書本ID',
		FORMAT(BD.BOOK_BOUGHT_DATE,'d') AS '購書日期',
		REPLACE(FORMAT(BLR.LEND_DATE,'d','ko-kr'),'-','/') AS '借閱日期',
		BC.BOOK_CLASS_ID +'-'+BC.BOOK_CLASS_NAME AS '借書類別' , 
		MM.USER_ID+'-'+MM.USER_CNAME+'('+MM.USER_ENAME+')' AS '借閱人',
		BD.BOOK_STATUS+'-'+
		CASE
		WHEN BD.BOOK_STATUS='A' THEN '可以借出'
		WHEN  BD.BOOK_STATUS='B' THEN '已借出'
		WHEN  BD.BOOK_STATUS='C' THEN '不可借出'
		END AS '狀態',
		REPLACE(CONVERT(VARCHAR,CONVERT(MONEY,BD.BOOK_AMOUNT),1),'.00','') + '元' AS '購書金額'
FROM MEMBER_M AS MM
LEFT JOIN BOOK_LEND_RECORD AS BLR
	ON MM.USER_ID = BLR.KEEPER_ID
LEFT JOIN BOOK_DATA  AS BD
	ON BD.BOOK_ID = BLR.BOOK_ID
LEFT JOIN BOOK_CLASS AS BC
	ON BD.BOOK_CLASS_ID = BC.BOOK_CLASS_ID
WHERE  MM.USER_ID = 002
ORDER BY BD.BOOK_ID DESC