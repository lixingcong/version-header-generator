@echo off
setlocal
rem use findstr to strip blank lines from wmic output
for /f "usebackq skip=1 tokens=1-6" %%g in (`wmic Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year ^| findstr /r /v "^$"`) do (
  set _day=00%%g
  set _hours=00%%h
  set _minutes=00%%i
  set _month=00%%j
  set _seconds=00%%k
  set _year=%%l
  )
rem pad with leading zeros
set _month=%_month:~-2%
set _day=%_day:~-2%
set _hh=%_hours:~-2%
set _mm=%_minutes:~-2%
set _ss=%_seconds:~-2%
set _date=%_year%-%_month%-%_day%_%_hh%:%_mm%
echo %_date%
endlocal
