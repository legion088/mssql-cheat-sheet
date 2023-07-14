---Вставка в цикле
DECLARE @i INT = 1

WHILE @i <= 1000000
BEGIN
  INSERT INTO transactions(Record)
  VALUES ('Текстовая запись ' + CAST(@i AS NVARCHAR(20)))

  SET @i = @i + 1
END

--- Обновление в цикле
DECLARE @i INT = 1

WHILE @i <= 10000 
BEGIN
	UPDATE transactions
	SET Record = REPLACE(Record, 'Текстовая запись ' 	+ CAST(@i AS NVARCHAR(20)), 
	                             'Замена текстовой записи ' + CAST(@i AS NVARCHAR(20)))
	WHERE Record = 'Текстовая запись ' 	+ CAST(@i AS NVARCHAR(20)) 
	SET @i = @i + 1
END
