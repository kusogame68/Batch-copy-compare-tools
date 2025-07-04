@echo off
set "pth1=%~1"
set "pth2=%~2"
if "%pth1%"=="" goto end
if "%pth2%"=="" goto end
echo.

if exist *_relative_path_list.txt del /f /q *_relative_path_list.txt
echo === Copy Start ===
call :copy_pattern
echo === Compare Start ===
call :compare_pattern
pause
if exist *_relative_path_list.txt del /f /q *_relative_path_list.txt
exit /b

::--- Function ---
:copy_pattern
xcopy "%pth1%" "%pth2%" /E /I /Y /Q /H /K /O /X
echo === Copy Complete ===
goto :eof

:compare_pattern
setlocal enabledelayedexpansion
set "root1=%pth1%"
set "root2=%pth2%"

@REM for /f "usebackq delims=" %%f in ("a_full_path_list.txt") do (
for /f "usebackq delims=" %%f in (`dir /b /s "%pth1%"`) do (
    set "full_path=%%f"
    set "rel=!full_path:%root1%\=!"
    echo !rel!>> a_relative_path_list.txt
)
@REM for /f "usebackq delims=" %%f in ("b_full_path_list.txt") do (
for /f "usebackq delims=" %%f in (`dir /b /s "%pth2%"`) do (
    set "full_path=%%f"
    set "rel=!full_path:%root2%\=!"
    echo !rel!>> b_relative_path_list.txt
)

echo --- Compare Structure , Path , File-name ---
fc a_relative_path_list.txt b_relative_path_list.txt > nul
if errorlevel 1 ( echo FAIL. & goto end_compare ) else ( echo PASS. )
echo --- Compare Complete ---

echo --- Compare File-Content ---
for /f "usebackq delims=" %%f in ("a_relative_path_list.txt") do (
    set "rel=%%f"

    set "file1=!root1!\!rel!"
    set "file2=!root2!\!rel!"
    if exist "!file1!" (
        if not exist "!file1!\*" (
            fc /b "!file1!" "!file2!" > nul
            if errorlevel 1 (
                echo FAIL : "%%f"
                goto :end_compare
            ) else (
                echo PASS.
            )
        ) else (
            echo Skipped directory : "%%f"
        )
        
    )
)
echo --- Compare Complete ---
endlocal
goto :eof

:end_compare
endlocal
echo --- Compare Complete ---
goto :eof

:end
echo Invalid Parameter.
echo [ NOTE ] : pattern "Source" "Destination"
exit /b