rem ** Detect OS and Backup the Image ** 
rem ** Mo_Razif **

@echo off
cls 

for /f "tokens=2 delims==" %%I in ('wmic os get caption /format:list') do set "OS=%%I"
set "Line1=** Windows: %OS% **" 

for /f "tokens=2 delims==" %%I in ('wmic os get osarchitecture /format:list') do set "TYPE=%%I"
set "Line2=** Type: %TYPE% **" 

for /f "tokens=2 delims==" %%I in ('wmic os get buildnumber /format:list') do set "Build=%%I"
set "Line3=** Build: %Build% **" 

FOR /f "tokens=3 delims= " %%I in ('reg query "hklm\system\controlset001\control\nls\language" /v Installlanguage') do set "Languange=%%I"
set "Line4=** Languange: %Languange% **" 

IF "%Languange%" == "0409" (set Lang=English)
IF "%Languange%" == "0809" (set Lang=English)
IF "%Languange%" == "0804" (set Lang=Chinese)
IF "%Languange%" == "0407" (set Lang=German)
IF "%Languange%" == "040C" (set Lang=France)
IF "%Languange%" == "040D" (set Lang=Hebrew)
IF "%Languange%" == "0411" (set Lang=Japan)
IF "%Languange%" == "0412" (set Lang=Korean)

echo %Line1%
echo %Line2%
echo %Line3%
echo ** Languange: %Lang% **
 
Rem ----------------------
call :Macrium
Rem -----------------------

:Operate
IF "%OS%" == "Microsoft Windows 11 Pro" (ECHO %OS%) 
IF "%OS%" == "Microsoft Windows 11 Enterprise" (ECHO %OS%) 
IF "%OS%" == "Microsoft Windows 10 Pro" (ECHO %OS%) 
IF "%OS%" == "??Microsoft Windows 10 Pro" (ECHO %OS% Hebrew)
IF "%OS%" == "Microsoft Windows 10 Enterprise" (ECHO %OS%) 
IF "%OS%" == "Microsoft Windows 7 Ultimate" (ECHO %OS%)

EXIT /B 0

:Bit
IF "%TYPE%" == "64-bit" (ECHO %TYPE%) 
IF "%TYPE%" == "32-bit" (ECHO %TYPE%) 
EXIT /B 0

:Macrium
rem Win11_Eng_Ent_64
IF "%Languange%" == "0809" (
	IF "%OS%" == "Microsoft Windows 11 Enterprise" (
		IF "%TYPE%" == "64-bit" (
			(echo Macrium - %OS% %Lang% %TYPE% )
			(cd C:\Program Files\Macrium\Reflect)
			(reflect.exe -e -w "\\192.168.1.15\Validation\Users\M_Razif\Backup_Definition\Win11_x64_Eng_Ent_2022.xml")
		)
	)	
)

rem Win11_Eng_Pro_64
IF "%Languange%" == "0409" (
	IF "%OS%" == "Microsoft Windows 11 Pro" (
		IF "%TYPE%" == "64-bit" (
			(echo Macrium - %OS% %Lang% %TYPE% )
			(cd C:\Program Files\Macrium\Reflect)
			(reflect.exe -e -w "\\192.168.1.15\Validation\Users\M_Razif\Backup_Definition\Win11_x64_Eng_Pro_2022.xml")
		)
	)	
)

rem Win10_Eng_Pro_64
IF "%Languange%" == "0409" (
	IF "%OS%" == "Microsoft Windows 10 Pro" (
		IF "%TYPE%" == "64-bit" (
			(echo Macrium - %OS% %Lang% %TYPE% )
			(cd C:\Program Files\Macrium\Reflect)
			(reflect.exe -e -w "\\192.168.1.15\Validation\Users\M_Razif\Backup_Definition\win10_x64_eng_2019.xml")
		)
	)	
)

rem Win10_Eng_Ent_64
IF "%Languange%" == "0809" (
	IF "%OS%" == "Microsoft Windows 10 Enterprise" (
		IF "%TYPE%" == "64-bit" (
			(echo Macrium - %OS% %Lang% %TYPE% )
			(cd C:\Program Files\Macrium\Reflect)
			(reflect.exe -e -w "\\192.168.1.15\Validation\Users\M_Razif\Backup_Definition\win10_x64_eng_2019.xml")
		)
	)	
)

rem Win10_Japan_64
IF "%Languange%" == "0411" (
	IF "%OS%" == "Microsoft Windows 10 Enterprise" (
		IF "%TYPE%" == "64 ƒrƒbƒg" (
			(echo Macrium %OS% %Lang% %TYPE% )
		)
	)	
)	

rem Win10_Korean_64
IF "%Languange%" == "0412" (
	IF "%OS%" == "Microsoft Windows 10 Enterprise" (
		IF "%TYPE%" == "64ºñÆ®" (
			(echo Macrium %OS% %Lang% %TYPE% )
		)
	)	
)

rem Win8.1_Chinese_64
IF "%Languange%" == "0804" (
	IF "%OS%" == "Microsoft Windows 8.1 ×¨Òµ°æ" (
		IF "%TYPE%" == "64 Î»" (
			(echo Macrium %OS% %Lang% %TYPE% )
		)
	)	
)

	
pause
