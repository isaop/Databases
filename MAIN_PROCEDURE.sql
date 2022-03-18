use Botanical_Garden
go

CREATE PROCEDURE MAIN(@version int)
as
	IF @version >4
	begin 
		print 'This version does not exist'
		DECLARE @currentVersion int
		SELECT @currentVersion = @currentVersion from Version
		print 'Current version of your table is'
		print @currentVersion
		WHILE @currentVersion < @version BEGIN
			IF @version = 0 begin
				exec do_proc_1
			end
			IF @version = 1 begin
				exec do_proc_2
			end
			IF @version = 2 begin
				exec do_proc_3
			end
			IF @version = 3 begin
				exec do_proc_4
			end
			SET @currentVersion = @currentVersion + 1 
		end

		WHILE @currentVersion > @version BEGIN
			IF @version = 1 begin
				exec undo_proc_1
			end
			IF @version = 2 begin
				exec undo_proc_2
			end
			IF @version = 3 begin
				exec undo_proc_3
			end
			IF @version = 4 begin
				exec undo_proc_4
			end
			SET @currentVersion = @currentVersion - 1 
		end
		IF @currentVersion = @version begin 
			PRINT 'This is the right version' 
		end
	end
go

exec MAIN 1

		