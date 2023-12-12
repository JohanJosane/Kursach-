/*Данные(Login) таблицы кодируем в кодировку MD5*/
UPDATE ClientProgram
SET Login = CONVERT(varchar(64),
HASHBYTES('MD5',Login),2)

/*Данные(Password) таблицы кодируем в кодировку MD5*/
UPDATE ClientProgram
SET Password = CONVERT(varchar(64),
HASHBYTES('MD5',Password),2)

/*Вывод зашифрованной таблицы*/
SELECT * FROM ClientProgram

