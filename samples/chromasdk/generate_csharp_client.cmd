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
SET APINAME=ChromaApi
call:genFunc


REM Generate Custom API to workaround fields with multiple types

REM SET OUT_GEN=csharp
REM SET OUT_NAME=custom_chromasdk_%OUT_GEN%
REM SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger_custom.yaml
REM SET PACKAGE=CustomChromaPackage
REM SET NAMESPACE=CustomChromaSDK
REM SET MODEL=%PACKAGE%.Model
REM call:genFunc


REM Generate Razer endpoint

SET OUT_GEN=csharp
SET OUT_NAME=razer_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger_razer.yaml
SET PACKAGE=RazerPackage
SET NAMESPACE=RazerSDK
SET MODEL=%PACKAGE%.Model
SET LEVEL=2
SET APINAME=RazerApi
call:genFunc


SET OUT_GEN=csharp
SET OUT_NAME=razer_delete_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger_delete.yaml
SET PACKAGE=RazerDeletePackage
SET NAMESPACE=RazerSDKDelete
SET MODEL=%PACKAGE%.Model
SET APINAME=RazerDeleteApi
SET LEVEL=3
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
CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l %OUT_GEN% -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %MODEL% -DpackageName=%NAMESPACE%,optionalAssemblyInfo=false,apiLevel=%LEVEL%,apiName=%APINAME%,excludeTests=true
ECHO Generated (%OUT_NAME%) [DONE]
GOTO:eof
