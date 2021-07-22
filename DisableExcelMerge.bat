@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: Vectra LLC
REM  Productname: Disable_Excel_Merge
REM  Filedescription: 
REM  Copyrights: Vectra LLC@2020
REM  Trademarks: 
REM  Originalname: 
REM  Comments: 
REM  Productversion: 02.00.00.00
REM  Fileversion: 02.00.00.00
REM  Internalname: Disable_Excel_Merge
REM  Appicon: 
REM  AdministratorManifest: No
REM  QBFC Project Options End
@ECHO ON

@echo OFF
FOR /F "tokens=3" %%A in ('REG QUERY "HKCR\Excel.Application\CurVer" /ve') DO SET Version=%%A
echo %Version%
if "%Version%" == "Excel.Application.16" (
    REM echo "Found Excel 2016 or Above"
	REM reg query "HKCU\Software\Microsoft\Office\16.0\Excel\Options" /v "DisableMergeInstance" /t REG_DWORD>nul
	REM echo %errorlevel%
	REM if %errorlevel% equ 0 (
		REM echo "DisableMergeInstance Registry key Exist - DO NOTHING"
	REM ) else (
		REM echo "DisableMergeInstance does not Exist - ADDING IT"
		reg add "HKCU\Software\Microsoft\Office\16.0\Excel\Options" /v "DisableMergeInstance" /t REG_DWORD /d 1 /f
	REM )
) else if "%Version%" == "Excel.Application.15" (
    REM echo "Found Excel 2013"
	REM reg query "HKCU\Software\Microsoft\Office\15.0\Excel\Options" /v "DisableMergeInstance" /t REG_DWORD >nul
	REM echo %errorlevel%
	REM if %errorlevel% equ 0 (
		REM echo "DisableMergeInstance Registry key Exist - DO NOTHING"
	REM ) else (
		REM echo "DisableMergeInstance does not Exist - ADDING IT"
		reg add HKCU\Software\Microsoft\Office\15.0\Excel\Options /v DisableMergeInstance /t REG_DWORD /d 1 /f
    REM )
)
