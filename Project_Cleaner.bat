@echo off

set "start_dir=%~dp0"
set "TARGET_FOLDERS=.vs Binaries DerivedDataCache Intermediate Saved"

echo Deleting specified folders...
:: Delete folders: .vs, Binaries, DerivedDataCache, Intermediate, Saved
for /d /r "%start_dir%" %%d in (%TARGET_FOLDERS%) do (
    if exist "%%d" (
        echo Deleting folder %%d
        rmdir /s /q "%%d"
    )
)

echo Deleting specified files...
:: Delete files: ProjectName.sln
for /r "%start_dir%" %%f in (*.sln) do (
    if exist "%%f" (
        echo Deleting file %%f
        del /f /q "%%f"
    )
)

echo Cleanup complete!
pause