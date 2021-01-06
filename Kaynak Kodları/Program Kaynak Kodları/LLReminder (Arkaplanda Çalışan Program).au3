#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=core\gorseller\icon.ico
#AutoIt3Wrapper_Compression=1
#AutoIt3Wrapper_Res_Comment=LLReminder Arkaplan Programı
#AutoIt3Wrapper_Res_Description=LLReminder Arkaplan
#AutoIt3Wrapper_Res_ProductName=LLReminder Arkaplan
#AutoIt3Wrapper_Res_CompanyName=LLReminder Arkaplan
#AutoIt3Wrapper_Res_LegalCopyright=Copyright 2020 - LLReminder.online
#AutoIt3Wrapper_Res_Language=1055
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
#include "license.au3"

; Bu dosya LLReminderDersHatirlatici.exe'nin kaynak kodudur.
; Normalde otomasyon işlemini Windows servisi yaparak çalıştırmak istiyordum. Ancak Autoit ile bunu nasıl yapacağımdan emin olamadım.
; Bundan dolayı program iki exeden oluşuyor. Ana program ders programını düzenlemeyi sağlayıp bu programı çalıştırıyor.
; Böylelikle program arkaplanda çalışmaya başlamış oluyor.
; Biliyorum, en iyi yöntem değil. Ancak Autoit bilgim dahilinde bundan fazlasını yapamadım.

;Lisans kontrol işlemi
If Not license_registered() Then
	license_warning()
EndIf
Sleep(50)

;Günlerin Türkçe karşılıklarının belirlenmesi
Switch @WDAY
        Case 1
            $day = "PAZAR"
        Case 2
            $day = "PAZARTESI"
        Case 3
            $day = "SALI"
        Case 4
            $day = "CARSAMBA"
        Case 5
            $day = "PERSEMBE"
        Case 6
            $day = "CUMA"
        Case 7
            $day = "CUMARTESI"
EndSwitch

Global $inifile = IniReadSection(@ScriptDir&"\veriler\"&$day&".ini", $day) ;Mevcut güne ait ders programının okunması
_ArrayColInsert($inifile,2) ;Ders programının yer aldığı ini dosyasının satırlara bölünmesi
If (@Error) Then
	Sleep(5)
	Exit
EndIf
While 1
  For $i = 1 to $inifile[0][0]
    If Not $inifile[$i][2] And $inifile[$i][0] = @HOUR & ":" & @MIN & ":" & @SEC Then ;Ders progamının sürekli okunması için döngü oluşturulması
		$inifile[$i][2] = True
		$dersAdiniGetir = $inifile[$i][1]
		dersiBaslat()
    EndIf
  Next
  Sleep (1000)
  WEnd

Func dersiBaslat()
	$dersturu = IniRead(@ScriptDir&"\veriler\dersler.ini", $dersAdiniGetir, "TUR", "")
	If $dersturu="ZOOM ID ve PASS" Then
		dersiBaslatID()
	ElseIf $dersturu="ZOOM URL" Then
		dersiBaslatURL()
	EndIf
EndFunc

Func dersiBaslatID()
	Global $dersBilgisiID = IniRead(@ScriptDir&"\veriler\dersler.ini", $dersAdiniGetir, "ID", "")
	Global $dersBilgisiPASS = IniRead(@ScriptDir&"\veriler\dersler.ini", $dersAdiniGetir, "PASS", "")
	If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
	$iMsgBoxAnswer = MsgBox(68,"LLReminder Ders Bildirimi", $dersAdiniGetir&" canlı dersiniz başladı. Zoom programı açılacak. Katılmak istiyor musunuz?")
	Select
		Case $iMsgBoxAnswer = 6
			ShellExecute("https://zoom.us/j/"&$dersBilgisiID)
			WinWaitActive("Enter meeting passcode")
			Sleep(250)
			Send($dersBilgisiPASS)
			Sleep(100)
			Send("{ENTER}")
		Case $iMsgBoxAnswer = 7
	EndSelect
EndFunc

Func dersiBaslatURL()
	Global $dersBilgisiURL = IniRead(@ScriptDir&"\veriler\dersler.ini", $dersAdiniGetir, "URL", "")
	If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
	$iMsgBoxAnswer = MsgBox(68,"LLReminder Ders Bildirimi", $dersAdiniGetir&" canlı dersiniz başladı. Zoom linki açılacak. Katılmak istiyor musunuz?")
	Select
		Case $iMsgBoxAnswer = 6
			ShellExecute($dersBilgisiURL)
		Case $iMsgBoxAnswer = 7
	EndSelect
EndFunc