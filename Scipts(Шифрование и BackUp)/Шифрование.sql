/*������(Login) ������� �������� � ��������� MD5*/
UPDATE ClientProgram
SET Login = CONVERT(varchar(64),
HASHBYTES('MD5',Login),2)

/*������(Password) ������� �������� � ��������� MD5*/
UPDATE ClientProgram
SET Password = CONVERT(varchar(64),
HASHBYTES('MD5',Password),2)

/*����� ������������� �������*/
SELECT * FROM ClientProgram

