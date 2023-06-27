USE [DWH_Database]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---- =============================================
---- Author:		<Safa Kaçar>
---- =============================================

ALTER PROCEDURE [dbo].[spFeatureTypeMetricAnalysiswithMTD]
AS


declare @m		 as int  =  1, --Enter Month
		@BaseDay as Date =	CAST(GETDATE()	 AS DATE),
		@d       AS INT  =  1,	
		@DailySP AS Date =  CAST(GETDATE()-1 AS DATE)
		IF DAY(@BaseDay) = 1
		   BEGIN
		   SET @m = @m + 1
		   END
DELETE FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE [Date] = @DailySP
;
WITH RawData AS
	(
		SELECT
			
						[Date]
						
																				,CASE
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	-2 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 0 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  0 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  1 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  2 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  3 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 2 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 3 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 4 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 5 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 6 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 8 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType = 	 -7 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType =    0 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType = 	  1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType =  8 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 11 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	  0 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	  1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 14 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 15 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 17 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 18 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =    0 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =    1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 100 AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 23 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 25 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 27 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 28 AND Currency = 	1 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 0   AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 1   AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 2   AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType = 101 AND Currency = 0 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 101 AND Currency = 1 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 101 AND Currency = 2 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 101 AND Currency = 3 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 101 AND Currency = 4 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 24  AND Currency = 0 AND CardTxType =	-1 AND RemitmentType =   -1 AND  EntrySubType = 99	AND IsPhysicalCardTx = -1 THEN	0
																					
																					WHEN FeatureType =2 and	Currency = 0 and	CardTxType =  1 and	RemitmentType = 101 and	EntrySubType = 101 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = -7  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = 0   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = 1   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemitmentType = -7  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemitmentType = 0   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemitmentType = 1   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemitmentType = -7  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemitmentType = 0   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemitmentType = 1   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =8 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =29 and	Currency = 0 and	CardTxType = -1 and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1
																					WHEN FeatureType =2  and	Currency = 0 and	CardTxType = 7  and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1	
																					WHEN FeatureType =33 and	Currency = 0 and	CardTxType = -1 and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	1

																					WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =    -1 AND RemitmentType = -1 AND  EntrySubType =-28  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =	-1 AND RemitmentType = -32  AND  EntrySubType =99	AND IsPhysicalCardTx = -1 THEN	0
																					WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =	-1 AND RemitmentType =   0  AND  EntrySubType =99	AND IsPhysicalCardTx = -1 THEN	0
																					WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =	-1 AND RemitmentType =   1  AND  EntrySubType =99	AND IsPhysicalCardTx = -1 THEN	0
																				ELSE -1
																				END IsDirectRevenue
																			   ,CASE
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	-2 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	0
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 0 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	1
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	2
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  0 THEN 	3
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  1 THEN 	4
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  2 THEN 	5
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 1 AND RemitmentType = 	101 AND  EntrySubType = 101 AND IsPhysicalCardTx =  3 THEN 	6
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 2 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	7
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 3 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	8
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 4 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	9
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 5 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	10
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 6 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	11
																					WHEN FeatureType =  2 AND Currency  = 0 AND CardTxType = 	 8 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	12
																					WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType = 	 -7 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	13
																					WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType =    0 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	14
																					WHEN FeatureType =  7 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType = 	  1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	15
																					WHEN FeatureType =  8 AND Currency  = 0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	16
																					WHEN FeatureType = 11 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	17
																					WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	  0 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	18
																					WHEN FeatureType = 12 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	  1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	19
																					WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	20
																					WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	21
																					WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	22
																					WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	23
																					WHEN FeatureType = 13 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	24
																					WHEN FeatureType = 13 AND Currency = 	1 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	25
																					WHEN FeatureType = 13 AND Currency = 	2 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	26
																					WHEN FeatureType = 13 AND Currency = 	4 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	27
																					WHEN FeatureType = 14 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	28
																					WHEN FeatureType = 15 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	29
																					WHEN FeatureType = 17 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	30
																					WHEN FeatureType = 18 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	31
																					WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	32
																					WHEN FeatureType = 19 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType = 	 -1 AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	33
																					WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =    0 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	34
																					WHEN FeatureType = 20 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =    1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	35
																					WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	36
																					WHEN FeatureType = 22 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 100 AND IsPhysicalCardTx = -1 THEN 	37
																					WHEN FeatureType = 23 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	38
																					WHEN FeatureType = 25 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	39
																					WHEN FeatureType = 27 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	40
																					WHEN FeatureType = 28 AND Currency = 	1 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 99  AND IsPhysicalCardTx = -1 THEN 	41
																					WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 0   AND IsPhysicalCardTx = -1 THEN 	42
																					WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 1   AND IsPhysicalCardTx = -1 THEN 	43
																					WHEN FeatureType = 29 AND Currency = 	0 AND CardTxType = 	-1 AND RemitmentType =   -1 AND  EntrySubType = 2   AND IsPhysicalCardTx = -1 THEN 	44
																					WHEN FeatureType = 101 AND Currency = 0 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	45
																					WHEN FeatureType = 101 AND Currency = 1 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	46
																					WHEN FeatureType = 101 AND Currency = 2 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	47
																					WHEN FeatureType = 101 AND Currency = 3 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	48
																					WHEN FeatureType = 101 AND Currency = 4 AND CardTxType =   101 AND RemitmentType =  101 AND  EntrySubType = 101 AND IsPhysicalCardTx = -1 THEN 	49
																					WHEN FeatureType = 24  AND Currency = 0 AND CardTxType =	-1 AND RemitmentType =   -1 AND  EntrySubType = 99	AND IsPhysicalCardTx = -1 THEN	50
																					
																					WHEN FeatureType =2 and	Currency = 0 and	CardTxType =  1 and	RemitmentType = 101 and	EntrySubType = 101 and	IsPhysicalCardTx = -1 THEN	51
																					WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = -7  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	52
																					WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = 0   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	53
																					WHEN FeatureType =7 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = 1   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	54
																					WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemitmentType = -7  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	55
																					WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemitmentType = 0   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	56
																					WHEN FeatureType =7 and	Currency = 2 and	CardTxType = -1 and	RemitmentType = 1   and	EntrySubType = 99 and	IsPhysicalCardTx = -1	THEN	57
																					WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemitmentType = -7  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	58
																					WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemitmentType = 0   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	59
																					WHEN FeatureType =7 and	Currency = 4 and	CardTxType = -1 and	RemitmentType = 1   and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	60
																					WHEN FeatureType =8 and	Currency = 1 and	CardTxType = -1 and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	61
																					WHEN FeatureType =29 and	Currency = 0 and	CardTxType = -1 and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	62
																					WHEN FeatureType =2 and	Currency = 0 and	CardTxType =  7 and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	63
																					WHEN FeatureType =33 and	Currency = 0 and	CardTxType = -1 and	RemitmentType = -1  and	EntrySubType = 99 and	IsPhysicalCardTx = -1 THEN	64
																					
																					WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =   -1 AND	RemitmentType = -1  AND  EntrySubType = 50  AND IsPhysicalCardTx = -1 THEN 	65
																					WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =   -1 AND	RemitmentType = -1  AND  EntrySubType = 51  AND IsPhysicalCardTx = -1 THEN 	66
																					WHEN FeatureType = 28 AND Currency = 	0 AND CardTxType =   -1 AND	RemitmentType = -1  AND  EntrySubType =-28  AND IsPhysicalCardTx = -1 THEN 	67
																					WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =   -1 AND RemitmentType = -32  AND  EntrySubType =99	AND IsPhysicalCardTx = -1 THEN	68
																					WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =   -1 AND RemitmentType =   0  AND  EntrySubType =99	AND IsPhysicalCardTx = -1 THEN	69
																					WHEN FeatureType = 32 AND Currency =  0 AND CardTxType =   -1 AND RemitmentType =   1  AND  EntrySubType =99	AND IsPhysicalCardTx = -1 THEN	70
																				ELSE -1
																				END CombinationType
						,FeatureType
						,Currency
						,CardTxType
						,RemitmentType
						,EntrySubType
						,IsPhysicalCardTx
		
						,	ISNULL(UnapprovedUUCount	,0)	UnapprovedUUCount
						,	ISNULL(ApprovedUUCount		,0)	ApprovedUUCount
						,	ISNULL(VerifiedUUCount		,0)	VerifiedUUCount
						,	ISNULL(UnapprovedUUTxCount	,0)	UnapprovedUUTxCount
						,	ISNULL(ApprovedUUTxCount	,0)	ApprovedUUTxCount
						,	ISNULL(VerifiedUUTxCount	,0)	VerifiedUUTxCount	
						,	ISNULL(UnapprovedUUTxVolume	,0)	UnapprovedUUTxVolume
						,	ISNULL(ApprovedUUTxVolume	,0)	ApprovedUUTxVolume
						,	ISNULL(VerifiedUUTxVolume	,0)	VerifiedUUTxVolume	
						,	ISNULL(UnapprovedUUTxFee	,0)	UnapprovedUUTxFee
						,	ISNULL(ApprovedUUTxFee		,0)	ApprovedUUTxFee
						,	ISNULL(VerifiedUUTxFee		,0)	VerifiedUUTxFee	
						,	ISNULL(TotalTxCount			,0)	TotalTxCount
						,	ISNULL(TotalTxVolume		,0)	TotalTxVolume
						,	ISNULL(TotalTxFee			,0)	TotalTxFee
						,	ISNULL(AvgAgebyUU			,0)	AvgAgebyUU		
						,	ISNULL(AvgUserLifeTimebyUU	,0)	AvgUserLifeTimebyUU	
						,	ISNULL(UUwithTx				,0)	UUwithTx
						,	ISNULL(UUwithTxLocked		,0)	UUwithTxLocked
						,	ISNULL(UUwithTxOpen			,0)	UUwithTxOpen
						--,	AvgTime
						,		UUwithTx_MTD
					--	,		AvgAgebyUU_MTD
					--	,		AvgLifeTimebyUU_MTD
					--	,		AvgAgebyFemaleUU_MTD
					--	,		AvgLifeTimebyFemaleUU_MTD
					--	,		AvgAgebyMaleUU_MTD
					--	,		AvgLifeTimebyMaleUU_MTD
					--	,		AvgDistinctTxDayCount_MTD
						,TotalTxVolume_MTD
						,TotalTxFee_MTD
						,TotalTxCount_MTD
				--		,AvgAgebyTx_MTD
						,AvgLifeTimebyTx_MTD
						--,AvgTime_MTD
						,ISNULL(UnapprovedUURate				,0) UnapprovedUURate			
						,ISNULL(ApprovedUURate					,0)	ApprovedUURate				
						,ISNULL(VerifiedUURate					,0)	VerifiedUURate				
						,ISNULL(UnapprovedUserTxRate			,0)	UnapprovedUserTxRate		
						,ISNULL(ApprovedUserTxRate				,0)	ApprovedUserTxRate			
						,ISNULL(VerifiedUserTxRate				,0)	VerifiedUserTxRate			
						,ISNULL(UnapprovedUserTxVolumeRate		,0)	UnapprovedUserTxVolumeRate	
						,ISNULL(ApprovedUserTxVolumeRate		,0)	ApprovedUserTxVolumeRate	
						,ISNULL(VerifiedUserTxVolumeRate		,0)	VerifiedUserTxVolumeRate	
						,ISNULL(UnapprovedUserTxFeeRate			,0)	UnapprovedUserTxFeeRate		
						,ISNULL(ApprovedUserTxFeeRate			,0)	ApprovedUserTxFeeRate		
						,ISNULL(VerifiedUserTxFeeRate			,0)	VerifiedUserTxFeeRate		
		--INTO #UPDATINGTEMP
		--INTO BI_Workspace..FeatureTypeMetricAnalysiswithMTDx
		FROM
		(
				SELECT
														-- FORMAT(p1.GroupedMonthDate,'yyyyMM') MonthKey --geri eski haline getirilecek-- case when gereksiz
														P1.[Date]
													   ,P1.FeatureType
													   ,P1.Currency
													   ,P1.CardTxType
													   ,P1.RemitmentType
													   ,P1.EntrySubType
													   ,P1.IsPhysicalCardTx											
														,	UnapprovedUUCount
														,	ApprovedUUCount
														,	VerifiedUUCount
														,	UnapprovedUUTxCount
														,	ApprovedUUTxCount
														,	VerifiedUUTxCount	
														,	UnapprovedUUTxVolume
														,	ApprovedUUTxVolume
														,	VerifiedUUTxVolume	
														,	UnapprovedUUTxFee
														,	ApprovedUUTxFee
														,	VerifiedUUTxFee	
											--			,	FemaleTxCount
											--			,	MaleTxCount
											--			,	NonNullGenderUUCount
											--			,	NonNullGenderTxCount
														,	TotalTxCount
														,	TotalTxVolume
														,	TotalTxFee
														,	AvgAgebyUU
											--			,	AvgAgebyUUKnownGenders		
											--			,	FemaleUUCount
											--			,	MaleUUCount
											--			,	AvgFemaleUserLifeTimebyUU
											--			,	AvgMaleUserLifeTimebyUU	
											--			,	AvgFemaleAgebyUU
											--			,	AvgMaleAgebyUU			
														,	AvgUserLifeTimebyUU		
														,	UUwithTx
														,	UUwithTxLocked
														,	UUwithTxOpen
														--,	AvgTime
														,		UUwithTx_MTD
													--	,		AvgAgebyUU_MTD
													--	,		AvgLifeTimebyUU_MTD
											--			,		UUFemaleWithTx_MTD
											--			,		UUMaleWithTx_MTD
											--			,		UUUnknownGenderWithTx_MTD
													--	,		AvgAgebyFemaleUU_MTD
													--	,		AvgLifeTimebyFemaleUU_MTD
													--	,		AvgAgebyMaleUU_MTD
													--	,		AvgLifeTimebyMaleUU_MTD
													--	,		AvgDistinctTxDayCount_MTD
				/*MTD'leştirilecek kısım*/		
					  
					  ,SUM(TotalTxVolume) OVER (PARTITION BY p1.FeatureType,p1.CardTxType, p1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY p1.[Date]) TotalTxVolume_MTD
					  ,SUM(TotalTxFee)	  OVER (PARTITION BY p1.FeatureType,p1.CardTxType, p1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY p1.[Date]) TotalTxFee_MTD
					  ,SUM(TotalTxCount)  OVER (PARTITION BY p1.FeatureType,p1.CardTxType, p1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY p1.[Date]) TotalTxCount_MTD
														--,(SUM(ParameterSumAge)		OVER (PARTITION BY P1.FeatureType,P1.CardTxType, P1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY P1.[Date]))*1.000
														--	/ (SUM(TotalTxCount)	OVER (PARTITION BY P1.FeatureType,P1.CardTxType, P1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY P1.[Date]))*1.000	AvgAgebyTx_MTD
														,(SUM(ParameterSumLifeTime) OVER (PARTITION BY P1.FeatureType,P1.CardTxType, P1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY P1.[Date]))*1.000
															/ (SUM(TotalTxCount)	OVER (PARTITION BY P1.FeatureType,P1.CardTxType, P1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY P1.[Date]))*1.000	AvgLifeTimebyTx_MTD
						--								,(SUM(SumParameterTime_Manipulated) OVER (PARTITION BY p1.FeatureType,p1.CardTxType, p1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY p1.[Date]))
						--/ (SUM(TotalTxCount) OVER (PARTITION BY P1.FeatureType,P1.CardTxType, P1.RemitmentType, P1.EntrySubType, P1.YearDate, p1.MonthDate, P1.Currency ORDER BY P1.[Date]))				AvgTime_MTD
														--,((SUM(SumParameterTime_hh_Manipulated) OVER (PARTITION BY p1.FeatureType,p1.CardTxType, p1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY p1.[Date]))
														--	/ (SUM(TotalTxCount) OVER (PARTITION BY P1.FeatureType,P1.CardTxType, P1.RemitmentType, P1.EntrySubType,p1.YearDate, p1.MonthDate, P1.Currency ORDER BY P1.[Date]))	)	* 100
														--+
														--((SUM(SumParameterTime_mm_Manipulated) OVER (PARTITION BY p1.FeatureType,p1.CardTxType, p1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY p1.[Date]))
														--	/ (SUM(TotalTxCount) OVER (PARTITION BY P1.FeatureType,P1.CardTxType, P1.RemitmentType, P1.EntrySubType, p1.YearDate, p1.MonthDate, P1.Currency ORDER BY P1.[Date]))	)			AvgTime_MTD
				/*UserTypes*/
					  ,COALESCE(UnapprovedUUCount*1.0		/	(NULLIF(UUwithTx, 0)),0)			UnapprovedUURate	
					  ,COALESCE(ApprovedUUCount*1.0			/	(NULLIF(UUwithTx, 0)),0)			ApprovedUURate	
					  ,COALESCE(VerifiedUUCount*1.0			/	(NULLIF(UUwithTx, 0)),0)			VerifiedUURate	
					  ,COALESCE(UnapprovedUUTxCount*1.0		/	(NULLIF(TotalTxCount, 0)),0)		UnapprovedUserTxRate
					  ,COALESCE(ApprovedUUTxCount*1.0		/	(NULLIF(TotalTxCount, 0)),0)		ApprovedUserTxRate	
					  ,COALESCE(VerifiedUUTxCount*1.0		/	(NULLIF(TotalTxCount, 0)),0)		VerifiedUserTxRate	
					  ,COALESCE(UnapprovedUUTxVolume*1.0	/	(NULLIF(TotalTxVolume,0)),0)		UnapprovedUserTxVolumeRate	
					  ,COALESCE(ApprovedUUTxVolume*1.0		/	(NULLIF(TotalTxVolume,0)),0)		ApprovedUserTxVolumeRate	
					  ,COALESCE(VerifiedUUTxVolume*1.0		/	(NULLIF(TotalTxVolume,0)),0)		VerifiedUserTxVolumeRate	
					  ,COALESCE(UnapprovedUUTxFee*1.0		/	(NULLIF(TotalTxFee, 0))  ,0)		UnapprovedUserTxFeeRate	
					  ,COALESCE(ApprovedUUTxFee*1.0			/	(NULLIF(TotalTxFee, 0))  ,0)		ApprovedUserTxFeeRate		
					  ,COALESCE(VerifiedUUTxFee*1.0			/	(NULLIF(TotalTxFee, 0))  ,0)		VerifiedUserTxFeeRate	
		
		
																						--üst
																									  --					,MIN(TotalTxCount) MinimumTxCount
																											--,MAX(CASE WHEN QuartileTxCount = 1 THEN TotalTxCount END)														[1QuartileTxCount]
																											--,MAX(CASE WHEN QuartileTxCount = 2 THEN TotalTxCount END)														MedianTxCount
																											--,MAX(CASE WHEN QuartileTxCount = 3 THEN TotalTxCount END)														[3QuartileTxCount]
																											--,MAX(CASE WHEN QuartileTxCount = 3 THEN TotalTxCount END) - MAX(CASE WHEN QuartileTxCount = 1 THEN TotalTxCount END)	IQRTxCount
																											--,MAX(TotalTxCount)																								MaximumTxCount
																											--	,MIN(TotalTxVolume) MinimumTxVolume
																											--	,MAX(CASE WHEN QuartileTotalVolume = 1 THEN TotalTxVolume END)													   [1QuartileTotalVolume]
																											--	,MAX(CASE WHEN QuartileTotalVolume = 2 THEN TotalTxVolume END)													   MedianTxVolume
																											--	,MAX(CASE WHEN QuartileTotalVolume = 3 THEN TotalTxVolume END)													   [3QuartileTotalVolume]
																											--	,MAX(CASE WHEN QuartileTotalVolume = 3 THEN TotalTxVolume END) - MAX(CASE WHEN TotalTxVolume = 1 THEN TotalTxVolume END) IQRTxVolume
																											--	,MAX(TotalTxVolume)																								   MaximumTxVolume
																											--		,MIN(TotalTxFee) MinimumTxFee
																											--		,MAX(CASE WHEN QuartileTotalFee = 1 THEN TotalTxFee END)													  [1QuartileTotalFee]
																											--		,MAX(CASE WHEN QuartileTotalFee = 2 THEN TotalTxFee END)													  MedianTxFee
																											--		,MAX(CASE WHEN QuartileTotalFee = 3 THEN TotalTxFee END)													  [3QuartileTotalFee]
																											--		,MAX(CASE WHEN QuartileTotalFee = 3 THEN TotalTxFee END) - MAX(CASE WHEN TotalTxFee = 1 THEN TotalTxFee END) IQRTxFee
																											--		,MAX(TotalTxFee)																							  MaximumTxFee
																						--alt
																											--,NTILE(4) over (Partition by a.FeatureType, a.CardTxType, a.EntrySubType, a.RemitmentType, a.IsPhysicalCardTx order by TotalTxCount)	QuartileTxCount
																											--,NTILE(4) over (Partition by a.FeatureType, a.CardTxType, a.EntrySubType, a.RemitmentType, a.IsPhysicalCardTx order by TotalTxVolume) QuartileTotalVolume
																											--,NTILE(4) over (Partition by a.FeatureType, a.CardTxType, a.EntrySubType, a.RemitmentType, a.IsPhysicalCardTx order by TotalTxFee)	QuartileTotalFee	
		
		--INTO BI_Workspace.dbo.FeatureTypeMetricAnalysiswithMTD
				FROM
						(
		
													SELECT
														 a.YearDate, a.MonthDate --	'GroupedMonthDate'
														,a.[Date]
														,a.FeatureType
														,a.Currency
														,CardTxType
														,RemitmentType --(NULLIF(x, 0)), 0))
														,EntrySubType
														,IsPhysicalCardTx
														,ISNULL(COUNT(DISTINCT CASE WHEN UserType = 0 THEN A.UserKey	 ELSE NULL END),0)  UnapprovedUUCount
														,ISNULL(COUNT(DISTINCT CASE WHEN UserType = 1 THEN A.UserKey	 ELSE NULL END),0)  ApprovedUUCount
														,ISNULL(COUNT(DISTINCT CASE WHEN UserType = 2 THEN A.UserKey	 ELSE NULL END),0)  VerifiedUUCount
														,ISNULL(SUM(		   CASE WHEN UserType = 0 THEN A.TxCount	 ELSE NULL END),0)  UnapprovedUUTxCount
														,ISNULL(SUM(		   CASE WHEN UserType = 1 THEN A.TxCount	 ELSE NULL END),0)  ApprovedUUTxCount
														,ISNULL(SUM(		   CASE WHEN UserType = 2 THEN A.TxCount	 ELSE NULL END),0)  VerifiedUUTxCount											
														,ABS(ISNULL(SUM(	   CASE WHEN UserType = 0 THEN A.TotalVolume ELSE NULL END),0)) UnapprovedUUTxVolume
														,ABS(ISNULL(SUM(	   CASE WHEN UserType = 1 THEN A.TotalVolume ELSE NULL END),0)) ApprovedUUTxVolume
														,ABS(ISNULL(SUM(	   CASE WHEN UserType = 2 THEN A.TotalVolume ELSE NULL END),0)) VerifiedUUTxVolume	
														,ABS(ISNULL(SUM(	   CASE WHEN UserType = 0 THEN A.TotalFee	 ELSE NULL END),0)) UnapprovedUUTxFee
														,ABS(ISNULL(SUM(	   CASE WHEN UserType = 1 THEN A.TotalFee	 ELSE NULL END),0)) ApprovedUUTxFee
														,ABS(ISNULL(SUM(	   CASE WHEN UserType = 2 THEN A.TotalFee	 ELSE NULL END),0)) VerifiedUUTxFee	
											--			,ISNULL(SUM(		   CASE WHEN Gender = 2	  THEN TxCount		 ELSE NULL END),0)	FemaleTxCount
											--			,ISNULL(SUM(		   CASE WHEN Gender = 1	  THEN TxCount		 ELSE NULL END),0)	MaleTxCount
											--			,ISNULL(COUNT(		   CASE WHEN Gender IN (1,2) THEN Gender	 ELSE NULL END),0)	NonNullGenderUUCount											
											--			,ISNULL(SUM(		   CASE WHEN Gender IN (1,2) THEN TxCount	 ELSE NULL END),0)	NonNullGenderTxCount		
														,ISNULL(SUM(a.TxCount),0)															TotalTxCount
														,ISNULL(ABS(SUM(a.TotalVolume)),0)													TotalTxVolume
														,ISNULL(ABS(SUM(a.TotalFee)),0)														TotalTxFee
														,ISNULL(AVG(    CASE WHEN UserType != 0 AND DateOfBirth < [Date]   THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25) ELSE NULL END),0)					   AvgAgebyUU
											--			,ISNULL(AVG(    CASE WHEN UserType != 0 AND DateOfBirth < [Date] AND Gender IN (1,2)  THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25) ELSE NULL END),0) AvgAgebyUUKnownGenders												
											--			,ISNULL(COUNT(	CASE WHEN Gender = 2	  THEN Gender  ELSE NULL END),0)																			   FemaleUUCount
											--			,ISNULL(COUNT(	CASE WHEN Gender = 1	  THEN Gender  ELSE NULL END),0)																			   MaleUUCount
											--			,ISNULL(( AVG(  CASE WHEN Gender = 2	  THEN DATEDIFF(DAY,CreatedAt, [Date])	ELSE NULL END))/(365.25)	,0)										   AvgFemaleUserLifeTimebyUU
											--			,ISNULL((AVG(   CASE WHEN Gender = 1		  THEN DATEDIFF(DAY,CreatedAt, [Date])	ELSE NULL END))/(365.25)	,0)									   AvgMaleUserLifeTimebyUU		
											--			,ISNULL(AVG(    CASE WHEN Gender = 2 AND UserType != 0 AND DateOfBirth < [Date] THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25)	ELSE NULL END),0) 	   AvgFemaleAgebyUU
											--			,ISNULL( AVG(   CASE WHEN Gender = 1 AND UserType != 0 AND DateOfBirth < [Date] THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25)	ELSE NULL END),0) 	   AvgMaleAgebyUU			
														,ISNULL(AVG(DATEDIFF(DAY,CreatedAt,  [Date]))/(365.25)	,0)																							   AvgUserLifeTimebyUU												
														,ISNULL(COUNT(DISTINCT a.UserKey)													,0)					 											   UUwithTx
														,ISNULL(COUNT(DISTINCT CASE WHEN A.IsPassiveAccount=1 THEN a.UserKey ELSE NULL END)	,0)					 											   UUwithTxLocked
														,ISNULL(COUNT(DISTINCT CASE WHEN A.IsPassiveAccount=0 THEN a.UserKey ELSE NULL END)	,0)					 											   UUwithTxOpen	
														
														/*DIVISIONS*/
		
		
														,	COALESCE(COUNT(DISTINCT CASE WHEN A.IsPassiveAccount=1 THEN a.UserKey ELSE NULL END)*1.0/(NULLIF(COUNT(DISTINCT a.UserKey), 0))	,0)																																					  UUwithTxLockedRateOverUUwithTx
														,	COALESCE(COUNT(DISTINCT CASE WHEN A.IsPassiveAccount=0 THEN a.UserKey ELSE NULL END)*1.0	/(NULLIF(COUNT(DISTINCT a.UserKey), 0))	,0)																																				  UUwithTxOpenRateOverUUwithTx			
														,	COALESCE(SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount ELSE NULL END)*1.000/(NULLIF(SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] THEN TxCount ELSE NULL END), 0)), 0)										  AvgAgebyTx  
														--,	COALESCE(SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] AND Gender IN (1,2) THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount ELSE NULL END)*1.000/(NULLIF(SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] AND Gender IN (1,2) THEN TxCount ELSE NULL END), 0)), 0) AvgAgebyTxKnownGenders
														,	COALESCE(SUM((DATEDIFF(DAY,CreatedAt,  [Date])/(365.25))*TxCount)/(NULLIF(SUM(a.TxCount), 0)), 0)																																													  AvgUserLifeTimebyTx		
														--,	COALESCE(SUM(CASE WHEN Gender = 2 AND UserType != 0 AND DateOfBirth < [Date]  THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount	ELSE NULL END)*1.000 /(NULLIF(SUM(CASE WHEN UserType != 0 AND (DateOfBirth < [Date]) AND Gender = 2 THEN TxCount	ELSE NULL END), 0)), 0)	  AvgFemaleAgeOverFemalebyTx																																										
														--,	COALESCE(SUM(CASE WHEN Gender = 1 AND UserType != 0 AND DateOfBirth < [Date]  THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount ELSE NULL END)*1.000/(NULLIF(SUM(CASE WHEN UserType != 0 AND (DateOfBirth < [Date]) AND Gender = 1 THEN TxCount ELSE NULL END), 0)), 0)		  AvgMaleAgeOverMalebyTx																								
														--,	COALESCE(SUM(CASE WHEN Gender = 2	THEN (DATEDIFF(DAY,CreatedAt,  [Date])/(365.25))*TxCount ELSE NULL END)/(NULLIF(SUM(CASE WHEN Gender = 2 THEN TxCount ELSE NULL END), 0)), 0)																									  AvgFemaleOverFemaleLifeTimebyTx																										  
														--,	COALESCE(SUM(CASE WHEN Gender = 1	THEN (DATEDIFF(DAY,CreatedAt,  [Date])/(365.25))*TxCount ELSE NULL END)/(NULLIF(SUM(CASE WHEN Gender = 1 THEN TxCount ELSE NULL END), 0)), 0)																									  AvgMaleOverMaleLifeTimebyTx
														--,	COALESCE(COUNT(CASE WHEN Gender = 2	THEN Gender ELSE NULL END)*1.000/(NULLIF(COUNT(CASE WHEN Gender IN (1,2) THEN Gender  ELSE NULL END), 0)), 0)																																	  FemaleUURate
														--,	COALESCE(SUM(CASE WHEN Gender = 2 THEN TxCount ELSE NULL END)*1.000/(NULLIF(SUM(CASE WHEN Gender IN (1,2) THEN TxCount ELSE NULL END), 0)), 0)																																		  FemaleTxRate
														--,	COALESCE(SUM(CASE WHEN Gender = 1 THEN TxCount ELSE NULL END)*1.000/(NULLIF(SUM(CASE WHEN Gender IN (1,2) THEN TxCount ELSE NULL END), 0)), 0)																																		  MaleTxRate
														,	COALESCE(ABS(ABS(SUM(a.TotalVolume)))*1.000/(NULLIF(SUM(a.TxCount), 0)), 0)																																																			  AvgTicketSize
														,	COALESCE(ABS(ABS(SUM(a.TotalVolume)))*1.000/(NULLIF(AVG(DATEDIFF(DAY,CreatedAt,  [Date]))/(365.25), 0)), 0)																																											  AvgTxVolumePerCapita
														,	COALESCE(SUM(a.TxCount)*1.000 /(NULLIF(AVG(DATEDIFF(DAY,CreatedAt,  [Date]))/(365.25), 0)), 0)																																														  AvgTxCountPerCapita
		
												--		,	(COALESCE(SUM(a.SumParameterTime_hh) /(NULLIF(SUM(a.TxCount), 0)), 0))*100 + (COALESCE(SUM(a.SumParameterTime_mm) /(NULLIF(SUM(a.TxCount), 0)), 0))					AvgTime
		
															--SumParameterTime
														
																	/*PARAMETRIC DEFINITIONS FOR MTD*/
																	--,SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount ELSE NULL END)*1.000 					ParameterSumAge
																	,SUM(CASE WHEN UserType != 0 AND CreatedAt < [Date]	  THEN (DATEDIFF(DAY,CreatedAt,[Date])/(365.25))*TxCount ELSE NULL END)*1.000 						ParameterSumLifeTime
																	,SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] THEN TxCount ELSE NULL END)																		ParameterSumTxCountAge
																	--,SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] AND Gender IN (1,2) THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount ELSE NULL END)*1.000 ParameterSumAgeKnownGender
																	--,SUM(CASE WHEN UserType != 0 AND DateOfBirth < [Date] AND Gender IN (1,2) THEN TxCount ELSE NULL END)													ParameterSumTxCountAgeKnownGender
																	,SUM((DATEDIFF(DAY,CreatedAt,  [Date])/(365.25))*TxCount) 																								ParameterAgeYearxTxCount
																	--,SUM((CASE WHEN Gender = 2 AND UserType != 0 AND DateOfBirth < [Date]  THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount	ELSE NULL END) )*1.000  ParameterSumFemaleAgebyUUXTx
																	--,SUM(CASE WHEN UserType != 0 AND (DateOfBirth < [Date]) AND Gender = 2 THEN TxCount	ELSE NULL END)														ParameterSumFemaleAgebyUUTx
																	--,SUM((CASE WHEN Gender = 1 AND UserType != 0 AND DateOfBirth < [Date]  THEN (DATEDIFF(DAY,DateOfBirth,[Date])/(365.25))*TxCount ELSE NULL END) )*1.000	ParameterSumMaleAgebyUUXTx
																	--,SUM(CASE WHEN UserType != 0 AND (DateOfBirth < [Date]) AND Gender = 1 THEN TxCount ELSE NULL END)														ParameterSumMaleAgebyUUTx
																	--,SUM( CASE WHEN Gender = 2	THEN (DATEDIFF(DAY,CreatedAt,  [Date])/(365.25))*TxCount ELSE NULL END)														ParameterSumFemaleLifeTimeXTx
																	--,SUM( CASE WHEN Gender = 1	THEN (DATEDIFF(DAY,CreatedAt,  [Date])/(365.25))*TxCount ELSE NULL END)														ParameterSumMaleLifeTimeXTx
																	--,SUM(SumParameterTime_hh)																																SumParameterTime_hh_Manipulated
																	--,SUM(SumParameterTime_mm)																																SumParameterTime_mm_Manipulated
																	--,SUM(  CASE WHEN UserType != 0 AND DateOfBirth < [Date]						THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25) ELSE NULL END),0)				
																	--,SUM(  CASE WHEN UserType != 0 AND DateOfBirth < [Date] AND Gender IN (1,2) THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25) ELSE NULL END)
		
																			  
		
		
													FROM
																	(
																		Select  K.UserKey
																			   ,u.CreatedAt
																			   ,k.Currency
																			   ,k.TxCount
																			   ,k.TotalVolume
																			   ,k.TotalFee
																			   --,k.SumParameterTime_hh
																			   --,k.SumParameterTime_mm
																			   ,k.YearDate
																			   ,k.MonthDate
																			   ,k.[Date]
																			   ,IsPassiveAccount
																			   ,u.DateOfBirth
																--			   ,u.Gender
																			   ,u.UserType
																			   ,k.FeatureType
																			   ,k.CardTxType
																			   ,k.RemitmentType
																			   ,k.EntrySubType
																			   ,k.IsPhysicalCardTx
																			   
																			   
																			   
																		From
																					(
																					/**/
																								select count(Id)							   'TxCount'
																									  ,sum(Amount)							   'TotalVolume'
																									  ,sum(Fee)								   'TotalFee'
																									  --,SUM(CAST(FORMAT(CreatedAt,'HH') AS TINYINT)) SumParameterTime_hh
																									  --,SUM(CAST(FORMAT(CreatedAt,'mm') AS TINYINT)) SumParameterTime_mm
																									  ,cast(CreatedAt as date)					[Date]
																									  --,dateadd(day, 1, eomonth(CreatedAt, -1)) 'SOM' --SOM=Startdayofthemonth
																									  ,YEAR(CreatedAt)  YearDate
																									  ,MONTH(CreatedAt) MonthDate
																									  ,UserKey
																									  ,FeatureType
																									  ,Currency
																									  ,CASE WHEN IsPhysicalCardTx		   IS NULL THEN -1 ELSE IsPhysicalCardTx		  END IsPhysicalCardTx
																									  ,CASE WHEN CardTxType  IS NULL THEN -1 ELSE CardTxType  END CardTxType
																									  ,CASE WHEN EntrySubType	   IS NULL THEN 99 ELSE EntrySubType	  END EntrySubType
																									  ,CASE WHEN RemitmentType IS NULL THEN -1 ELSE RemitmentType END RemitmentType		--GÜNLÜĞE ÇEVRİLİR, TARİH ARALIĞI GÜN OLUR. DİĞER SORGU TARİH ARALIĞI AY KALIR. ALT LİMİT DATEADD(DAY,-@d,@BaseDay)
																								from (
																										Select Id, Currency, ABS(Amount)/*Mutlak değer aldık.*/ Amount, Fee, CreatedAt, UserKey,	   FeatureType,'101'   EntrySubType, CardTxType,'101' RemitmentType, CASE WHEN IsPhysicalCardTx IS NULL AND OperatorUserKey IS NOT NULL THEN 2 WHEN IsPhysicalCardTx IS NULL AND OperatorUserKey IS NULL AND IsCancellation = 1 THEN 3 ELSE IsPhysicalCardTx END IsPhysicalCardTx FROM FACT_Ledger	 (nolock) where FeatureType = 2 AND CardTxType = 1 AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
																										UNION all	 																									
																										Select Id, Currency, ABS(Amount)/*Mutlak değer aldık.*/ Amount, Fee, CreatedAt, UserKey, '101' FeatureType,'101'   EntrySubType,'101'  CardTxType,'101' RemitmentType, '-1' IsPhysicalCardTx FROM FACT_Ledger	 (nolock) where FeatureType IN (8,26,7,2,11,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,32,33) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
																										UNION all	 																															 
																										Select Id, Currency, Amount, Fee, CreatedAt, UserKey, FeatureType,	  CASE WHEN FeatureType = 19 AND SIGN(Amount) = -1 AND IsCancellation = 0 THEN 51
																																											  	   WHEN FeatureType = 19 AND SIGN(Amount) =  1 AND IsCancellation = 0 THEN 50
																																											  	   WHEN FeatureType = 13 AND SIGN(Amount) = -1 AND IsCancellation = 0 THEN 51
																																											  	   WHEN FeatureType = 13 AND SIGN(Amount) =  1 AND IsCancellation = 0 THEN 50
																																												   WHEN FeatureType = 28 AND SIGN(Amount) = -1 AND IsCancellation = 0 AND Currency = 0 THEN 51
																																												   WHEN FeatureType = 28 AND SIGN(Amount) =  1 AND IsCancellation = 0 AND Currency = 0 THEN 50
																																											  ELSE EntrySubType END EntrySubType,		   CardTxType,	 RemitmentType, '-1' IsPhysicalCardTx FROM FACT_Ledger (nolock) where FeatureType IN (8,26,7,2,11,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,32) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
																										UNION all	 																															 												    
																									    Select Id, Currency, Amount, Fee, CreatedAt, UserKey, FeatureType, '99' EntrySubType, '-1'   CardTxType,'-1' RemitmentType, '-1' IsPhysicalCardTx FROM FACT_ExternalLedger	    (nolock) where FeatureType = 24 AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
																										--UNION all																																 
																										--Select Id, Currency, Amount, Fee, CreatedAt, UserKey, FeatureType, '99' EntrySubType,		   CardTxType,	 RemitmentType, '-1' IsPhysicalCardTx FROM FACT_Ledger_Before2020		(nolock) where FeatureType IN (8,26,7,2,11,12,15) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
																										UNION all
																										Select Id, Currency, CASE WHEN FeatureType IN (7,28,32/*INVESTMENT OVERALL-2023-04-27_ADDED*/) THEN ABS(Amount) ELSE Amount END Amount, Fee, CreatedAt, UserKey, FeatureType, CASE WHEN FeatureType = 28 THEN '-28'/*INVESTMENT OVERALL-2023-04-27_ADDED*/ ELSE '99' END EntrySubType, CASE WHEN FeatureType = 2 THEN -2 ELSE NULL END CardTxType, CASE WHEN FeatureType = 7 THEN -7 when FeatureType = 32 then -32/*Streamer Overall Added-2023-06-01*/ ELSE NULL END RemitmentType, '-1' IsPhysicalCardTx FROM FACT_Ledger			 (nolock) where FeatureType IN (2,7,28/*INVESTMENT OVERALL-2023-04-27_ADDED*/,32,33) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
																										--UNION all	
																										--Select Id, Currency, CASE WHEN FeatureType = 7 THEN ABS(Amount) ELSE Amount END Amount, Fee, CreatedAt, UserKey, FeatureType, '99' EntrySubType, CASE WHEN FeatureType = 2 THEN -2 ELSE NULL END CardTxType, CASE WHEN FeatureType = 7 THEN -7 ELSE NULL END RemitmentType, '-1' IsPhysicalCardTx FROM FACT_Ledger_Before2020 (nolock) where FeatureType IN (2,7) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
																									 ) m1																							
																								group by  UserKey
																										 ,FeatureType
																								--		 ,RemitmentType
																										 ,Currency
																										 ,CASE WHEN IsPhysicalCardTx		 IS NULL  THEN -1 ELSE IsPhysicalCardTx		 END
																										 ,CASE WHEN CardTxType IS NULL  THEN -1 ELSE CardTxType  END
																										 ,CASE WHEN RemitmentType IS NULL THEN -1 ELSE RemitmentType END
																										 ,CASE WHEN EntrySubType  IS NULL	  THEN 99 ELSE EntrySubType		 END
																										 --,dateadd(day, 1, eomonth(CreatedAt, -1)) --ilgili tarihteki ayın başı
																										 ,YEAR(CreatedAt)
																										 ,MONTH(CreatedAt)
																										 ,cast(m1.CreatedAt as date)
																					) K
																		inner join DIM_Users u on u.User_Key=K.UserKey
																	) a
													GROUP BY a.YearDate, a.MonthDate
															,a.[Date]
															,a.FeatureType
															,CardTxType
															,RemitmentType
															,Currency
															,EntrySubType
															,IsPhysicalCardTx
		
				) P1
				
				FULL OUTER JOIN 
				(
				/*UU_MTD_Queries_Begin*/
				SELECT
				 -- Max([Date]) [Date]
				  DATEADD(DAY,-@d,@BaseDay) [Date]--!!!!!!! [Date] !!!!!!!
				 ,FeatureType
				 ,Currency
				 ,CardTxType
				 ,IsPhysicalCardTx
				 ,RemitmentType
				 ,EntrySubType
			--	 ,SUM(DistinctTxDayCount)*1.00/COUNT(DISTINCT UserKey)	AvgDistinctTxDayCount_MTD ----MAT YETMEDİ
				 ,MAX(Sira)					UUWithTx_MTD
			--	 ,MAX(CASE WHEN Gender = 1	   THEN Sira_Gender ELSE NULL END)	UUMaleWithTx_MTD
			--	 ,MAX(CASE WHEN Gender = 2	   THEN Sira_Gender ELSE NULL END)	UUFemaleWithTx_MTD
			--	 ,MAX(CASE WHEN Gender IS NULL THEN Sira_Gender ELSE NULL END)	UUUnknownGenderWithTx_MTD
		--,ISNULL(AVG(CASE WHEN				   UserType != 0 AND DateOfBirth  < [Date] THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25) ELSE NULL END) OVER (PARTITION BY FeatureType, Currency, CardTxType, IsPhysicalCardTx, RemitmentType, EntrySubType, MonthKey ORDER BY  [Date]) ,0) AvgAgebyUU_MTD
		--,ISNULL(AVG(CASE WHEN				   UserType != 0 AND CreatedAt    < [Date] THEN DATEDIFF(DAY,CreatedAt,[Date])  /(365.25)	ELSE NULL END) OVER (PARTITION BY FeatureType, Currency, CardTxType, IsPhysicalCardTx, RemitmentType, EntrySubType, MonthKey ORDER BY  [Date]) ,0) AvgLifeTimebyUU_MTD
		--,ISNULL(AVG(CASE WHEN Gender = 2 AND UserType != 0 AND DateOfBirth  < [Date] THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25) ELSE NULL END) OVER (PARTITION BY FeatureType, Currency, CardTxType, IsPhysicalCardTx, RemitmentType, EntrySubType, MonthKey ORDER BY  [Date]) ,0) AvgAgebyFemaleUU_MTD
		--,ISNULL(AVG(CASE WHEN Gender = 2 AND UserType != 0 AND CreatedAt    < [Date] THEN DATEDIFF(DAY,CreatedAt,[Date])  /(365.25)	ELSE NULL END) OVER (PARTITION BY FeatureType, Currency, CardTxType, IsPhysicalCardTx, RemitmentType, EntrySubType, MonthKey ORDER BY  [Date]) ,0) AvgLifeTimebyFemaleUU_MTD
		--,ISNULL(AVG(CASE WHEN Gender = 1 AND UserType != 0 AND DateOfBirth  < [Date] THEN DATEDIFF(DAY,DateOfBirth,[Date])/(365.25) ELSE NULL END) OVER (PARTITION BY FeatureType, Currency, CardTxType, IsPhysicalCardTx, RemitmentType, EntrySubType, MonthKey ORDER BY  [Date]) ,0) AvgAgebyMaleUU_MTD
		--,ISNULL(AVG(CASE WHEN Gender = 1 AND UserType != 0 AND CreatedAt    < [Date] THEN DATEDIFF(DAY,CreatedAt,[Date])  /(365.25) ELSE NULL END) OVER (PARTITION BY FeatureType, Currency, CardTxType, IsPhysicalCardTx, RemitmentType, EntrySubType, MonthKey ORDER BY  [Date]) ,0) AvgLifeTimebyMaleUU_MTD
				 --,AverageTime_MTD
				FROM
				(
					SELECT
						 UserKey
					--	,[Date]--!!!!!!!!!!!!!!
						,DateOfBirth
					--	,Gender
						,UserType
						,u.CreatedAt
					--	,DistinctTxDayCount
						,Currency
						,FeatureType
						,CardTxType
						,RemitmentType
						,EntrySubType
						,IsPhysicalCardTx
						,YearDate
						,MonthDate
						,RANK() OVER (Partition By FeatureType,EntrySubType,CardTxType,RemitmentType,Currency,YearDate,MonthDate,IsPhysicalCardTx			 ORDER BY MinTxDate ASC) Sira
				--		,RANK() OVER (Partition By FeatureType,EntrySubType,CardTxType,RemitmentType,Currency,YearDate,MonthDate,IsPhysicalCardTx, Gender  ORDER BY MinTxDate ASC) Sira_Gender
					FROM						
										(
												SELECT			 UserKey
																--,CAST(MIN(CreatedAt) AS DATE) [Date]--COMMENTE ALINACAK!!!!!!!!!!!!!!
																,FeatureType
																,Currency
																--,COUNT(DISTINCT CreatedAt_DateKey) DistinctTxDayCount
																,CASE WHEN IsPhysicalCardTx		 IS NULL THEN -1 ELSE IsPhysicalCardTx		END IsPhysicalCardTx
																,CASE WHEN CardTxType  IS NULL THEN -1 ELSE CardTxType  END CardTxType
																,CASE WHEN EntrySubType		 IS NULL THEN 99 ELSE EntrySubType		END EntrySubType
																,CASE WHEN RemitmentType IS NULL THEN -1 ELSE RemitmentType END RemitmentType
																,  MIN(CreatedAt) MinTxDate
																, YEAR(CreatedAt) YearDate
																,MONTH(CreatedAt) MonthDate
												FROM (
													  Select Id, Currency, ABS(Amount)/*Mutlak değer aldık.*/ Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey,	FeatureType,'101'   EntrySubType, CardTxType,'101' RemitmentType, CASE WHEN IsPhysicalCardTx IS NULL AND OperatorUserKey IS NOT NULL THEN 2 WHEN IsPhysicalCardTx IS NULL AND OperatorUserKey IS NULL AND IsCancellation = 1 THEN 3 ELSE IsPhysicalCardTx END IsPhysicalCardTx FROM FACT_Ledger	 (nolock) where FeatureType = 2 AND CardTxType = 1 AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
													  UNION all	
													  Select Id, Currency, Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, '101' FeatureType,'101'   EntrySubType,'101'  CardTxType,'101' RemitmentType, '-1' IsPhysicalCardTx  FROM FACT_Ledger	 (nolock) where FeatureType IN (8,26,7,2,11,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,32,33) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
													  UNION all	 																															 
		
													  Select Id, Currency, Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType,		CASE WHEN FeatureType = 19 AND SIGN(Amount) = -1 AND IsCancellation = 0 THEN 51
																																					 WHEN FeatureType = 19 AND SIGN(Amount) =  1 AND IsCancellation = 0 THEN 50
																																					 WHEN FeatureType = 13 AND SIGN(Amount) = -1 AND IsCancellation = 0 THEN 51
																																					 WHEN FeatureType = 13 AND SIGN(Amount) =  1 AND IsCancellation = 0 THEN 50
																																					 WHEN FeatureType = 28 AND SIGN(Amount) = -1 AND IsCancellation = 0 AND Currency = 0 THEN 51
																																					 WHEN FeatureType = 28 AND SIGN(Amount) =  1 AND IsCancellation = 0 AND Currency = 0 THEN 50
																																				ELSE EntrySubType END EntrySubType,		CardTxType,	  RemitmentType, '-1' IsPhysicalCardTx  FROM FACT_Ledger			  (nolock) where FeatureType IN (8,26,7,2,11,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,32) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
													  UNION all	 																															 
													  Select Id, Currency, Amount, Fee, CreatedAt, FORMAT(CreatedAt,'yyyyMMdd') CreatedAt_DateKey, UserKey, FeatureType, '99' EntrySubType, '-1'  CardTxType,'-1' RemitmentType, '-1' IsPhysicalCardTx  FROM FACT_ExternalLedger	  (nolock) where FeatureType = 24 AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
													  UNION all																																 
													  --Select Id, Currency, Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType, '99' EntrySubType,		CardTxType,	  RemitmentType, '-1' IsPhysicalCardTx  FROM FACT_Ledger_Before2020 (nolock) where FeatureType IN (8,26,7,2,11,12,15) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
													  --UNION all	
													  Select Id, Currency, CASE WHEN FeatureType IN (7,28,32/*INVESTMENT OVERALL-2023-04-27_ADDED*/) THEN ABS(Amount) ELSE Amount END Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType, CASE WHEN FeatureType = 28 THEN -28/*INVESTMENT OVERALL-2023-04-27_ADDED*/ ELSE '99' END EntrySubType, CASE WHEN FeatureType = 2 THEN -2 ELSE NULL END CardTxType, CASE WHEN FeatureType = 7 THEN -7 WHEN FeatureType = 32 THEN -32 ELSE NULL END RemitmentType, '-1' IsPhysicalCardTx FROM FACT_Ledger			 (nolock) where FeatureType IN (2,7,28/*INVESTMENT OVERALL-2023-04-27_ADDED*/,32,33) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
													  --UNION all	
													  --Select Id, Currency, CASE WHEN FeatureType = 7 THEN ABS(Amount) ELSE Amount END Amount, Fee, CreatedAt, CreatedAt_DateKey, UserKey, FeatureType, '99' EntrySubType, CASE WHEN FeatureType = 2 THEN -2 ELSE NULL END CardTxType, CASE WHEN FeatureType = 7 THEN -7 ELSE NULL END RemitmentType, '-1' IsPhysicalCardTx FROM FACT_Ledger_Before2020 (nolock) where FeatureType IN (2,7) AND CreatedAt >= dateadd(day, 1, eomonth(getdate(), -@m)) AND CreatedAt < @BaseDay
													  ) K1
												group by UserKey,
														 YEAR(CreatedAt),
														 MONTH(CreatedAt),
														 FeatureType,
														 Currency,
														 CASE WHEN IsPhysicalCardTx		 IS NULL THEN -1 ELSE IsPhysicalCardTx		END,
														 CASE WHEN CardTxType  IS NULL THEN -1 ELSE CardTxType  END,
														 CASE WHEN RemitmentType IS NULL THEN -1 ELSE RemitmentType END,
														 CASE WHEN EntrySubType		 IS NULL THEN 99 ELSE EntrySubType		END
										) K
										inner join DIM_Users u on u.User_Key=K.UserKey
					) ZZ1
					GROUP BY 
					FeatureType,Currency,CardTxType, RemitmentType,EntrySubType, IsPhysicalCardTx,YearDate, MonthDate --,[Date]--!!!!!!!!!!!!!!
					/*UU_MTD_Queries_END*/	
				) P2 ON P1.[Date] = p2.[Date] AND P1.FeatureType = P2.FeatureType AND P1.CardTxType = P2.CardTxType AND P1.RemitmentType = P2.RemitmentType AND P1.Currency = P2.Currency AND P1.EntrySubType = P2.EntrySubType AND P1.IsPhysicalCardTx = P2.IsPhysicalCardTx		  
		) FIN
	)
	INSERT INTO  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
	SELECT * 
