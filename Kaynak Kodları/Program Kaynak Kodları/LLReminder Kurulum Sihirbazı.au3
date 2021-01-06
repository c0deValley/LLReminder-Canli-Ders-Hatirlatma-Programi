#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Compression=1
#AutoIt3Wrapper_Res_Comment=LLReminder - Live Lesson Reminder Program Kurulum Dosyası
#AutoIt3Wrapper_Res_Description=LLReminder Kurulum Dosyası
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_ProductName=LLReminder - Live Lesson Reminder Kurulum Dosyası
#AutoIt3Wrapper_Res_CompanyName=LLReminder.online
#AutoIt3Wrapper_Res_LegalCopyright=Copyright 2020 - LLReminder.online
#AutoIt3Wrapper_Res_Language=1055
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <DateTimeConstants.au3>
#include <Array.au3>
#include <Crypt.au3>
#include <Date.au3>
#include <String.au3>

If Not FileExists(@TempDir&'\LLReminderTemp') Then DirCreate(@TempDir&'\LLReminderTemp')
FileInstall("\foto.jpg", @TempDir & '\LLReminderTemp\foto.jpg');DİKKAT! Programı compile ederken resmin düzgün bir şekilde eklenebilmesi için görsel arayüzler klasöründe kurulum sihirbazı arayüzü altında bulunan foto.jpg'yi bu dosya ile aynı dizine koymanız gerekmektedir.
Sleep(50)

If ProcessExists("LLReminder.exe") Then ProcessClose("LLReminder.exe")
Sleep(55)
If ProcessExists("LLReminderDersHatirlatici.exe") Then ProcessClose("LLReminderDersHatirlatici.exe")
Sleep(45)

