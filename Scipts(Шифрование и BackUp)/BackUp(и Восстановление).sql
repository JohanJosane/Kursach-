/*BackUp ���� ������*/
BACKUP DATABASE CopsBase
	TO DISK = 'CopsBase.bak'

/*�������������� ����� ���� ������ CopsBase*/
RESTORE DATABASE CopsBase
	FROM DISK = 'CopsBase.bak'
	WITH FILE = 1