--	INTO  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
	FROM RawData with (nolock) WHERE [Date] = @DailySP -->= dateadd(day, 1, eomonth(getdate(), -@m)) AND [Date] < @BaseDay-- ;--DEĞİŞTİRİLDİ --= @DailySP

-----------------------
;
WITH RawData AS
	(
			SELECT 
				DISTINCT D.CreateDate/*@DailySP*/ [Date], IsDirectRevenue, CombinationType, FeatureType, Currency, CardTxType, RemitmentType, EntrySubType, IsPhysicalCardTx 
			FROM (SELECT * FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WITH (NOLOCK) WHERE Date >= dateadd(day, 1, eomonth(@BaseDay, -@m)) AND Date < @BaseDay) x
			CROSS JOIN DIM_Date D WITH (NOLOCK) 
			WHERE D.CreateDate >= dateadd(day, 1, eomonth(@BaseDay, -@m)) AND D.CreateDate < @BaseDay
	), RD2 AS 
	(
			SELECT
				 RJ.[Date]
				,RJ.IsDirectRevenue
				,RJ.CombinationType
				,RJ.FeatureType
				,RJ.Currency
				,RJ.CardTxType
				,RJ.RemitmentType
				,RJ.EntrySubType
				,RJ.IsPhysicalCardTx
				,ISNULL(SK.UnapprovedUUCount	,0) UnapprovedUUCount	
				,ISNULL(SK.ApprovedUUCount 		,0)	ApprovedUUCount 		
				,ISNULL(SK.VerifiedUUCount		,0)	VerifiedUUCount		
				,ISNULL(SK.UnapprovedUUTxCount	,0)	UnapprovedUUTxCount	
				,ISNULL(SK.ApprovedUUTxCount	,0)	ApprovedUUTxCount	
				,ISNULL(SK.VerifiedUUTxCount	,0)	VerifiedUUTxCount	
				,ISNULL(SK.UnapprovedUUTxVolume ,0)	UnapprovedUUTxVolume	
				,ISNULL(SK.ApprovedUUTxVolume	,0)	ApprovedUUTxVolume	
				,ISNULL(SK.VerifiedUUTxVolume	,0)	VerifiedUUTxVolume	
				,ISNULL(SK.UnapprovedUUTxFee	,0)	UnapprovedUUTxFee	
				,ISNULL(SK.ApprovedUUTxFee		,0)	ApprovedUUTxFee		
				,ISNULL(SK.VerifiedUUTxFee		,0)	VerifiedUUTxFee		
				,ISNULL(SK.TotalTxCount			,0)	TotalTxCount			
				,ISNULL(SK.TotalTxVolume		,0)	TotalTxVolume		
				,ISNULL(SK.TotalTxFee			,0)	TotalTxFee			
				,ISNULL(SK.AvgAgebyUU			,0) AvgAgebyUU
				,ISNULL(SK.AvgUserLifeTimebyUU  ,0) AvgUserLifeTimebyUU  
				,ISNULL(SK.UUwithTx				,0)	UUwithTx				
				,ISNULL(SK.UUwithTxLocked		,0)	UUwithTxLocked		
				,ISNULL(SK.UUwithTxOpen			,0)	UUwithTxOpen			
				,SK.UUwithTx_MTD
				,SK.TotalTxVolume_MTD
				,SK.TotalTxFee_MTD
				,SK.TotalTxCount_MTD
				,SK.AvgLifeTimebyTx_MTD
				,ISNULL(SK.UnapprovedUURate           ,0) UnapprovedUURate          
				,ISNULL(SK.ApprovedUURate			  ,0) ApprovedUURate			 
				,ISNULL(SK.VerifiedUURate			  ,0) VerifiedUURate			 
				,ISNULL(SK.UnapprovedUserTxRate		  ,0) UnapprovedUserTxRate		 
				,ISNULL(SK.ApprovedUserTxRate		  ,0) ApprovedUserTxRate		 
				,ISNULL(SK.VerifiedUserTxRate		  ,0) VerifiedUserTxRate		 
				,ISNULL(SK.UnapprovedUserTxVolumeRate ,0) UnapprovedUserTxVolumeRate
				,ISNULL(SK.ApprovedUserTxVolumeRate	  ,0) ApprovedUserTxVolumeRate	 
				,ISNULL(SK.VerifiedUserTxVolumeRate	  ,0) VerifiedUserTxVolumeRate	 
				,ISNULL(SK.UnapprovedUserTxFeeRate	  ,0) UnapprovedUserTxFeeRate	 
				,ISNULL(SK.ApprovedUserTxFeeRate	  ,0) ApprovedUserTxFeeRate	 
				,ISNULL(SK.VerifiedUserTxFeeRate	  ,0) VerifiedUserTxFeeRate	 
	FROM RawData RJ
	LEFT JOIN  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] SK ON SK.[Date] = RJ.[Date] AND SK.IsDirectRevenue = RJ.IsDirectRevenue AND SK.CombinationType = RJ.CombinationType AND SK.FeatureType = RJ.FeatureType AND SK.Currency = RJ.Currency AND SK.CardTxType = RJ.CardTxType AND SK.RemitmentType = RJ.RemitmentType AND SK.EntrySubType = RJ.EntrySubType AND SK.IsPhysicalCardTx = RJ.IsPhysicalCardTx
																	--	AND SK.[Date] = @DailySP
	)
		INSERT INTO  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
		SELECT
			R.*
		FROM RD2 R
		LEFT JOIN (SELECT * FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE [Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) and [Date] < @BaseDay) ETM
		ON 
			R.[Date]			= ETM.[Date]			
		AND R.IsDirectRevenue	= ETM.IsDirectRevenue	
		AND R.CombinationType	= ETM.CombinationType	
		AND R.FeatureType		= ETM.FeatureType			
		AND R.Currency			= ETM.Currency			
		AND R.CardTxType		= ETM.CardTxType	
		AND R.RemitmentType		= ETM.RemitmentType	
		AND R.EntrySubType		= ETM.EntrySubType		
		AND R.IsPhysicalCardTx	= ETM.IsPhysicalCardTx		
		WHERE ETM.IsDirectRevenue	IS NULL
		  AND ETM.CombinationType	IS NULL
		  AND ETM.FeatureType		IS NULL
		  AND ETM.Currency			IS NULL
		  AND ETM.CardTxType  		IS NULL
		  AND ETM.RemitmentType 	IS NULL
		  AND ETM.EntrySubType		IS NULL
		  AND ETM.IsPhysicalCardTx	IS NULL

		--SELECT * FROM RD2		
		--EXCEPT
		--SELECT * FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE [Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) and [Date] < @BaseDay--= @DailySP--

