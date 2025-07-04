@echo off
echo.

set "method=%1"

call :combination_text_loop %*

if "%method%"=="-hello" (
    @REM call :hello %1 %2 %3 %4 %5 %6 %7 %8 %9
    call :hello %args%
    @REM goto :eof
    exit /b
) else (
    if "%method%"=="-hay" (
        call :hay %args%
        @REM goto :eof
        exit /b
    ) else (
        if "%method%"=="--help" (
            call :help
            @REM goto :eof
            exit /b
        ) else (
            call :error
            @REM goto :eof
            exit /b
        )
    )
)

::---------------------------------------
:error
echo Try 'hello --help' for more information.
goto :eof

:help
echo Usage [Option]...[args]...
echo -hello : Say hello to whomever you want .
echo -hay : Say hay to whomever you want . 
echo --help : Show this help message and exit .
goto :eof

:hello
echo Hello, world,
echo Hello, %*.
goto :eof

:hay
echo Hay, world,
echo Hay, %*.
goto :eof

:combination_text_loop
set "args="
:loop
if "%2"=="" goto break_loop
set args=%args% %2
shift
goto loop
:break_loop
goto :eof