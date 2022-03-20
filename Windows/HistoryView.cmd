@echo off

Title HistoryView - Visualizar hist¢rico do Windows

:: github.com/Alien8652 17/02/2022

set chave="HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"
set mensagem=""

:main
if %mensagem% neq "" echo Descriá∆o = %mensagem% & pause>nul
set pasta=""
echo.
echo HistoryView - Visualizar hist¢rico do Windows
echo.
echo.0 = Logs do Windows
echo.1 = Pasta de arquivos tempor†rios
echo.2 = Pasta de arquivos acessados recentemente
echo.3 = Dados tempor†rios de instalaá∆o
echo.4 = Dados de preferància de instalaá∆o e execuá∆o
echo.5 = Cache de Thumbs do Explorer
echo.6 = Chave de registro User Assist
echo.7 = Lista de Atalhos(Jump Lists)
echo.8 = (Jump Lists) Custom Destinations
echo.9 = (Jump Lists) Automatic Destinations
echo.S = Sair
echo.

Choice /c S1234567890 /m "Digite a opá∆o"
echo.
If %ErrorLevel%==1 exit

If %ErrorLevel%==2 set pasta="%TMP%" & set mensagem="Registros tempor†rios de alguns aplicativos, normalmente s∆o apagados ap¢s o uso, mas as vezes o programa n∆o apaga por erro ou pelo arquivo ainda estar em sendo usado, ela serve como uma pasta de ajuda para o programa manipular arquivos, o problema de apagar algo nessa pasta Ç que alguns programas podem deixar de funcionar no momento da execuá∆o, se for apagar feche todas as janelas de outros programas"

If %ErrorLevel%==3 set pasta="%UserProfile%\Recent" & set mensagem="Arquivos recentes acessados, essa pasta cria atalhos de tudo(Arquivos executados como aplicativos, documentos e m°dias. Pastas como pastas compartilhadas por computadores na rede. Unidades como USB, CD/DVD), n∆o tem problema apagar algo nessa pasta, a menos que vocà se utilize esse recurso"

If %ErrorLevel%==4 set pasta="%WinDir%\Installer" & set mensagem="Essa pasta guarda dados de instalaá∆o, seja de um programa simples atÇ atualizaá‰es do Windows, os arquivos salvos nela s∆o executaveis, dados de instalaá∆o e Pacotes do Windows Installer(MSI), o problema de apagar algo nela Ç caso seja necess†rio uma atualizaá∆o, ou uma restauraá∆o de sistema ou de aplicativo, pode dar erro e n∆o ser poss°vel mais restaurar/atualizar"

If %ErrorLevel%==5 set pasta="%WinDir%\Prefetch" & set mensagem="Essa pasta guarda bytes de dados mapeados sobre execuá∆o de programas e areas do HD para poder deixar mais r†pido o acesso, apagar os dados dela pode afetar o desempenho e deixar mais lerdo o sistema, mas pode apagar de vez em quando(1 vez a cada 3 meses, 1 ano), um programa para visualizar essa pasta Ç o WinPrefetchView"

If %ErrorLevel%==6 set pasta="%UserProfile%\AppData\Local\Microsoft\Windows\Explorer\" & set mensagem="Semelhante as thumbs do Android, mas sem a otimizaá∆o, podendo ocupar um espaco consider†vel de ~100 MB+, as thumbs guardadas s∆o de v°deos, imagens e alguns documentos(Com m°dia, tipo ODF), s∆o armazenadas em diversas qualidades em arquivos .db, o problema de apagar alguns arquivos dessa pasta Ç fazer com que o Windows deixe de exibir as thumbs(Todas as imagens ficar∆o com uma thumb padr∆o de imagem), o recomendado Ç verificar(Com o programa ThumbCacheViewer na internet) e apagar o conte£do de somente algumas thumbs(Conte£do, n∆o arquivo!), exemplo de arquivos com thumbs: thumbcache_32.db/thumbcache_96.db/thumbcache_256.db"

If %ErrorLevel%==7 ( echo.Abra com o editor de registro a chave de registro UserAssist ou baixe o programa UserAssistView & echo.Chave UserAssist  = %chave% & echo.  & echo.Algumas sub-chaves:  & set mensagem="UserAssist guarda um hist¢rico de programas executados pelo usu†rio, uma lista enorme desde a instalaá∆o do Windows" & reg query %chave% ) & goto :main

If %ErrorLevel%==8 set pasta="%UserProfile%\AppData\Roaming\Microsoft\Windows\Recent"  & set mensagem="Listas de atalhos, sabe quando vocà clica com o bot∆o direito do mouse sobre algum programa no menu iniciar e aparece alguns arquivos? ent∆o, Ç la onde fica armazenado essas listas de itens acessados recentemente"

If %ErrorLevel%==9 set pasta="%UserProfile%\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations"  & set mensagem="Listas de atalhos 2, sem descriá∆o ainda"

If %ErrorLevel%==10 set pasta="%UserProfile%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations"  & set mensagem="Listas de atalhos 3, sem descriá∆o ainda"

If %ErrorLevel%==11 eventvwr.msc & echo.Abrindo eventvwr.msc... & set mensagem="Registros do Windows(Tipo um LogCat do Linux), aplicativos abertos, informaá‰es sobre o sistema, informaá‰es sobre logins e registros de erros cr°ticos" & goto :main

echo.Abrindo %pasta%...
:: Ou start %pasta%
explorer %pasta%

goto :main
