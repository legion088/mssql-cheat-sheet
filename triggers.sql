---add table students_logs
CREATE TABLE [dbo].[students_logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[events] [nchar](150) NOT NULL,
	[events_date] [date] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[students_logs] 
ADD  CONSTRAINT [DF_students_logs_events_date]  
DEFAULT (getdate()) FOR [events_date]
GO

---Триггер добавления
CREATE TRIGGER insert_students
ON students
AFTER INSERT
AS
INSERT INTO students_logs (events)
SELECT 'Добавлен студент ' + CAST(students_id as nvarchar)
FROM INSERTED

---Триггер обновления
CREATE TRIGGER insert_students
ON students
AFTER INSERT
AS
INSERT INTO students_logs (events)
SELECT 'Обновлён студент ' + CAST(students_id as nvarchar)
FROM INSERTED

---Триггер удаления
CREATE TRIGGER delete_students
ON students
AFTER DELETE
AS
INSERT INTO students_logs (events)
SELECT 'Удалён студент ' + CAST(students_id as nvarchar)
FROM DELETED