Set wshShell = wscript.CreateObject("WScript.Shell")
m = msgbox ("Deseja ocultar arquivos?"&vbCRLF&"[AVISO, O PROCESSO N�O PODER� SER INTERROMPIDO, SCRIPT DE TESTE, PODE APAGAR SEUS ARQUIVOS ACIDENTALMENTE, SIGA AS INSTRU��ES A RISCA]!", 36 ,"OCULTADOR DE ARQUIVOS - JANELA DE OP��ES")
WshShell.Run "OCCRYPT.BAT " & m
