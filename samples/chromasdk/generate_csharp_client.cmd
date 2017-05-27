@ECHO OFF

SET PATH=%PATH%;c:\cygwin64\bin

CALL clean.cmd

ECHO Generating CSHARP .Net 2 Client...

SET OUT_DIR=%CD%
SET SW_DIR=%CD%\..\..

SET OUT_GEN=csharp
SET OUT_NAME=chromasdk_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger.yaml
SET PACKAGE=chromasdk
call:genFunc


SET OUT_GEN=CsharpDotNet2
SET OUT_NAME=chromasdk_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger.yaml
SET PACKAGE=chromasdk
call:genFunc


ECHO Clients Generated [DONE]

PAUSE
EXIT

:genFunc
ECHO Generating (%OUT_NAME%)...
CD "%OUT_DIR%"
REM PAUSE
cd "%SW_DIR%"
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar config-help -l %OUT_GEN%
REM PAUSE
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l %OUT_GEN% -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %PACKAGE%.model -DtargetFramework=v3.5
CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l %OUT_GEN% -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %PACKAGE%.model
ECHO Generated (%OUT_NAME%) [DONE]
GOTO:eof
