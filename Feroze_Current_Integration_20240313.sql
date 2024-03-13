

CREATE TABLE [dbo].[VWeightData](
[ID] [int] IDENTITY(1,1) NOT NULL,
[Type] [varchar](10) NULL,
[RollNo] [varchar](20) NULL,
[WeighmentDate] [smalldatetime] NULL,
[LotNo] [varchar](26) NULL,
[QualityCode] [varchar](25) NULL,
[PatternCode] [varchar](30) NULL,
[FabricCode] [varchar](20) NULL,
[TFamilyCode] [varchar](30) NULL,
[OColorCode] [varchar](6) NULL,
[NetWeight] [numeric](9, 2) NULL,
[ShiftCode] [char](20) NULL,
CONSTRAINT [PK_VWeightData] PRIMARY KEY CLUSTERED (ID)
) 
GO




CREATE PROCEDURE [dbo].[IntegrateWeightData]
AS
BEGIN

    SET NOCOUNT ON;


    select (QualityCode+LotNo) as  SaleOrderCode,* into #SO from dbo.VWeightData

    -- Insert data into SaleOrder table
    INSERT INTO Essentials.SaleOrder (SaleOrderCode,Customer,OrderQuantity)
    SELECT  distinct SaleOrderCode,'CS',0
    FROM #SO w
    where w.SaleOrderCode not in 
    (select SaleOrderCode from Essentials.SaleOrder s) and w.SaleOrderCode is not null;

    -- Insert data into ProductionOrder table
    INSERT INTO Essentials.ProductionOrder (ProductionOrderCode, SaleOrderID)
    SELECT distinct ss.SaleOrderCode,s.SaleOrderID from Essentials.SaleOrder s
    join #SO ss on ss.SaleOrderCode=s.SaleOrderCode
    where ss.SaleOrderCode not in 
    (select ProductionOrderCode from Essentials.ProductionOrder)



    -- Insert data into ProductionOrderClient table
    INSERT INTO Essentials.ProductionOrderClient (ProductionOrderID, Color, Size)
    SELECT distinct s.ProductionOrderID,ss.OColorCode,'Size'
    From Essentials.ProductionOrder s
    join #SO ss on ss.SaleOrderCode=s.ProductionOrderCode
    where s.ProductionOrderID not in 
    (select ProductionOrderID From Essentials.ProductionOrderClient o)




    -- Insert data into CutJob table
    INSERT INTO Essentials.CutJob (CutNo, ProductionOrderID, Plies, WeighmentDate, SaleOrderCode, FabricCode, TFamilyCode, OColorCode, NetWeight, ShiftCode)
    SELECT DISTINCT wd.RollNo, po.ProductionOrderID, CAST(ROUND(RAND() * 4, 0) + 1 AS INT), wd.WeighmentDate, wd.SaleOrderCode, wd.FabricCode, wd.TFamilyCode, wd.OColorCode, wd.NetWeight, wd.ShiftCode
    FROM #SO wd
    JOIN Essentials.ProductionOrder po ON wd.SaleOrderCode = po.ProductionOrderCode
    where  not exists
    (select 1 from Essentials.CutJob c where c.SaleOrderCode=wd.SaleOrderCode and wd.RollNo=c.CutNo )



    Drop table #SO
END
GO


-- =======================================================================================================================================================================================
-- =======================================================================================================================================================================================


-- Jobs

USE [msdb]
GO

/****** Object:  Job [Feroze Integration]    Script Date: 3/13/2024 3:14:14 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 3/13/2024 3:14:14 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Feroze Integration', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Database Integration]    Script Date: 3/13/2024 3:14:14 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Database Integration', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [dbo].[IntegrateWeightData]', 
		@database_name=N'SooperWizer', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20230404, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'1dc9b45b-3d2a-4703-8896-5bf12c937bef'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [Full Backup Job]    Script Date: 3/13/2024 3:14:15 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 3/13/2024 3:14:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Full Backup Job', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Call Proc [dbo].[uspFullBackup]]    Script Date: 3/13/2024 3:14:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Call Proc [dbo].[uspFullBackup]', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @RC int
EXECUTE @RC = [dbo].[uspFullBackup] 
GO
', 
		@database_name=N'SooperWizer', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=12, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20230703, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'c8605c70-63f0-4479-b541-ae7db9d8063b'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [worker efficiency job]    Script Date: 3/13/2024 3:14:15 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 3/13/2024 3:14:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'worker efficiency job', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [insert data]    Script Date: 3/13/2024 3:14:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'insert data', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'

  INSERT INTO REPORT.vwWrokerEfficiencyReportNotTodayTBL
  SELECT * FROM report.vwWrokerEfficiencyReportToday
', 
		@database_name=N'SooperWizer', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20230309, 
		@active_end_date=99991231, 
		@active_start_time=400, 
		@active_end_time=235959, 
		@schedule_uid=N'5c8459fd-b1e8-416f-bc55-0d166077445e'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO



