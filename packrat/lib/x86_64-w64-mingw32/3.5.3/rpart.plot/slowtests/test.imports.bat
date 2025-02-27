@rem test.imports.bat:

@"C:\PROGRA~1\R\R-3.5.3\bin\x64\R.exe" CMD BATCH --quiet --vanilla test.imports.R
@if %errorlevel% equ 0 goto good1:
@echo R returned errorlevel %errorlevel%, see test.imports.Rout:
@echo.
@tail test.imports.Rout
@echo test.imports.R
@exit /B 1
:good1
diff test.imports.Rout test.imports.Rout.save
@if %errorlevel% equ 0 goto good2:
@echo === Files are different ===
@diffps -s Rplots.ps ..\..\.#\test-reference\test.imports.save.ps
@exit /B 1
:good2
@rem test.imports.save.ps is too big to be included in the release
@rem so it is stored elsewhere
diffps Rplots.ps ..\..\.#\test-reference\test.imports.save.ps
@if %errorlevel% equ 0 goto good3:
@echo === Files are different ===
@exit /B 1
:good3
@rm -f test.imports.Rout
@rm -f Rplots.ps
@exit /B 0
