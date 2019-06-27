SELECT TOP(5)BLR.BOOK_ID,BD.BOOK_NAME,COUNT(*) AS QTY
FROM BOOK_LEND_RECORD AS blr
LEFT JOIN BOOK_DATA AS BD
	ON blr.BOOK_ID = BD.BOOK_ID
GROUP BY BLR.BOOK_ID,BD.BOOK_NAME
ORDER BY COUNT(BD.BOOK_ID) DESC,BLR.BOOK_ID