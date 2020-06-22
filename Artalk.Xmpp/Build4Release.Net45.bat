@echo off

REM directorio de las librerías
set library_dir=.\..\..\..\DLL

REM plataforma
set plattform=Net45

REM directorio de compilación
set compilation_dir=.\bin\Release\%plattform%\

REM nombre del assembly y del fichero
set assembly_name=Artalk.Xmpp
set assembly_filename=%assembly_name%.dll

REM directorio del Framework
set msbuild="C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\msbuild.exe"

echo Se va a compilar el assembly %assembly_filename%. Confirme con una "S" que desea continuar.
set /p pregunta=

if not %pregunta%==S goto:EOF

%msbuild% %assembly_name%.sln /p:Configuration=Release /t:Clean;Rebuild /p:OutputPath=%compilation_dir%
REM FOR /F "tokens=*" %%G IN ('DIR /B /AD /S obj') DO RMDIR /S /Q "%%G"

%library_dir%\AssemblyToDirectory\AssemblyToDirectory.exe %compilation_dir% %assembly_filename% %library_dir%\%assembly_name%\%plattform%

pause