--DELETE A FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] A
--	   JOIN
--			(
--				SELECT CombinationType,IsDirectRevenue, FeatureType, Currency, CardTxType, RemitmentType, EntrySubType, IsPhysicalCardTx, YEAR([Date]) YD,MONTH([Date]) MD FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] GROUP BY CombinationType,IsDirectRevenue, FeatureType, Currency, CardTxType, RemitmentType, EntrySubType, IsPhysicalCardTx, YEAR([Date]), MONTH([Date]) HAVING COUNT(UUWithTx_MTD) = 0
--			) B ON MONTH(A.[Date]) = MD AND YEAR(A.[Date]) = YD AND A.IsDirectRevenue = B.IsDirectRevenue AND A.CombinationType = B.CombinationType AND A.FeatureType = B.FeatureType AND A.Currency = B.Currency AND A.CardTxType = B.CardTxType AND A.RemitmentType = B.RemitmentType AND A.EntrySubType = B.EntrySubType AND A.IsPhysicalCardTx = B.IsPhysicalCardTx

--SELECT * FROM FACT_FeatureTypeMetricAnalysiswithMTD WHERE UUWithTx_MTD IS NULL

	UPDATE  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
		SET UUWithTx_MTD = 0
	FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
	WHERE UUWithTx_MTD is null AND [Date] = dateadd(day, 1, eomonth(getdate(), -@m))

	UPDATE  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
		SET TotalTxVolume_MTD = 0
	FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
	WHERE TotalTxVolume_MTD is null AND [Date] = dateadd(day, 1, eomonth(getdate(), -@m))
	
	UPDATE  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
		SET TotalTxFee_MTD = 0
	FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
	WHERE TotalTxFee_MTD is null AND [Date] = dateadd(day, 1, eomonth(getdate(), -@m))

	UPDATE  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
		SET TotalTxCount_MTD = 0
	FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
	WHERE TotalTxCount_MTD is null AND [Date] = dateadd(day, 1, eomonth(getdate(), -@m))

	UPDATE  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
		SET AvgLifeTimebyTx_MTD = 0
	FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD]
	WHERE AvgLifeTimebyTx_MTD is null AND [Date] = dateadd(day, 1, eomonth(getdate(), -@m))

		WHILE (SELECT COUNT([Date]) FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE UUWithTx_MTD IS NULL AND [Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND [Date] < @BaseDay) != 0
		BEGIN
		UPDATE Z1
		set Z1.UUWithTx_MTD = Z2.UUwithTx_MTD    
		from  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z1
		join  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z2 on dateadd(DAY,1,Z2.[Date]) = Z1.[Date] AND YEAR(dateadd(DAY,1,Z2.[Date])) = YEAR(Z1.[Date]) AND MONTH(dateadd(DAY,1,Z2.[Date])) = MONTH(Z1.[Date]) AND Z1.FeatureType = Z2.FeatureType AND Z1.CardTxType = Z2.CardTxType AND Z1.RemitmentType = Z2.RemitmentType AND Z1.Currency = Z2.Currency AND Z1.EntrySubType = Z2.EntrySubType AND Z1.IsPhysicalCardTx = Z2.IsPhysicalCardTx
		where  Z1.UUWithTx_MTD is null AND Z2.UUWithTx_MTD IS NOT NULL and z1.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z1.[Date] < @BaseDay and z2.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z2.[Date] < @BaseDay
		end

		WHILE (SELECT COUNT([Date]) FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE TotalTxVolume_MTD IS NULL AND [Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND [Date] < @BaseDay) != 0
		BEGIN
		UPDATE Z1
		set Z1.TotalTxVolume_MTD = Z2.TotalTxVolume_MTD    
		from  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z1
		join  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z2 on dateadd(DAY,1,Z2.[Date]) = Z1.[Date] AND YEAR(dateadd(DAY,1,Z2.[Date])) = YEAR(Z1.[Date]) AND MONTH(dateadd(DAY,1,Z2.[Date])) = MONTH(Z1.[Date]) AND Z1.FeatureType = Z2.FeatureType AND Z1.CardTxType = Z2.CardTxType AND Z1.RemitmentType = Z2.RemitmentType AND Z1.Currency = Z2.Currency AND Z1.EntrySubType = Z2.EntrySubType AND Z1.IsPhysicalCardTx = Z2.IsPhysicalCardTx
		where  Z1.TotalTxVolume_MTD is null AND Z2.TotalTxVolume_MTD IS NOT NULL and z1.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z1.[Date] < @BaseDay and z2.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z2.[Date] < @BaseDay
		end

		WHILE (SELECT COUNT([Date]) FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE TotalTxFee_MTD IS NULL AND [Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND [Date] < @BaseDay) != 0
		BEGIN
		UPDATE Z1
		set Z1.TotalTxFee_MTD = Z2.TotalTxFee_MTD    
		from  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z1
		join  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z2 on dateadd(DAY,1,Z2.[Date]) = Z1.[Date] AND YEAR(dateadd(DAY,1,Z2.[Date])) = YEAR(Z1.[Date]) AND MONTH(dateadd(DAY,1,Z2.[Date])) = MONTH(Z1.[Date]) AND Z1.FeatureType = Z2.FeatureType AND Z1.CardTxType = Z2.CardTxType AND Z1.RemitmentType = Z2.RemitmentType AND Z1.Currency = Z2.Currency AND Z1.EntrySubType = Z2.EntrySubType AND Z1.IsPhysicalCardTx = Z2.IsPhysicalCardTx
		where  Z1.TotalTxFee_MTD is null AND Z2.TotalTxFee_MTD IS NOT NULL and z1.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z1.[Date] < @BaseDay and z2.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z2.[Date] < @BaseDay
		end

		WHILE (SELECT COUNT([Date]) FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE TotalTxCount_MTD IS NULL AND [Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND [Date] < @BaseDay) != 0
		BEGIN
		UPDATE Z1
		set Z1.TotalTxCount_MTD = Z2.TotalTxCount_MTD    
		from  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z1
		join  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z2 on dateadd(DAY,1,Z2.[Date]) = Z1.[Date] AND YEAR(dateadd(DAY,1,Z2.[Date])) = YEAR(Z1.[Date]) AND MONTH(dateadd(DAY,1,Z2.[Date])) = MONTH(Z1.[Date]) AND Z1.FeatureType = Z2.FeatureType AND Z1.CardTxType = Z2.CardTxType AND Z1.RemitmentType = Z2.RemitmentType AND Z1.Currency = Z2.Currency AND Z1.EntrySubType = Z2.EntrySubType AND Z1.IsPhysicalCardTx = Z2.IsPhysicalCardTx
		where  Z1.TotalTxCount_MTD is null AND Z2.TotalTxCount_MTD IS NOT NULL and z1.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z1.[Date] < @BaseDay and z2.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z2.[Date] < @BaseDay
		end

		WHILE (SELECT COUNT([Date]) FROM  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] WHERE AvgLifeTimebyTx_MTD IS NULL AND [Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND [Date] < @BaseDay) != 0
		BEGIN
		UPDATE Z1
		set Z1.AvgLifeTimebyTx_MTD = Z2.AvgLifeTimebyTx_MTD    
		from  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z1
		join  [DWH_Database].[dbo].[FACT_FeatureTypeMetricAnalysiswithMTD] Z2 on dateadd(DAY,1,Z2.[Date]) = Z1.[Date] AND YEAR(dateadd(DAY,1,Z2.[Date])) = YEAR(Z1.[Date]) AND MONTH(dateadd(DAY,1,Z2.[Date])) = MONTH(Z1.[Date]) AND Z1.FeatureType = Z2.FeatureType AND Z1.CardTxType = Z2.CardTxType AND Z1.RemitmentType = Z2.RemitmentType AND Z1.Currency = Z2.Currency AND Z1.EntrySubType = Z2.EntrySubType AND Z1.IsPhysicalCardTx = Z2.IsPhysicalCardTx
		where  Z1.AvgLifeTimebyTx_MTD is null AND Z2.AvgLifeTimebyTx_MTD IS NOT NULL and z1.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z1.[Date] < @BaseDay and z2.[Date] >= dateadd(day, 1, eomonth(getdate(), -@m)) AND Z2.[Date] < @BaseDay
		end