/*BackUp базы данных*/
BACKUP DATABASE CopsBase
	TO DISK = 'CopsBase.bak'

/*Восстановление файла базы данных CopsBase*/
RESTORE DATABASE CopsBase
	FROM DISK = 'CopsBase.bak'
	WITH FILE = 1