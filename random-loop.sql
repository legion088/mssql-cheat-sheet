---������� � �����
DECLARE @i INT = 1

WHILE @i <= 1000000
BEGIN
  INSERT INTO transactions(Record)
  VALUES ('��������� ������ ' + CAST(@i AS NVARCHAR(20)))

  SET @i = @i + 1
END

--- ���������� � �����
DECLARE @i INT = 1

WHILE @i <= 10000 
BEGIN
	UPDATE transactions
	SET Record = REPLACE(Record, '��������� ������ ' 	+ CAST(@i AS NVARCHAR(20)), 
	                             '������ ��������� ������ ' + CAST(@i AS NVARCHAR(20)))
	WHERE Record = '��������� ������ ' 	+ CAST(@i AS NVARCHAR(20)) 
	SET @i = @i + 1
END
