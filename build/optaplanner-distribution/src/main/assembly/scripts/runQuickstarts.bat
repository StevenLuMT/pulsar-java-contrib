@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM

@ECHO OFF
setLocal enableExtensions enableDelayedExpansion

set "jvmOptions=-Xms128m -Xmx512m -Dstartup-open-browser=true"
set "mainJar=quickstarts\binaries\quarkus-app\quarkus-run.jar"

echo Usage: runQuickstarts.bat
echo Notes:
echo - Java 11 or higher must be installed. Get the latest OpenJDK from ^(https://adoptium.net/^).
echo - For JDK, the environment variable JAVA_HOME should be set to the JDK installation directory
echo   For example: set "JAVA_HOME=C:\Program Files\Java\jdk-11"
echo.

if exist "%JAVA_HOME%\bin\java.exe" (
    echo Starting quickstarts app with JDK from environment variable JAVA_HOME ^(%JAVA_HOME%^)...
    rem JDK supports -server mode
    "%JAVA_HOME%\bin\java" !jvmOptions! -jar !mainJar!
    goto endProcess
) else (
    rem Find JRE home in Windows Registry
    set "jreRegKey=HKLM\SOFTWARE\JavaSoft\Java Runtime Environment"
    set "jreVersion="
    for /f "tokens=3" %%v in ('reg query "!jreRegKey!" /v "CurrentVersion" 2^>nul') do set "jreVersion=%%v"
    if not defined jreVersion (
        set "jreRegKey=HKLM\SOFTWARE\Wow6432Node\JavaSoft\Java Runtime Environment"
        for /f "tokens=3" %%v in ('reg query "!jreRegKey!" /v "CurrentVersion" 2^>nul') do set "jreVersion=%%v"
        if not defined jreVersion (
            echo ERROR: The JRE is not installed on this system.
            goto failure
        )
    )
    set "jreHome="
    for /f "tokens=2,*" %%d in ('reg query "!jreRegKey!\!jreVersion!" /v "JavaHome" 2^>nul') do set "jreHome=%%e"
    if not defined jreHome (
        echo ERROR: The JRE is not properly installed on this system, although jreVersion ^(!jreVersion!^) exists.
        goto failure
    )

    if not exist "!jreHome!\bin\java.exe" (
        echo ERROR: The JRE home ^(!jreHome!^) does not contain java ^(bin\java.exe^).
        goto failure
    )
    echo Starting quickstarts app with JRE from JRE home ^(!jreHome!^)...
    "!jreHome!\bin\java" !jvmOptions! -jar !mainJar!
    goto endProcess
)

:failure
    echo.
    echo ERROR Java not found.
    echo Maybe install the latest OpenJDK from ^(https://adoptium.net/^) and check the environment variable JAVA_HOME ^(%JAVA_HOME%^).
    rem Prevent the terminal window to disappear before the user has seen the error message
    echo Press any key to close this window.
    pause
    goto endProcess

:endProcess
    endLocal
