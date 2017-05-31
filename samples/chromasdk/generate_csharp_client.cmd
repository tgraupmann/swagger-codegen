@ECHO OFF

SET PATH=%PATH%;c:\cygwin64\bin

CALL clean.cmd

ECHO Generating CSHARP .Net 2 Client...

SET OUT_DIR=%CD%
SET SW_DIR=%CD%\..\..


REM Generate API

SET OUT_GEN=csharp
SET OUT_NAME=chromasdk_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger.yaml
SET PACKAGE=ChromaPackage
SET NAMESPACE=ChromaSDK
SET MODEL=%PACKAGE%.Model
call:genFunc


REM Generate Custom API to workaround fields with multiple types

SET OUT_GEN=csharp
SET OUT_NAME=custom_chromasdk_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger_custom.yaml
SET PACKAGE=CustomChromaPackage
SET NAMESPACE=CustomChromaSDK
SET MODEL=%PACKAGE%.Model
call:genFunc


REM Generate Razer endpoint

SET OUT_GEN=csharp
SET OUT_NAME=razer_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger_razer.yaml
SET PACKAGE=RazerPackage
SET NAMESPACE=RazerSDK
SET MODEL=%PACKAGE%.Model
call:genFunc


REM SET OUT_GEN=CsharpDotNet2
REM SET OUT_NAME=chromasdk_%OUT_GEN%
REM SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger.yaml
REM SET PACKAGE=ChromaPackage
REM SET NAMESPACE=ChromaSDK
REM SET MODEL=%PACKAGE%.Model
REM call:genFunc


ECHO Clients Generated [DONE]

PAUSE
EXIT

:genFunc
ECHO Generating (%OUT_NAME%)...
CD "%OUT_DIR%"
REM PAUSE
cd "%SW_DIR%"
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar help
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar config-help -l %OUT_GEN%
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l %OUT_GEN% -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %MODEL% -DtargetFramework=v3.5
CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l %OUT_GEN% -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %MODEL% -DpackageName=%NAMESPACE%
ECHO Generated (%OUT_NAME%) [DONE]
GOTO:eof
