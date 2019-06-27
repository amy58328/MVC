SELECT	BLR.KEEPER_ID AS KeeperId,
		MM.USER_CNAME AS CName,
		MM.USER_ENAME AS EName,
		YEAR(BLR.LEND_DATE) AS BorrowYear,
		COUNT(*) AS BorrowCnt
FROM BOOK_LEND_RECORD AS BLR
LEFT JOIN MEMBER_M AS MM
	ON BLR.KEEPER_ID = MM.USER_ID
GROUP BY BLR.KEEPER_ID,MM.USER_CNAME,MM.USER_ENAME,YEAR(BLR.LEND_DATE)
ORDER BY BLR.KEEPER_ID