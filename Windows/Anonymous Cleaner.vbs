limpar = msgbox("Deseja limpar os seguintes dados do seu computador?"&vbCRLF&"Arquivos Temporários"&chr(13)&"Arquivos Recentes"+vbCRLF+"Cache de thumbs do 'explorer.exe'"+vbCRLF+vbCRLF+"AVISO: Script Beta, pode causar comportamentos inesperados!",vbYesNo+vbQuestion,"AnonyClean") 
if limpar = vbyes then
		continua = msgbox("FECHE TODAS AS JANELAS E DEPOIS CLIQUE EM OK PARA CONTINUAR!!! (Principalmente do Explorer)",vbOkCancel+vbExclamation,"AnonyClean - Aviso")
		if continua = vbOk then
				Set WshShell = WScript.CreateObject("WScript.Shell") 
				WshShell.Run("AnonyClean.cmd "&99)
		end if
end if