#Region ### START Koda GUI section ###
Global $ekran0 = GUICreate("LLReminder Öğrenci Versiyonu 1.0 Kurulum Sihirbazı", 561, 391, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("LLReminder Kurulum Sihirbazına", 178, 32, 346, 31)
GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder programı zaten bilgisayarınızda yüklü.", 178, 106, 330, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Lütfen devam etmek için bir işlem seçin.", 178, 124, 261, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $ekran0ileriButon = GUICtrlCreateButton("İleri >", 241, 320, 139, 33)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0F4C75)
GUICtrlCreateLabel("Hoşgeldiniz.", 178, 55, 132, 31)
GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $ekran0iptalButon = GUICtrlCreateButton("İptal", 390, 320, 139, 33)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0F4C75)
GUICtrlCreatePic(@TempDir & '\LLReminderTemp\foto.jpg', 0, 0, 156, 390)
GUICtrlCreateLabel("LLReminder'ın Güncel Sürümünü Yükle", 200, 180, 255, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder'ı Bilgisayardan Kaldır", 200, 210, 222, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $e0progGuncelle = GUICtrlCreateRadio("", 180, 180, 17, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $e0progKaldir = GUICtrlCreateRadio("", 180, 210, 17, 17)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

#Region ### START Koda GUI section ###
Global $ekran1 = GUICreate("LLReminder Öğrenci Versiyonu 1.0 Kurulum Sihirbazı", 561, 391, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("LLReminder Kurulum Sihirbazına", 178, 32, 346, 31)
GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("İleri butonuna basmanız durumunda LLReminder v1.0", 178, 106, 346, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("öğrenci versiyonu bilgisayarınıza yüklenecektir.", 178, 124, 307, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $ekran1ileributon = GUICtrlCreateButton("İleri >", 241, 320, 139, 33)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0F4C75)
GUICtrlCreateLabel("Hoşgeldiniz.", 178, 55, 132, 31)
GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Program bilgisayarınızın belgeler klasörüne yüklenecektir.", 178, 167, 376, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Devam etmek için İleri butonuna basınız.", 178, 209, 264, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $ekran1iptalbuton = GUICtrlCreateButton("İptal", 390, 320, 139, 33)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0F4C75)
GUICtrlCreatePic(@TempDir & '\LLReminderTemp\foto.jpg', 0, 0, 156, 390)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

If FileExists(@MyDocumentsDir&"\LLReminder") Then
	GUISetState(@SW_SHOW, $ekran0)
Else
	GUISetState(@SW_SHOW, $ekran1)
EndIf

#Region ### START Koda GUI section ###
Global $ekran2 = GUICreate("LLReminder Ögrenci Versiyonu 1.0 Kurulum Sihirbazı", 561, 391, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("LLReminder Kuruluyor...", 178, 32, 256, 31)
GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder programı bilgisayarınıza kuruluyor.", 178, 90, 309, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Lütfen bekleyiniz.", 178, 108, 117, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $ekran2IleriButon = GUICtrlCreateButton("İleri >", 390, 320, 139, 33)
GUICtrlSetState($ekran2IleriButon, $GUI_DISABLE)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0F4C75)
Global $ekran2BilgiMetni = GUICtrlCreateLabel("", 178, 177, 334, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreatePic(@TempDir & '\LLReminderTemp\foto.jpg', 0, 0, 156, 390)
Global $ekran2ilerlemeCubuk = GUICtrlCreateProgress(178, 216, 326, 17)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

#Region ### START Koda GUI section ###
Global $ekran3 = GUICreate("LLReminder Ögrenci Versiyonu 1.0 Kurulum Sihirbazı", 571, 391, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("LLReminder Kurulumu Tamamlandı.", 178, 32, 378, 31)
GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder programı bilgisayarınıza kuruldu.", 178, 90, 297, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Artık programı kullanmaya başlayabilirsiniz.", 178, 108, 284, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Programı kullanmadan önce Hızlı Başlangıç Rehberini", 178, 153, 349, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $ekran3Kapat = GUICtrlCreateButton("Bitir", 390, 320, 139, 33)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0F4C75)
GUICtrlCreatePic(@TempDir & '\LLReminderTemp\foto.jpg', 0, 0, 156, 390)
GUICtrlCreateLabel("okumanızı tavsiye ederiz.", 178, 174, 166, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $rehberiAc= GUICtrlCreateCheckbox("", 192, 224, 17, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Hızlı Başlangıç Rehberini aç", 214, 224, 183, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $programiAc = GUICtrlCreateCheckbox("", 192, 248, 17, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder programını çalıştır", 214, 248, 202, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

#Region ### START Koda GUI section ###
Global $ekran2Kaldir = GUICreate("LLReminder Öğrenci Versiyonu 1.0 Kurulum Sihirbazı", 561, 391, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("LLReminder Kaldırılıyor...", 178, 32, 267, 31)
GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder programı bilgisayarınızdan kaldırılıyor.", 178, 90, 333, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Lütfen bekleyiniz.", 178, 108, 117, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $e2KaldirBilgiMetni = GUICtrlCreateLabel("LLReminder kaldırılıyor...", 178, 177, 334, 20)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $e2KaldirKapat = GUICtrlCreateButton("Kapat", 390, 320, 139, 33)
GUICtrlSetState($e2KaldirKapat, $GUI_DISABLE)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x0F4C75)
GUICtrlCreatePic(@TempDir & '\LLReminderTemp\foto.jpg', 0, 0, 156, 390)
Global $kaldirProgress = GUICtrlCreateProgress(178, 216, 326, 17)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

While 1
	$aMsg = GUIGetMsg(1)
	Switch $aMsg[1]
		Case $ekran0
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					Exit
				Case $ekran0iptalButon
					Exit
				Case $ekran0ileriButon
					If GuiCtrlRead($e0progGuncelle) = $GUI_CHECKED Then
						GUISetState(@SW_HIDE, $ekran0)
						GUISetState(@SW_SHOW, $ekran2)
						guncellemeIslemi()
					Else
						GUISetState(@SW_HIDE, $ekran0)
						GUISetState(@SW_SHOW, $ekran2Kaldir)
						kaldirmaIslemi()
					Endif
			EndSwitch
		Case $ekran1
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					Exit
				Case $ekran1ileributon
					GUISetState(@SW_HIDE, $ekran1)
					GUISetState(@SW_SHOW, $ekran2)
					kurulumIslemi()
				Case $ekran1iptalbuton
					Exit
			EndSwitch
		Case $ekran2
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					Exit
				Case $ekran2IleriButon
					GUISetState(@SW_HIDE, $ekran2)
					GUISetState(@SW_SHOW, $ekran3)
			EndSwitch
		Case $ekran3
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					Exit
				Case $ekran3Kapat
					bitis()
			EndSwitch
		Case $ekran2Kaldir
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					Exit
				Case $e2KaldirKapat
					ShellExecute("https://LLReminder.online/gorusmek-uzere")
					Exit
			EndSwitch
	EndSwitch
WEnd

Func kurulumIslemi()
	GUICtrlSetData($ekran2ilerlemeCubuk, 15)
	GUICtrlSetData($ekran2BilgiMetni, "Kurulum başlıyor. Lütfen bekleyiniz...")
	Sleep(1700)
	GUICtrlSetData($ekran2BilgiMetni, "Uzak sunucudan dosya indiriliyor...")
	Sleep(800)
	indirme()
	GUICtrlSetData($ekran2ilerlemeCubuk, 45)
	GUICtrlSetData($ekran2BilgiMetni, "Dosya indirildi, kurulum devam ediyor...")
	Sleep(1200)
	GUICtrlSetData($ekran2BilgiMetni, "Dosyalar ayarlanıyor. Lütfen bekleyiniz...")
	Const $sZipFile = @TempDir&"\LLReminderTemp\LLReminderogrenciv10.zip"
	Const $sDestFolder = @MyDocumentsDir
	UnZip($sZipFile, $sDestFolder)
	GUICtrlSetData($ekran2ilerlemeCubuk, 72)
	Sleep(600)
	GUICtrlSetData($ekran2BilgiMetni, "Program lisansı ayarlanıyor...")
	Sleep(1100)
	$lisansKontrol = RegRead("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "KEY")
	If @Error Then olustur()
	Sleep(400)
	GUICtrlSetData($ekran2ilerlemeCubuk, 88)
	RegDelete("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "VER")
	RegWrite("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "VER", "REG_SZ", "1001")
	GUICtrlSetData($ekran2BilgiMetni, "Kısayol oluşturuluyor...")
	Sleep(700)
	kisayolOlustur()
	Sleep(1700)
	GUICtrlSetData($ekran2ilerlemeCubuk, 99)
	GUICtrlSetData($ekran2BilgiMetni, "Program kurulumu başarıyla tamamlandı.")
	GUICtrlSetState($ekran2IleriButon, $GUI_ENABLE)
EndFunc

Func guncellemeIslemi()
	GUICtrlSetData($ekran2BilgiMetni, "LLReminder Güncelleniyor...")
	GUICtrlSetData($ekran2ilerlemeCubuk, 5)
	DirRemove(@MyDocumentsDir&"\LLReminder\core\font",1)
	DirRemove(@MyDocumentsDir&"\LLReminder\core\gorseller",1)
	FileDelete(@MyDocumentsDir&"\LLReminder\LLReminder.exe")
	FileDelete(@MyDocumentsDir&"\LLReminder\core\LisansSozlesmesi.txt")
	FileDelete(@MyDocumentsDir&"\LLReminder\core\LLReminderDersHatirlatici.exe")
	FileDelete(@MyDocumentsDir&"\LLReminder\core\LLReminderHizliBaslangicRehberi.pdf")
	GUICtrlSetData($ekran2ilerlemeCubuk, 22)
	GUICtrlSetData($ekran2ilerlemeCubuk, 15)
	GUICtrlSetData($ekran2BilgiMetni, "Kurulum başlıyor. Lütfen bekleyiniz...")
	Sleep(1700)
	GUICtrlSetData($ekran2BilgiMetni, "Uzak sunucudan dosya indiriliyor...")
	Sleep(800)
	indirme()
	GUICtrlSetData($ekran2ilerlemeCubuk, 45)
	GUICtrlSetData($ekran2BilgiMetni, "Dosya indirildi, kurulum devam ediyor...")
	Sleep(1200)
	GUICtrlSetData($ekran2BilgiMetni, "Dosyalar ayarlanıyor. Lütfen bekleyiniz...")
	Const $sZipFile = @TempDir&"\LLReminderTemp\LLReminderogrenciv10.zip"
	Const $sDestFolder = @MyDocumentsDir
	UnZip($sZipFile, $sDestFolder)
	GUICtrlSetData($ekran2ilerlemeCubuk, 72)
	Sleep(600)
	GUICtrlSetData($ekran2BilgiMetni, "Program lisansı ayarlanıyor...")
	Sleep(1100)
	$lisansKontrol = RegRead("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "KEY")
	If @Error Then olustur()
	Sleep(400)
	GUICtrlSetData($ekran2ilerlemeCubuk, 88)
	RegDelete("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "VER")
	RegWrite("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "VER", "REG_SZ", "1001")
	GUICtrlSetData($ekran2BilgiMetni, "Kısayol oluşturuluyor...")
	Sleep(700)
	kisayolOlustur()
	Sleep(1700)
	GUICtrlSetData($ekran2ilerlemeCubuk, 99)
	GUICtrlSetData($ekran2BilgiMetni, "Program kurulumu başarıyla tamamlandı.")
	GUICtrlSetState($ekran2IleriButon, $GUI_ENABLE)
EndFunc

Func kaldirmaIslemi()
	GUICtrlSetData($kaldirProgress, 15)
	GUICtrlSetData($e2KaldirBilgiMetni, "Dosyalar siliniyor...")
	DirRemove(@MyDocumentsDir&"\LLReminder",1)
	Sleep(2900)
	GUICtrlSetData($kaldirProgress, 75)
	GUICtrlSetData($e2KaldirBilgiMetni, "Masaüstü kısayolu siliniyor...")
	Sleep(1000)
	FileDelete(@DesktopDir&"\LLReminder.lnk")
	Sleep(1700)
	GUICtrlSetData($kaldirProgress, 99)
	GUICtrlSetData($e2KaldirBilgiMetni, "LLReminder Kaldırıldı. Tekrar Görüşmek Üzere...")
	GUICtrlSetState($e2KaldirKapat, $GUI_ENABLE)
EndFunc

Func indirme()
	InetGet("http://llreminder.online/LLReminderogrenciv10.zip", @TempDir&"\LLReminderTemp\LLReminderogrenciv10.zip", 1, 0)
	If @error Then
		MsgBox(16, "HATA!", "Sunucudan dosya indirilirken bir hata oluştu. Muhtemelen internet bağlantınız yok. İnternete bağlanıp tekrar deneyin. Yine hata almanız durumunda iletişim: info@LLReminder.online")
		Exit
	EndIf
EndFunc

Func UnZip($sZipFile, $sDestFolder)
  If Not FileExists($sZipFile) Then Return SetError (1) ; source file does not exists
  If Not FileExists($sDestFolder) Then
    If Not DirCreate($sDestFolder) Then Return SetError (2) ; unable to create destination
  Else
    If Not StringInStr(FileGetAttrib($sDestFolder), "D") Then Return SetError (3) ; destination not folder
  EndIf
  Local $oShell = ObjCreate("shell.application")
  Local $oZip = $oShell.NameSpace($sZipFile)
  Local $iZipFileCount = $oZip.items.Count
  If Not $iZipFileCount Then Return SetError (4) ; zip file empty
  For $oFile In $oZip.items
    $oShell.NameSpace($sDestFolder).copyhere($ofile)
  Next
  Sleep(110)
  FileDelete($sZipFile)
EndFunc   ;==>UnZip

Func machineID()
	If @OSArch='x86' Then
		$reg='HKEY_LOCAL_MACHINE'
	Else
		$reg='HKEY_LOCAL_MACHINE64'
	EndIf
	$id=RegRead($reg & '\SOFTWARE\Microsoft\Cryptography', 'MachineGuid')
	Return StringTrimLeft(StringTrimRight($id, 1), 1)
EndFunc

Func olustur()
	$rUsercode = machineID()
	$register_till = _DateAdd('d', +10, _NowCalcDate())
	$fSerial=$rUsercode & "\" & $register_till
	$denemeKodu = _Crypt_EncryptData($fSerial, $rUsercode, $CALG_AES_192)
	RegWrite("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "KEY", "REG_SZ", $denemeKodu)
EndFunc

Func kisayolOlustur()
	$dosyaKonumu = @MyDocumentsDir&"\LLReminder\LLReminder.exe"
	$masaustuKonumu = @DesktopDir&"\LLReminder.lnk"
	FileCreateShortcut($dosyaKonumu, $masaustuKonumu)
EndFunc

Func bitis()
	If GuiCtrlRead($rehberiAc) = $GUI_CHECKED Then ShellExecute(@MyDocumentsDir&"\LLReminder\core\LLReminderHizliBaslangicRehberi.pdf")
	If GuiCtrlRead($programiAc) = $GUI_CHECKED Then ShellExecute(@MyDocumentsDir&"\LLReminder\LLReminder.exe")
	Sleep(500)
	Exit
EndFunc