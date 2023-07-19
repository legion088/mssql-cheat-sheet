DEALLOCATE event_cursor;
DEALLOCATE stipend;

DECLARE @event_id INT
DECLARE event_cursor CURSOR FOR
SELECT COUNT(students_id) FROM events
OPEN event_cursor
FETCH NEXT FROM event_cursor INTO @event_id
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT 'Количество записей в таблице events: ' + CAST(@event_id as varchar(10))
FETCH NEXT FROM event_cursor INTO @event_id
END
CLOSE event_cursor;


DECLARE @amount INT
DECLARE stipend CURSOR FOR
SELECT MAX(amount) FROM stipend
OPEN stipend
FETCH NEXT FROM stipend INTO @amount
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT 'Максимальный размер стипендии ' + CAST(@amount as varchar(10))
FETCH NEXT FROM stipend INTO @amount
END
CLOSE stipend
