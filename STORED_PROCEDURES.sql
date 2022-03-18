use Botanical_Garden
CREATE or alter PROCEDURE do_proc_1
AS
 
     ALTER TABLE Clients
     ADD phone_number varchar(100)
	 print 'Table added successfully!'

go 

CREATE OR ALTER PROCEDURE do_proc_2
AS
 
        ALTER TABLE Vouchers
		ADD CONSTRAINT constr_sum 
	    DEFAULT 100 FOR summ;
		print 'Sum will always be 100!'

go 

CREATE OR ALTER PROCEDURE do_proc_3
AS
 
        ALTER TABLE Vouchers
		ADD CONSTRAINT fk_Vouchers_Clients FOREIGN KEY (id_client) REFERENCES Clients(id)
		print 'Foreign key constraint added!'

go 
 
CREATE OR ALTER PROCEDURE do_proc_4
AS
		CREATE TABLE Eventss(
		id INT PRIMARY KEY IDENTITY,
		name VARCHAR(50))
		print 'Table Events created!'

go 

CREATE OR ALTER PROCEDURE undo_proc_1
AS
        ALTER TABLE Clients
		DROP COLUMN phone_number
		print 'Column phone_number dropped'
go

CREATE OR ALTER PROCEDURE undo_proc_2
AS 
        ALTER TABLE Vouchers
		DROP CONSTRAINT constr_sum
		print 'Sum constraint dropped!'
go 

CREATE OR ALTER PROCEDURE undo_proc_3
AS 
        ALTER TABLE Vouchers
		DROP CONSTRAINT fk_Vouchers_Clients
		print 'Foreign key constraint dropped!' 
go 

CREATE OR ALTER PROCEDURE undo_proc_4
AS
		DROP TABLE Eventss
		print 'Table Events dropped'
go 

CREATE TABLE Version
		(currentVersion int)

INSERT INTO Version VALUES(0)

select * from Version


CREATE OR ALTER PROCEDURE MAIN(@version int)
as
	IF @version > 4 
	begin 
		print 'This version does not exist'
	end 
	else
		if @version <0
		begin 
			print 'This version does not exist'
		end
		else
		begin
			DECLARE @currentVersion int
			SELECT @currentVersion = currentVersion from Version
			print 'Current version of your table is: '
			print @currentVersion
			WHILE @currentVersion < @version BEGIN
				IF @currentVersion = 0 begin
					print'do1'
					exec do_proc_1

				end
				IF @currentVersion = 1 begin
					print'do2'
					exec do_proc_2
				end
				IF @currentVersion = 2 begin
					print'do3'
					exec do_proc_3
				end
				IF @currentVersion = 3 begin
					print 'do4'
					exec do_proc_4
				end
				SET @currentVersion = @currentVersion + 1 
			END

			WHILE @currentVersion > @version BEGIN
				IF @currentVersion = 1 begin
					print'undo1'
					exec undo_proc_1
				end
				IF @currentVersion = 2 begin
					print'undo2'
					exec undo_proc_2
				end
				IF @currentVersion = 3 begin
					print'undo3'
					exec undo_proc_3
				end
				IF @currentVersion = 4 begin
					print'undo4'
					exec undo_proc_4
				end
				SET @currentVersion = @currentVersion - 1 
			end
			IF @currentVersion = @version begin 
				PRINT 'This is the right version' 
			end
			update Version set currentVersion = @currentVersion
		end
		
go

exec MAIN 0
exec MAIN 1

exec MAIN 2
exec MAIN 3
exec MAIN 4


exec undo_proc_1
exec undo_proc_2
exec undo_proc_3
exec undo_proc_4

select * from Version