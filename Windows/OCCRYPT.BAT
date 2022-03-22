@echo off
color 0d
title OCULTADOR DE ARQUIVOS - %date% %time%
rem Script feito por Gabriel Matheus de Castro 16/08/2014
mode 88, 33
if %1==6 set S=0
if %1==7 exit
echo x = msgbox ("FIM !", 64 ,"OCULTADOR - SAIDA") >> "%tmp%\f.vbs"
if %1==6 goto :semERR
goto :ERROR
:semERR
set al=%RANDOM%
echo x = msgbox ("Mova os arquivos que vc quer ocultar na pasta 'SECRETO TEMP'"^&vbCRLF^&"FECHE A PASTA(Dá erro se dexar aberta) e DEPOIS clique em OK para continuar", 0 ,"OCULTADOR - JANELA DE ESPERA") >> "%tmp%\x.vbs"
if not exist "SECRETO TEMP" md "SECRETO TEMP"
explorer "%CD%\SECRETO TEMP"
"%tmp%\x.vbs"
echo x = msgbox ("EXITO NA OPERACAO !", 64 ,"OCULTADOR - JANELA DE EXITO") >> "%tmp%\c.vbs"
goto :PASSAERR
:ERROR
cls
"%tmp%\e.vbs"
goto :FIMSIMPLES
:PASSAERR
if %S%==0 goto :SIM
goto :ERROR
:compactar
echo RAR Encontrado!
choice /c sn /m "Deseja compactar o arquivo com uma senha(Mais seguro) "
if %errorlevel%==2 goto :voltar
set /p "senha=Digite a senha: "
%RAR% a -m5 -y -df -hp%senha% "bytes.bin" "SECRETO TEMP">nul 2>&1
if "%errorlevel%" EQU "0" ( echo Compactado com sucesso! & set compactado="sim" ) Else ( echo Erro = ErrorLevel %ErrorLevel% & goto :ERROR )
goto :voltar
:desChave
echo goto :passar >> CHAVE%al%.BAT
echo :erro >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rename "DEC5" "ALIEN100.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}" >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rename "DEC4" "ALIEN100.{04731B67-D933-450a-90E6-4ACD2E9408FE}" >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rename "DEC3" "ALIEN100.{9DB7A13C-F208-4981-8353-73CC61AE2783}" >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rename "DEC2" "ALIEN1000.{ED7BA470-8E54-465E-825C-99712043E01C}" >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rename "DEC1" "ALIEN100.{22877a6d-37a1-461a-91b0-dbda5aaebc99}" >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rename "DEC0" "ALIEN%al%.{645FF040-5081-101B-9F08-00AA002F954E}" >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rename "DEC" ".MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}" >> CHAVE%al%.BAT
echo attrib +h +s ".MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}" >> CHAVE%al%.BAT
echo echo Senha incorreta ou erro do compactador! >> CHAVE%al%.BAT
echo pause^>nul >> CHAVE%al%.BAT
echo exit /b 1 >> CHAVE%al%.BAT
echo :passar >> CHAVE%al%.BAT
echo set RAR="%%ProgramFiles%%\WinRAR\RAR.exe" >> CHAVE%al%.BAT
echo set erro="t" >> CHAVE%al%.BAT
echo if exist %%RAR%% goto :descompactar else goto :sem >> CHAVE%al%.BAT
echo :descompactar >> CHAVE%al%.BAT
echo set erro="f" >> CHAVE%al%.BAT
echo set /p "senha=Digite a senha: " >> CHAVE%al%.BAT
echo %%RAR%% x -p%%senha%% "alien%al%\bytes.bin"^>nul >> CHAVE%al%.BAT
echo echo.  >> CHAVE%al%.BAT
echo if "%%ErrorLevel%%" EQU "0" ( echo Descompactado com sucesso! ) else ( set erro="t" ) >> CHAVE%al%.BAT
echo :sem >> CHAVE%al%.BAT
echo if %%erro%%=="t" ( echo Erro, retornando... ^& goto :erro ) >> CHAVE%al%.BAT
echo move "%%CD%%\SECRETO TEMP" "%%pastaInicial%%\" >> CHAVE%al%.BAT
echo set pasta="%%pastaInicial%%\SECRETO TEMP">> CHAVE%al%.BAT
goto :reW
:SIM
md alien%al%
md ALIEN2
set RAR="%ProgramFiles%\WinRAR\RAR.exe"
set compactado="nao"
if exist %RAR% goto :compactar
:voltar
if %compactado%=="nao" ( move "SECRETO TEMP" "alien%al%" ) else ( move "bytes.bin" "alien%al%" )
if not exist "PASTA SECRETA" md "PASTA SECRETA"
move "alien%al%" "ALIEN2"
mkdir "PASTA SECRETA\MALETA\ALIEN0\ALIEN1\ALIEN8\ALIEN6\ALIEN5\"
move "ALIEN2" "PASTA SECRETA\MALETA\ALIEN0\ALIEN1\ALIEN8\ALIEN6\ALIEN5"
cd "PASTA SECRETA\MALETA\ALIEN0\ALIEN1\ALIEN8\ALIEN6\ALIEN5\"
rename "ALIEN2" "ALIEN100.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}"
cd ..
rename "ALIEN5" "ALIEN100.{04731B67-D933-450a-90E6-4ACD2E9408FE}"
cd ..
rename "ALIEN6" "ALIEN100.{9DB7A13C-F208-4981-8353-73CC61AE2783}"
cd ..
rename "ALIEN8" "ALIEN1000.{ED7BA470-8E54-465E-825C-99712043E01C}"
cd ..
rename "ALIEN1" "ALIEN100.{22877a6d-37a1-461a-91b0-dbda5aaebc99}"
cd ..
rename "ALIEN0" "ALIEN%al%.{645FF040-5081-101B-9F08-00AA002F954E}"
cd ..
rename "MALETA" ".MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}"
attrib +h +S ".MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}"
cd ..
echo x = msgbox ("OCORREU UM ERRO ! ErrorLevel = %errorlevel%", 16 ,"OCULTADOR - JANELA DE ERRO") >> "%tmp%\e.vbs"
::if %errorlevel%!=0 ( "%tmp%\c.vbs" ) else ( "%tmp%\e.vbs" )
echo Criando a chave "CHAVE%al%.BAT"...
echo @echo off > CHAVE%al%.BAT
echo color 0a >> CHAVE%al%.BAT
echo title CHAVE >> CHAVE%al%.BAT
echo set pastaInicial=%%CD%%>> CHAVE%al%.BAT
echo attrib -h -s ".MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}" >> CHAVE%al%.BAT
echo if exist ".MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}" goto :okmale >> CHAVE%al%.BAT
echo color 0c >> CHAVE%al%.BAT
echo echo Maleta nao encontrada ou imcompativel selecione a MALETA%al% ! >> CHAVE%al%.BAT
echo pause^>nul >> CHAVE%al%.BAT
echo exit >> CHAVE%al%.BAT
echo :okmale >> CHAVE%al%.BAT
echo echo Desocultando... >> CHAVE%al%.BAT
echo rename ".MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}" "DEC" >> CHAVE%al%.BAT
echo cd DEC >> CHAVE%al%.BAT
echo rename "ALIEN%al%.{645FF040-5081-101B-9F08-00AA002F954E}" "DEC0" >> CHAVE%al%.BAT
echo cd DEC0 >> CHAVE%al%.BAT
echo rename "ALIEN100.{22877a6d-37a1-461a-91b0-dbda5aaebc99}" "DEC1" >> CHAVE%al%.BAT
echo cd DEC1 >> CHAVE%al%.BAT
echo rename "ALIEN1000.{ED7BA470-8E54-465E-825C-99712043E01C}" "DEC2" >> CHAVE%al%.BAT
echo cd DEC2 >> CHAVE%al%.BAT
echo rename "ALIEN100.{9DB7A13C-F208-4981-8353-73CC61AE2783}" "DEC3" >> CHAVE%al%.BAT
echo cd DEC3 >> CHAVE%al%.BAT
echo rename "ALIEN100.{04731B67-D933-450a-90E6-4ACD2E9408FE}" "DEC4" >> CHAVE%al%.BAT
echo cd DEC4 >> CHAVE%al%.BAT
echo rename "ALIEN100.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}" "DEC5" >> CHAVE%al%.BAT
echo cd DEC5 >> CHAVE%al%.BAT
echo set pasta="alien%al%" >> CHAVE%al%.BAT
if %compactado%=="sim" goto :desChave
:reW
echo if %%pasta%%=="alien%al%" move "%%CD%%\alien%al%\SECRETO TEMP" "%%pastaInicial%%\" >> CHAVE%al%.BAT
echo set pasta="%%pastaInicial%%\SECRETO TEMP">> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo cd .. >> CHAVE%al%.BAT
echo rd /s /q "DEC" >> CHAVE%al%.BAT
echo explorer.exe "%%pasta%%" >> CHAVE%al%.BAT
echo echo Abrindo pasta... >> CHAVE%al%.BAT
echo timeout 10 >> CHAVE%al%.BAT
echo exit >> CHAVE%al%.BAT
move CHAVE%al%.BAT "PASTA SECRETA"
:FIMSIMPLES
del /q "%tmp%\x.vbs"
del /q "%tmp%\c.vbs"
del /q "%tmp%\e.vbs"
echo.
echo Pasta Secreta = %CD%\PASTA SECRETA
echo.
echo Seus arquivos foram ocultados na pasta "PASTA SECRETA"
echo                                  com os seguintes nomes:
echo Arquivo Ocultado: .MALETA%al%.{85BBD920-42A0-1069-A2E4-08002B30309D}
echo Sua Chave: CHAVE%al%.BAT
echo.
echo JAMAIS PERCA SUA CHAVE!
echo.
echo Para visualizar arquivos ocultos, abra o explorador de arquivos(explorer.exe):
echo Va na aba "Ferramentas"
echo Clique em "Opcoes de Pasta..."
echo.
echo Entre na aba "Modo de Exibicao" e procure os seguintes itens para configurar:
echo Marque "Mostrar arquivos, pastas e unidades ocultas"
echo Desmarque "Ocultar arquivos protegidos do sistema ope..."
echo.
echo Pressione alguma tecla para sair...
"%tmp%\f.vbs"
del /q "%tmp%\f.vbs"
pause>nul
exit
