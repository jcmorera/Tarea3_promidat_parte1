@rem usersplits.bat:

@"C:\PROGRA~1\R\R-3.5.3\bin\x64\R.exe" CMD BATCH --quiet --vanilla usersplits*.R
@if %errorlevel% equ 0 goto good1:
@echo R returned errorlevel %errorlevel%, see usersplits.Rout:
@echo.
@tail usersplits.Rout
@echo usersplits.R
@exit /B 1
:good1
diff usersplits.Rout usersplits.Rout.save
@if %errorlevel% equ 0 goto good2:
@echo === Files are different ===
@diffps -s Rplots.ps ..\..\.#\test-reference\usersplits.save.ps
@exit /B 1
:good2
@rem usersplits.save.ps is too big to be included in the release
@rem so it is stored elsewhere
diffps Rplots.ps ..\..\.#\test-reference\usersplits.save.ps
@if %errorlevel% equ 0 goto good3:
@echo === Files are different ===
@exit /B 1
:good3
@rm -f usersplits.Rout
@rm -f Rplots.ps
@exit /B 0
