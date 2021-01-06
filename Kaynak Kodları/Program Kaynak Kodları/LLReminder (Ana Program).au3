#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=core\gorseller\icon.ico
#AutoIt3Wrapper_Compression=1
#AutoIt3Wrapper_Res_Comment=LLReminder | Live Lesson Reminder - Online Ders Hatırlatma Programı
#AutoIt3Wrapper_Res_Description=Live Lesson Reminder Öğrenci Versiyonu v1.0
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_ProductName=LLReminder Öğrenci Versiyonu 1.0
#AutoIt3Wrapper_Res_ProductVersion=1001
#AutoIt3Wrapper_Res_CompanyName=LLReminder.online
#AutoIt3Wrapper_Res_LegalCopyright=© 2020 LLReminder.online
#AutoIt3Wrapper_Res_Language=1055
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <Date.au3>
#include <File.au3>
#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GUIListBox.au3>
#include <GUIListView.au3>
#include <GuiRichEdit.au3>
#include <GuiStatusBar.au3>
#include "license.au3"
#include <StaticConstants.au3>
#include <TrayConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPIGdi.au3>
#include <MsgBoxConstants.au3>
#include '_Startup.au3'

;Lisans kontrolü
setinfo(True)
If Not license_registered() Then
	license_warning()
EndIf

;Program dizininde bulunan yazı fontlarının programa dahil edilmesi
_WinAPI_AddFontResourceEx(@ScriptDir & '\core\font\Trenda.otf', $FR_PRIVATE)
_WinAPI_AddFontResourceEx(@ScriptDir & '\core\font\Trenda Bold.otf', $FR_PRIVATE)
_WinAPI_AddFontResourceEx(@ScriptDir & '\core\font\Trenda Semibold.otf', $FR_PRIVATE)
_WinAPI_AddFontResourceEx(@ScriptDir & '\core\font\Trenda Black.otf', $FR_PRIVATE)

;Güncelleme kontrolü sırasında mevcut sürümün bulunduğu txt dosyasının indirileceği geçici klasörün oluşturulması
If Not FileExists(@TempDir&'\LLReminderTemp') Then DirCreate(@TempDir&'\LLReminderTemp')

;Günlerin Türkçe isimlerine karşılık gelmesinin sağlanması
Switch @WDAY
	Case 1
		Global $day = "PAZAR"
	Case 2
		Global $day = "PAZARTESI"
	Case 3
		Global $day = "SALI"
	Case 4
		Global $day = "CARSAMBA"
	Case 5
		Global $day = "PERSEMBE"
	Case 6
		Global $day = "CUMA"
	Case 7
		Global $day = "CUMARTESI"
EndSwitch

; Anasayfa Arayüzü
#Region ### START Koda GUI section ###
Global $anaSayfaFormGUI = GUICreate("LLReminder | Live Lesson Reminder - Canlı Ders Hatırlatma Programı (Öğrenci Versiyonu | v1.0)", 663, 458, -1, -1)
Global $anaSfUstMenuAyarlar = GUICtrlCreateMenu("Ayarlar")
Global $anaSfUstMenuDosyaBakim = GUICtrlCreateMenu("Dosya Bakımı", $anaSfUstMenuAyarlar)
Global $anaSfUstMenuDersleriSil = GUICtrlCreateMenuItem("Derslerin Hepsini Sil", $anaSfUstMenuDosyaBakim)
Global $anaSfUstMenuDProgramiSil = GUICtrlCreateMenuItem("Ders Programını Sil", $anaSfUstMenuDosyaBakim)
Global $anaSfUstMenuYazilimAyar = GUICtrlCreateMenuItem("Yazılım Ayarları", $anaSfUstMenuAyarlar)
Global $anaSfUstMenuGuncelKontrol = GUICtrlCreateMenuItem("Güncelleme Kontrolü", $anaSfUstMenuAyarlar)
Global $anaSfUstMenuLisansKontrolu = GUICtrlCreateMenuItem("Lisans Kontrolü", $anaSfUstMenuAyarlar)
Global $anaSfUstMenuNasilKul = GUICtrlCreateMenu("&Nasıl Kullanılır")
Global $anaSfUstMenukullanimKilavuz = GUICtrlCreateMenuItem("Kullanım Kılavuzu", $anaSfUstMenuNasilKul)
Global $anaSfUstMenuOnlineDestek = GUICtrlCreateMenuItem("Online Destek", $anaSfUstMenuNasilKul)
Global $anaSfUstMenuHakkindaUst = GUICtrlCreateMenu("Hakkında")
Global $anaSfUstMenuHakkinda = GUICtrlCreateMenuItem("Program Hakkında", $anaSfUstMenuHakkindaUst)
GUISetBkColor(0x1B262C)
GUICtrlCreatePic(@ScriptDir & "\core\gorseller\logo.jpg", 131, 40, 400, 121)
Global $anaSayfadersEkleGUIButonu = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\buton1.jpg", 48, 176, 134, 147)
GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlSetCursor (-1, 0)
Global $anaSayfadersSilGUIButonu = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\buton2.jpg", 192, 176, 134, 147)
GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlSetCursor (-1, 0)
Global $anaSayfadersProgDuzenleGUIButonu = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\buton3.jpg", 336, 176, 134, 147)
GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlSetCursor (-1, 0)
Global $anaSayfadersProgGosterGUIButonu = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\buton4.jpg", 480, 176, 134, 147)
GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlSetCursor (-1, 0)
Global $anaSayfaBaslatGUIButonu = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\calistir.jpg", 181, 336, 301, 49)
GUICtrlSetCursor (-1, 0)
$altCubuk = _GUICtrlStatusBar_Create($anaSayfaFormGUI)
Dim $altCubuk_PartsWidth[1] = [-1]
_GUICtrlStatusBar_SetParts($altCubuk, $altCubuk_PartsWidth)
_GUICtrlStatusBar_SetText($altCubuk, "Program bekleme modunda. Başlatmak için dersleri ayarladıktan sonra çalıştır butonuna tıklayın. | LLReminder.online", 0)
_GUICtrlStatusBar_SetBkColor($altCubuk, 0x000000)
_GUICtrlStatusBar_SetMinHeight($altCubuk, 18)
Global $onlineDestekButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\onlineDestek.jpg", 510, 0, 152, 30)
GUICtrlSetCursor (-1, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

;Anasayfa arayüzündeki çalıştır butonu için otomasyon programının çalışıp çalışmadığının kontrol edilmesi
If ProcessExists("LLReminderDersHatirlatici.exe") Then
	GUICtrlSetImage($anaSayfaBaslatGUIButonu, @ScriptDir & "\core\gorseller\durdur.jpg")
	_GUICtrlStatusBar_SetText($altCubuk, "Program arka planda çalışıyor. Bu pencereyi kapatabilir, programı durdurmak isterseniz tekrar açabilirsiniz.")
Else
	GUICtrlSetImage($anaSayfaBaslatGUIButonu, @ScriptDir & "\core\gorseller\calistir.jpg")
	_GUICtrlStatusBar_SetText($altCubuk, "Program bekleme modunda. Başlatmak için dersleri ayarladıktan sonra başlat butonuna tıklayın. | LLReminder.online")
EndIf

;Eğer program Salı, Perşembe ve Cuma günlerinden herhangi birinde açılmış ise güncelleme kontrolü yapılması
If $day = "SALI" or "PERSEMBE" or "CUMA" Then
	$programSurumu = RegRead("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "VER");Programın sürümü Kayıt Defterinde yer almaktadır.
	InetGet("http://llreminder.online/surumKontrol.txt", @TempDir&"\LLReminderTemp\check_update.txt", 1); Mevcut sürüm web sitesindeki bir txt dosyasından kontrol edilmektedir.
	$guncellemefile = FileOpen(@TempDir&"\LLReminderTemp\check_update.txt", 0)
	Local $guncellemeline = FileReadLine($guncellemefile)
	FileClose($guncellemefile)
	FileDelete(@TempDir&"\LLReminderTemp\check_update.txt")
	If $guncellemeline = $programSurumu Then
	Else
		$guncellemeVarMesaji = MsgBox(68, "Yeni Güncelleme Yayınlanmış", "Yeni bir güncellenme yayınlanmış! En kısa sürede yüklemenizi tavsiye ederiz. Yüklemek istiyor musunuz?", 20)
		Select
			Case $guncellemeVarMesaji = 6
				ShellExecute("https://llreminder.online/guncelleme/")
			Case $guncellemeVarMesaji = 7
		EndSelect
	EndIf
Else
EndIf

;Ders Ekleme Sayfası Arayüzü
#Region ### START Koda GUI section ###
$dersEkleFormGUI = GUICreate("Ders Ekle | LLReminder", 617, 451, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 24, 88, 313, 73)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Adı", 34, 101, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Global $dersEkleDersAdi = GUICtrlCreateInput("", 34, 128, 137, 24)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Türü", 194, 101, 80, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Global $dersEkleDersTuruSecin = GUICtrlCreateCombo("ZOOM ID ve PASS", 194, 128, 134, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "ZOOM URL")
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", 24, 168, 313, 129)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Zoom ID", 34, 184, 72, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Global $dersEkleZoomID = GUICtrlCreateInput("", 34, 208, 137, 24, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Password/Şifre", 191, 184, 122, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Global $dersEkleZoomPass = GUICtrlCreateInput("", 191, 208, 137, 24)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Zoom URL (Yoksa boş bırakın)", 34, 236, 241, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Global $dersEkleZoomURL = GUICtrlCreateInput("", 34, 260, 294, 24)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersEkleButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 304, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Ekleme", 246, 16, 124, 30)
GUICtrlSetFont(-1, 16, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersekle = FileRead(@ScriptDir & "\core\veriler\dersler.ini")
Global $dersEkleMevcutDersler = GUICtrlCreateEdit("", 365, 120, 217, 305, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan LLReminder'e yeni dersler ekleyebilirsiniz.", 142, 41, 331, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders türü kısmından dersin ne şekilde açılmasını istediğinizi seçmeniz gerekmektedir.", 52, 57, 520, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bir derse ait bilgileri değiştirmek istiyorsanız dersin", 27, 352, 309, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 800, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("en son girdiğiniz bilgiler sisteme kayıt olacaktır.", 27, 384, 287, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 409, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("adını yazıp yeni bilgileri girin. Bir ders için her zaman", 27, 368, 316, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;Ders Silme Sayfası Arayüzü
#Region ### START Koda GUI section ###
Global $dersSilFormGUI = GUICreate("Ders Sil | LLReminder", 501, 377, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 24, 88, 211, 73)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Adı", 34, 101, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Global $dersSilDersAdi = GUICtrlCreateCombo("", 32, 128, 193, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersSilButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\sil.jpg", 82, 168, 102, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Silme", 197, 16, 106, 30)
GUICtrlSetFont(-1, 16, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersSil = FileRead(@ScriptDir & "\core\veriler\dersler.ini")
Global $dersSilMevcutDersler = GUICtrlCreateEdit("", 253, 120, 217, 209, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 309, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfayı kullanarak LLReminder'den ders silebilirsiniz.", 78, 41, 338, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Dersi silmek için ders adını yazmanız yeterlidir.", 100, 57, 282, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Tüm dersleri silmek istiyorsanız", 27, 216, 190, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 800, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ayarlar > Dosya Bakımı kısmını", 27, 248, 189, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat", 27, 297, 195, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("anasayfadaki üst menüde bulunan", 27, 232, 214, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("kullanabilirsiniz.", 27, 264, 99, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("butonuna tıklayabilirsiniz.", 27, 313, 145, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;Ders Programını Görüntüleme Sayfası Arayüzü
#Region ### START Koda GUI section ###
Global $dersProgGosterFormGUI = GUICreate("Haftalık Ders Programı | LLReminder", 1121, 627, -1, -1)
GUISetBkColor(0x1B262C)
Global $programiGosterDosyapzt = FileRead(@ScriptDir & "\core\veriler\PAZARTESI.ini")
Global $programiGosterDosyasali = FileRead(@ScriptDir & "\core\veriler\SALI.ini")
Global $programiGosterDosyacars = FileRead(@ScriptDir & "\core\veriler\CARSAMBA.ini")
Global $programiGosterDosyapers = FileRead(@ScriptDir & "\core\veriler\PERSEMBE.ini")
Global $programiGosterDosyacuma = FileRead(@ScriptDir & "\core\veriler\CUMA.ini")
Global $programiGosterDosyacmt = FileRead(@ScriptDir & "\core\veriler\CUMARTESI.ini")
Global $programiGosterDosyapzr = FileRead(@ScriptDir & "\core\veriler\PAZAR.ini")
GUICtrlCreateLabel("Haftalık Ders Programı", 409, 8, 301, 37)
GUICtrlSetFont(-1, 20, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $programiGosterpzt = GUICtrlCreateEdit($programiGosterDosyapzt, 40, 95, 140, 500, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
Global $programiGostersali = GUICtrlCreateEdit($programiGosterDosyasali, 190, 95, 140, 500, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
Global $programiGostercars = GUICtrlCreateEdit($programiGosterDosyacars, 340, 95, 140, 500, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
Global $programiGosterpers = GUICtrlCreateEdit($programiGosterDosyapers, 490, 95, 140, 500, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
Global $programiGostercuma = GUICtrlCreateEdit($programiGosterDosyacuma, 640, 95, 140, 500, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
Global $programiGostercmt = GUICtrlCreateEdit($programiGosterDosyacmt, 790, 95, 140, 500, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
Global $programiGosterpzr = GUICtrlCreateEdit($programiGosterDosyapzr, 940, 95, 140, 500, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("PAZARTESİ", 64, 65, 93, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("SALI", 245, 65, 39, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("ÇARŞAMBA", 360, 65, 95, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bugün Günlerden:", 848, 9, 136, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 990, 10, 115, 24)
GUICtrlSetData(-1, $day)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("PERŞEMBE", 514, 65, 91, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("CUMA", 674, 65, 53, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("CUMARTESİ", 806, 65, 99, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("PAZAR", 976, 65, 58, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;Ders Programını Düzenlemek için Gün Seçiminin Yapıldığı Sayfanın Arayüzü
#Region ### START Koda GUI section ###
Global $dersProgDuzenleFormGUI = GUICreate("Gün Seçin - LLReminder", 436, 396, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("Ders Programını Düzenlemek için Gün Seçin", 26, 16, 386, 28)
GUICtrlSetFont(-1, 14, 800, 0, "Trenda Black")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $dpduzpztsi = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\pazartesi.jpg", 125, 62, 185, 38)
GUICtrlSetCursor (-1, 0)
Global $dpduzsali = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\sali.jpg", 125, 106, 185, 38)
GUICtrlSetCursor (-1, 0)
Global $dpduzcrsmb = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\carsamba.jpg", 125, 150, 185, 38)
GUICtrlSetCursor (-1, 0)
Global $dpduzprsmb = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\persembe.jpg", 125, 194, 185, 38)
GUICtrlSetCursor (-1, 0)
Global $dpduzcuma = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\cuma.jpg", 125, 238, 185, 38)
GUICtrlSetCursor (-1, 0)
Global $dpduzcmrts = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\cumartesi.jpg", 125, 282, 185, 38)
GUICtrlSetCursor (-1, 0)
Global $dpduzpzr = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\pazar.jpg", 125, 326, 185, 38)
GUICtrlSetCursor (-1, 0)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;DERS PROGRAMINI DÜZENLE PAZARTESİ GUI
#Region ### START Koda GUI section ###
Global $dersProgDuzenlePZTFormGUI = GUICreate("Ders Programını Düzenle | LLReminder", 617, 425, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 32, 96, 313, 161)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Saati", 58, 136, 85, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateLabel("Ders Adı", 199, 136, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
$saatSecPazartesi = GUICtrlCreateDate("", 56, 168, 122, 45, $DTS_TIMEFORMAT)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Local $sStyle = "HH:mm:00"
GUICtrlSendMsg($saatSecPazartesi, $DTM_SETFORMATW, 0, $sStyle)
$dersSecPazartesi = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersiProgramaEklePazartesiButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 264, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Programını Düzenle - Pazartesi", 128, 16, 352, 30)
GUICtrlSetFont(-1, 16, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersprogamipzt = FileRead(@ScriptDir & "\core\veriler\PAZARTESI.ini")
Global $dersProgramiPazartesiMevcutDersler = GUICtrlCreateEdit($filedersprogamipzt, 365, 120, 217, 281, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 11, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan ders programını düzenleyebilirsiniz.", 158, 44, 294, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders saati kısmında dersin başlangıç saatini yazmanız yeterlidir.", 108, 61, 391, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders programından bir dersi kaldırmak istiyorsanız;", 27, 320, 313, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("boş seçeneği işaretleyip kaydet butonuna tıklayın.", 27, 352, 305, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 385, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("dersin saatini yazıp ders adı kısmında en üstteki", 27, 336, 293, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;DERS PROGRAMINI DÜZENLE SALI GUI
#Region ### START Koda GUI section ###
Global $dersProgDuzenleSALIFormGUI = GUICreate("Ders Programını Düzenle | LLReminder", 617, 425, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 32, 96, 313, 161)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Saati", 58, 136, 85, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateLabel("Ders Adı", 199, 136, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
$saatSecSali = GUICtrlCreateDate("", 56, 168, 122, 45, $DTS_TIMEFORMAT)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Local $sStyle = "HH:mm:00"
GUICtrlSendMsg($saatSecSali, $DTM_SETFORMATW, 0, $sStyle)
$dersSecSali = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersiProgramaEkleSaliButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 264, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Programını Düzenle - Salı", 145, 16, 352, 30)
GUICtrlSetFont(-1, 16, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersprogamisali = FileRead(@ScriptDir & "\core\veriler\SALI.ini")
Global $dersProgramiSaliMevcutDersler = GUICtrlCreateEdit($filedersprogamisali, 365, 120, 217, 281, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 11, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan ders programını düzenleyebilirsiniz.", 158, 44, 294, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders saati kısmında dersin başlangıç saatini yazmanız yeterlidir.", 108, 61, 391, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders programından bir dersi kaldırmak istiyorsanız;", 27, 320, 313, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("boş seçeneği işaretleyip kaydet butonuna tıklayın.", 27, 352, 305, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 385, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("dersin saatini yazıp ders adı kısmında en üstteki", 27, 336, 293, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;DERS PROGRAMINI DÜZENLE ÇARŞAMBA GUI
#Region ### START Koda GUI section ###
Global $dersProgDuzenleCARSFormGUI = GUICreate("Ders Programını Düzenle | LLReminder", 617, 425, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 32, 96, 313, 161)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Saati", 58, 136, 85, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateLabel("Ders Adı", 199, 136, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
$saatSecCarsamba = GUICtrlCreateDate("", 56, 168, 122, 45, $DTS_TIMEFORMAT)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Local $sStyle = "HH:mm:00"
GUICtrlSendMsg($saatSecCarsamba, $DTM_SETFORMATW, 0, $sStyle)
$dersSecCarsamba = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersiProgramaEkleCarsButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 264, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Programını Düzenle - Çarşamba", 128, 16, 363, 30)
GUICtrlSetFont(-1, 16, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersprogamicars = FileRead(@ScriptDir & "\core\veriler\CARSAMBA.ini")
Global $dersProgramiCarsMevcutDersler = GUICtrlCreateEdit($filedersprogamicars, 365, 120, 217, 281, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 11, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan ders programını düzenleyebilirsiniz.", 158, 44, 294, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders saati kısmında dersin başlangıç saatini yazmanız yeterlidir.", 108, 61, 391, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders programından bir dersi kaldırmak istiyorsanız;", 27, 320, 313, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("boş seçeneği işaretleyip kaydet butonuna tıklayın.", 27, 352, 305, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 385, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("dersin saatini yazıp ders adı kısmında en üstteki", 27, 336, 293, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;DERS PROGRAMINI DÜZENLE PERŞEMBE GUI
#Region ### START Koda GUI section ###
Global $dersProgDuzenlePERSFormGUI = GUICreate("Ders Programını Düzenle | LLReminder", 617, 425, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 32, 96, 313, 161)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Saati", 58, 136, 85, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateLabel("Ders Adı", 199, 136, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
$saatSecPersembe = GUICtrlCreateDate("", 56, 168, 122, 45, $DTS_TIMEFORMAT)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Local $sStyle = "HH:mm:00"
GUICtrlSendMsg($saatSecPersembe, $DTM_SETFORMATW, 0, $sStyle)
$dersSecPersembe = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersiProgramaEklePersembeButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 264, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Programını Düzenle - Perşembe", 128, 16, 363, 30)
GUICtrlSetFont(-1, 16, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersprogamiprsmbe = FileRead(@ScriptDir & "\core\veriler\PERSEMBE.ini")
Global $dersProgramiPersembeMevcutDersler = GUICtrlCreateEdit($filedersprogamiprsmbe, 365, 120, 217, 281, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 11, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan ders programını düzenleyebilirsiniz.", 158, 44, 294, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders saati kısmında dersin başlangıç saatini yazmanız yeterlidir.", 108, 61, 391, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders programından bir dersi kaldırmak istiyorsanız;", 27, 320, 313, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("boş seçeneği işaretleyip kaydet butonuna tıklayın.", 27, 352, 305, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 385, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("dersin saatini yazıp ders adı kısmında en üstteki", 27, 336, 293, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;DERS PROGRAMINI DÜZENLE CUMA GUI
#Region ### START Koda GUI section ###
Global $dersProgDuzenleCUMAFormGUI = GUICreate("Ders Programını Düzenle | LLReminder", 617, 425, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 32, 96, 313, 161)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Saati", 58, 136, 85, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateLabel("Ders Adı", 199, 136, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
$saatSecCuma = GUICtrlCreateDate("", 56, 168, 122, 45, $DTS_TIMEFORMAT)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Local $sStyle = "HH:mm:00"
GUICtrlSendMsg($saatSecCuma, $DTM_SETFORMATW, 0, $sStyle)
$dersSecCuma = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersiProgramaEkleCumaButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 264, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Programını Düzenle - Cuma", 145, 16, 352, 30)
GUICtrlSetFont(-1, 16, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersprogamicma = FileRead(@ScriptDir & "\core\veriler\CUMA.ini")
Global $dersProgramiCumaMevcutDersler = GUICtrlCreateEdit($filedersprogamicma, 365, 120, 217, 281, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 11, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan ders programını düzenleyebilirsiniz.", 158, 44, 294, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders saati kısmında dersin başlangıç saatini yazmanız yeterlidir.", 108, 61, 391, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders programından bir dersi kaldırmak istiyorsanız;", 27, 320, 313, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("boş seçeneği işaretleyip kaydet butonuna tıklayın.", 27, 352, 305, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 385, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("dersin saatini yazıp ders adı kısmında en üstteki", 27, 336, 293, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;DERS PROGRAMINI DÜZENLE CUMARTESİ GUI
#Region ### START Koda GUI section ###
Global $dersProgDuzenleCUMARTESIFormGUI = GUICreate("Ders Programını Düzenle | LLReminder", 617, 425, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 32, 96, 313, 161)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Saati", 58, 136, 85, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateLabel("Ders Adı", 199, 136, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
$saatSecCumartesi = GUICtrlCreateDate("", 56, 168, 122, 45, $DTS_TIMEFORMAT)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Local $sStyle = "HH:mm:00"
GUICtrlSendMsg($saatSecCumartesi, $DTM_SETFORMATW, 0, $sStyle)
$dersSecCumartesi = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersiProgramaEkleCumartesiButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 264, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Programını Düzenle - Cumartesi", 128, 16, 362, 30)
GUICtrlSetFont(-1, 16, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersprogamicmrts = FileRead(@ScriptDir & "\core\veriler\CUMARTESI.ini")
Global $dersProgramiCumartesiMevcutDersler = GUICtrlCreateEdit($filedersprogamicmrts, 365, 120, 217, 281, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 11, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan ders programını düzenleyebilirsiniz.", 158, 44, 294, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders saati kısmında dersin başlangıç saatini yazmanız yeterlidir.", 108, 61, 391, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders programından bir dersi kaldırmak istiyorsanız;", 27, 320, 313, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("boş seçeneği işaretleyip kaydet butonuna tıklayın.", 27, 352, 305, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 385, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("dersin saatini yazıp ders adı kısmında en üstteki", 27, 336, 293, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;DERS PROGRAMINI DÜZENLE PAZAR GUI
#Region ### START Koda GUI section ###
Global $dersProgDuzenlePAZARFormGUI = GUICreate("Ders Programını Düzenle | LLReminder", 617, 425, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateGroup("", 32, 96, 313, 161)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders Saati", 58, 136, 85, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateLabel("Ders Adı", 199, 136, 70, 24)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
$saatSecPazar = GUICtrlCreateDate("", 56, 168, 122, 45, $DTS_TIMEFORMAT)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
Local $sStyle = "HH:mm:00"
GUICtrlSendMsg($saatSecPazar, $DTM_SETFORMATW, 0, $sStyle)
$dersSecPazar = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $dersiProgramaEklePazarButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydet.jpg", 98, 264, 160, 35)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateLabel("Ders Programını Düzenle - Pazar", 145, 16, 352, 30)
GUICtrlSetFont(-1, 16, 400, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $filedersprogamipzr = FileRead(@ScriptDir & "\core\veriler\PAZAR.ini")
Global $dersProgramiPazarMevcutDersler = GUICtrlCreateEdit($filedersprogamipzr, 365, 120, 217, 281, BitOR($ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 11, 400, 0, "Trenda Black")
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateLabel("Kayıtlı Dersler", 413, 92, 112, 24)
GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Bu sayfadan ders programını düzenleyebilirsiniz.", 158, 44, 294, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders saati kısmında dersin başlangıç saatini yazmanız yeterlidir.", 108, 61, 391, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Ders programından bir dersi kaldırmak istiyorsanız;", 27, 320, 313, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("", 27, 368, 4, 4)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("boş seçeneği işaretleyip kaydet butonuna tıklayın.", 27, 352, 305, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Anasayfaya geri dönmek için kapat butonuna tıklayın.", 27, 385, 298, 18)
GUICtrlSetFont(-1, 9, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("dersin saatini yazıp ders adı kısmında en üstteki", 27, 336, 293, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda Semibold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;Program Ayarları Sayfası Arayüzü
#Region ### START Koda GUI section ###
Global $programAyarlariFormGUI = GUICreate("Ayarlar - LLReminder", 477, 300, -1, -1)
GUISetFont(8, 400, 0, "Trenda")
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("Yazılım Ayarları", 169, 16, 142, 27)
GUICtrlSetFont(-1, 14, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Başlangıçta Otomatik Başlatma:", 56, 60, 246, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $baslangictaOtomatikCalistirButon = GUICtrlCreateCheckbox("", 32, 63, 17, 17)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlCreateLabel("Bu özelliği açtığınızda bilgisayarınız açıldığı zaman LLReminder", 32, 88, 380, 19)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("otomatik olarak çalışmaya başlar. Böylelikle sadece 'Programı", 32, 103, 408, 19)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Çalıştır' butoununa basarak derslere otomatik girebilirsiniz.", 32, 118, 406, 19)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder'a yeni özellikler kazandırmak ve daha fazla", 66, 196, 334, 19)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("ayar seçeneği oluşturmak için çalışmaya devam ediyoruz.", 63, 210, 344, 19)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("LLReminder için bir öneriniz mi var?", 127, 235, 216, 19)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("İletişim: info@LLReminder.online", 133, 251, 200, 19)
GUICtrlSetFont(-1, 10, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("...", 222, 148, 16, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;Program Hakkında Sayfası Arayüzü
#Region ### START Koda GUI section ###
$programHakkindaFormGUI = GUICreate("Hakkında - LLReminder", 451, 510, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreatePic(@ScriptDir & "\core\gorseller\logoSmall.jpg", 100, 8, 250, 64)
GUICtrlCreateLabel("LLReminder - Live Lesson Reminder (Öğrenci Ver. 1.0)", 96, 80, 269, 17)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("© Copyright 2020 | ahmetemindilben.com.tr", 120, 96, 221, 17)
GUICtrlSetFont(-1, 8, 400, 0, "Trenda")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Web Sitesi: LLReminder.online", 112, 120, 227, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $sozlesme = FileRead(@ScriptDir & "\core\LisansSozlesmesi.txt")
Global $sozlesmeEkrani = GUICtrlCreateEdit("", 40, 176, 377, 305, BitOR($ES_CENTER, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetData($sozlesmeEkrani, $sozlesme)
GUICtrlCreateLabel("İletişim: info@LLReminder.online", 101, 141, 247, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

;Lisans Kontrolü Sayfası Arayüzü
#Region ### START Koda GUI section ###
Global $LisansKontrolFormGUI = GUICreate("Lisans Kontrolü - LLReminder", 401, 326, -1, -1)
GUISetBkColor(0x1B262C)
GUICtrlCreateLabel("LLReminder Lisans Durumunuz", 56, 8, 295, 28)
GUICtrlSetFont(-1, 15, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Mevcut Aktivasyon Kodunuz:", 95, 49, 209, 22)
GUICtrlSetFont(-1, 11, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlCreateLabel("Cihaz Kimliğiniz:", 140, 112, 118, 22)
GUICtrlSetFont(-1, 11, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
$lisansKimligiKontrolSayfasi = GUICtrlCreateEdit("", 55, 136, 297, 17, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_WANTRETURN, $ES_CENTER))
GUICtrlSetData(-1, machineID())
GUICtrlCreateLabel("Yeni Aktivasyon Kodu Ekleme:", 92, 175, 215, 22)
GUICtrlSetFont(-1, 11, 800, 0, "Trenda Bold")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $lisansEkle = GUICtrlCreateInput("", 48, 198, 233, 21)
$mevcutLisansiGoster = GUICtrlCreateEdit("", 55, 78, 297, 17, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_WANTRETURN))
GUICtrlSetData(-1, getlicense())
$lisansSayfasiKaydetButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\kaydetSmall.jpg", 288, 198, 73, 22)
GUICtrlSetCursor (-1, 0)
$lisansSatinAlButon = GUICtrlCreatePic(@ScriptDir & "\core\gorseller\lisansSatinAl.jpg", 66, 248, 268, 52)
GUICtrlSetCursor (-1, 0)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

While 1
	$aMsg = GUIGetMsg(1)
	Switch $aMsg[1]
		Case $anaSayfaFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					Exit
				Case $onlineDestekButon
					ShellExecute("https://llreminder.online/destek/")
				Case $anaSayfadersEkleGUIButonu
					GUICtrlSetImage($anaSayfadersEkleGUIButonu, @ScriptDir & "\core\gorseller\buton1D.jpg")
					Sleep(110)
					GUICtrlSetImage($anaSayfadersEkleGUIButonu, @ScriptDir & "\core\gorseller\buton1.jpg")
					If ProcessExists("LLReminderDersHatirlatici.exe") Then
						MsgBox(16,"LLReminder Çalışıyor!","Yeni ders eklemek, ders silmek veya ders programını düzenlemek için önce LLReminder'i 'Programı Durdur' butonunu kullanarak durdurun.")
					Else
						GUISetState(@SW_HIDE, $anaSayfaFormGUI)
						GUISetState(@SW_SHOW, $dersEkleFormGUI)
						$filedersekle = FileRead(@ScriptDir & "\core\veriler\dersler.ini")
						GUICtrlSetData($dersEkleMevcutDersler, $filedersekle)
					EndIf
				Case $anaSayfadersSilGUIButonu
					GUICtrlSetImage($anaSayfadersSilGUIButonu, @ScriptDir & "\core\gorseller\buton2D.jpg")
					Sleep(110)
					GUICtrlSetImage($anaSayfadersSilGUIButonu, @ScriptDir & "\core\gorseller\buton2.jpg")
					If ProcessExists("LLReminderDersHatirlatici.exe") Then
						MsgBox(16,"LLReminder Çalışıyor!","Yeni ders eklemek, ders silmek veya ders programını düzenlemek için önce LLReminder'i 'Programı Durdur' butonunu kullanarak durdurun.")
					Else
						GUISetState(@SW_HIDE, $anaSayfaFormGUI)
						GUISetState(@SW_SHOW, $dersSilFormGUI)
						$filedersSil = FileRead(@ScriptDir & "\core\veriler\dersler.ini")
						GUICtrlSetData($dersSilMevcutDersler, $filedersSil)
						GUICtrlSetData($dersSilDersAdi, "")
						Global $filedersSilini = @ScriptDir & "\core\veriler\dersler.ini"
						Global $sectionsDersSil = IniReadSectionNames($filedersSilini)
						If (Not @Error) Then GUICtrlSetData($dersSilDersAdi, _ArraytoString($sectionsDersSil, "|", 1), $sectionsDersSil[1])
					EndIf
				Case $anaSayfadersProgGosterGUIButonu
					GUICtrlSetImage($anaSayfadersProgGosterGUIButonu, @ScriptDir & "\core\gorseller\buton4D.jpg")
					Sleep(110)
					GUICtrlSetImage($anaSayfadersProgGosterGUIButonu, @ScriptDir & "\core\gorseller\buton4.jpg")
					GUISetState(@SW_HIDE, $anaSayfaFormGUI)
					GUISetState(@SW_SHOW, $dersProgGosterFormGUI)
					dersProgGosterimi()
				Case $anaSayfadersProgDuzenleGUIButonu
					GUICtrlSetImage($anaSayfadersProgDuzenleGUIButonu, @ScriptDir & "\core\gorseller\buton3D.jpg")
					Sleep(110)
					GUICtrlSetImage($anaSayfadersProgDuzenleGUIButonu, @ScriptDir & "\core\gorseller\buton3.jpg")
					If ProcessExists("LLReminderDersHatirlatici.exe") Then
						MsgBox(16,"LLReminder Çalışıyor!","Yeni ders eklemek veya ders programını düzenlemek için önce LLReminder'i 'Programı Durdur' butonunu kullanarak durdurun.")
					Else
						GUISetState(@SW_HIDE, $anaSayfaFormGUI)
						GUISetState(@SW_SHOW, $dersProgDuzenleFormGUI)
					EndIf
				Case $anaSayfaBaslatGUIButonu
					programiBaslat()
				Case $anaSfUstMenuDersleriSil
					tumDersleriSil()
				Case $anaSfUstMenuDProgramiSil
					dersPrograminiSil()
				Case $anaSfUstMenuYazilimAyar
					GUISetState(@SW_HIDE, $anaSayfaFormGUI)
					GUISetState(@SW_SHOW, $programAyarlariFormGUI)
				Case $anaSfUstMenuGuncelKontrol
					guncellemeKontrol()
				Case $anaSfUstMenuHakkinda
					GUISetState(@SW_HIDE, $anaSayfaFormGUI)
					GUISetState(@SW_SHOW, $programHakkindaFormGUI)
				Case $anaSfUstMenuLisansKontrolu
					GUISetState(@SW_HIDE, $anaSayfaFormGUI)
					GUISetState(@SW_SHOW, $LisansKontrolFormGUI)
				Case $anaSfUstMenukullanimKilavuz
					kilavuzuAc()
				Case $anaSfUstMenuOnlineDestek
					GUICtrlSetImage($anaSfUstMenuOnlineDestek, @ScriptDir & "\core\gorseller\onlineDestekD.jpg")
					Sleep(110)
					GUICtrlSetImage($anaSfUstMenuOnlineDestek, @ScriptDir & "\core\gorseller\onlineDestek.jpg")
					Sleep(50)
					ShellExecute("https://llreminder.online/destek/")
			EndSwitch
		Case $dersEkleFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersEkleFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersEkleButon
					GUICtrlSetImage($dersEkleButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersEkleButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersEkle()
					GUICtrlSetData($dersEkleDersAdi, "")
					GUICtrlSetData($dersEkleZoomID, "")
					GUICtrlSetData($dersEkleZoomPass, "")
					GUICtrlSetData($dersEkleZoomURL, "")
			EndSwitch
		Case $dersSilFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersSilFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersSilButon
					GUICtrlSetImage($dersSilButon, @ScriptDir & "\core\gorseller\silD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersSilButon, @ScriptDir & "\core\gorseller\sil.jpg")
					dersSil()
			EndSwitch
		Case $dersProgGosterFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgGosterFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
			EndSwitch
		Case $dersProgDuzenleFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dpduzpztsi
					GUICtrlSetImage($dpduzpztsi, @ScriptDir & "\core\gorseller\pazartesiD.jpg")
					Sleep(110)
					GUICtrlSetImage($dpduzpztsi, @ScriptDir & "\core\gorseller\pazartesi.jpg")
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $dersProgDuzenlePZTFormGUI)
					GUICtrlDelete($dersSecPazartesi)
					$dersSecPazartesi = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
					Global $pztDersProgramiDerslerDosyasi = @ScriptDir & "\core\veriler\dersler.ini"
					Global $pztDersEkleDerslerDosyasiBasliklar = IniReadSectionNames($pztDersProgramiDerslerDosyasi)
					If (Not @Error) Then GUICtrlSetData($dersSecPazartesi, _ArrayToString($pztDersEkleDerslerDosyasiBasliklar, "|", 1))
				Case $dpduzsali
					GUICtrlSetImage($dpduzsali, @ScriptDir & "\core\gorseller\saliD.jpg")
					Sleep(110)
					GUICtrlSetImage($dpduzsali, @ScriptDir & "\core\gorseller\sali.jpg")
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $dersProgDuzenleSALIFormGUI)
					GUICtrlDelete($dersSecSali)
					$dersSecSali = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
					Global $saliDersProgramiDerslerDosyasi = @ScriptDir & "\core\veriler\dersler.ini"
					Global $saliDersEkleDerslerDosyasiBasliklar = IniReadSectionNames($saliDersProgramiDerslerDosyasi)
					If (Not @Error) Then GUICtrlSetData($dersSecSali, _ArrayToString($saliDersEkleDerslerDosyasiBasliklar, "|", 1))
				Case $dpduzcrsmb
					GUICtrlSetImage($dpduzcrsmb, @ScriptDir & "\core\gorseller\carsambaD.jpg")
					Sleep(110)
					GUICtrlSetImage($dpduzcrsmb, @ScriptDir & "\core\gorseller\carsamba.jpg")
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $dersProgDuzenleCARSFormGUI)
					GUICtrlDelete($dersSecCarsamba)
					$dersSecCarsamba = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
					Global $carsDersProgramiDerslerDosyasi = @ScriptDir & "\core\veriler\dersler.ini"
					Global $carsDersEkleDerslerDosyasiBasliklar = IniReadSectionNames($carsDersProgramiDerslerDosyasi)
					If (Not @Error) Then GUICtrlSetData($dersSecCarsamba, _ArrayToString($carsDersEkleDerslerDosyasiBasliklar, "|", 1))
				Case $dpduzprsmb
					GUICtrlSetImage($dpduzprsmb, @ScriptDir & "\core\gorseller\persembeD.jpg")
					Sleep(110)
					GUICtrlSetImage($dpduzprsmb, @ScriptDir & "\core\gorseller\persembe.jpg")
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $dersProgDuzenlePERSFormGUI)
					GUICtrlDelete($dersSecPersembe)
					$dersSecPersembe = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
					Global $persDersProgramiDerslerDosyasi = @ScriptDir & "\core\veriler\dersler.ini"
					Global $persDersEkleDerslerDosyasiBasliklar = IniReadSectionNames($persDersProgramiDerslerDosyasi)
					If (Not @Error) Then GUICtrlSetData($dersSecPersembe, _ArrayToString($persDersEkleDerslerDosyasiBasliklar, "|", 1))
				Case $dpduzcuma
					GUICtrlSetImage($dpduzcuma, @ScriptDir & "\core\gorseller\cumaD.jpg")
					Sleep(110)
					GUICtrlSetImage($dpduzcuma, @ScriptDir & "\core\gorseller\cuma.jpg")
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $dersProgDuzenleCUMAFormGUI)
					GUICtrlDelete($dersSecCuma)
					$dersSecCuma = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
					Global $cumaDersProgramiDerslerDosyasi = @ScriptDir & "\core\veriler\dersler.ini"
					Global $cumaDersEkleDerslerDosyasiBasliklar = IniReadSectionNames($cumaDersProgramiDerslerDosyasi)
					If (Not @Error) Then GUICtrlSetData($dersSecCuma, _ArrayToString($cumaDersEkleDerslerDosyasiBasliklar, "|", 1))
				Case $dpduzcmrts
					GUICtrlSetImage($dpduzcmrts, @ScriptDir & "\core\gorseller\cumartesiD.jpg")
					Sleep(110)
					GUICtrlSetImage($dpduzcmrts, @ScriptDir & "\core\gorseller\cumartesi.jpg")
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $dersProgDuzenleCUMARTESIFormGUI)
					GUICtrlDelete($dersSecCumartesi)
					$dersSecCumartesi = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
					Global $cmrtsDersProgramiDerslerDosyasi = @ScriptDir & "\core\veriler\dersler.ini"
					Global $cmrtsDersEkleDerslerDosyasiBasliklar = IniReadSectionNames($cmrtsDersProgramiDerslerDosyasi)
					If (Not @Error) Then GUICtrlSetData($dersSecCumartesi, _ArrayToString($cmrtsDersEkleDerslerDosyasiBasliklar, "|", 1))
				Case $dpduzpzr
					GUICtrlSetImage($dpduzpzr, @ScriptDir & "\core\gorseller\pazarD.jpg")
					Sleep(110)
					GUICtrlSetImage($dpduzpzr, @ScriptDir & "\core\gorseller\pazar.jpg")
					GUISetState(@SW_HIDE, $dersProgDuzenleFormGUI)
					GUISetState(@SW_SHOW, $dersProgDuzenlePAZARFormGUI)
					GUICtrlDelete($dersSecPazar)
					$dersSecPazar = GUICtrlCreateCombo(" ", 200, 176, 129, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					GUICtrlSetFont(-1, 13, 400, 0, "Trenda Semibold")
					Global $pzrDersProgramiDerslerDosyasi = @ScriptDir & "\core\veriler\dersler.ini"
					Global $pzrDersEkleDerslerDosyasiBasliklar = IniReadSectionNames($pzrDersProgramiDerslerDosyasi)
					If (Not @Error) Then GUICtrlSetData($dersSecPazar, _ArrayToString($pzrDersEkleDerslerDosyasiBasliklar, "|", 1))
			EndSwitch
		Case $dersProgDuzenlePZTFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenlePZTFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersiProgramaEklePazartesiButon
					GUICtrlSetImage($dersiProgramaEklePazartesiButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersiProgramaEklePazartesiButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersiProgramaEklePazartesi()
			EndSwitch
		Case $dersProgDuzenleSALIFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenleSALIFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersiProgramaEkleSaliButon
					GUICtrlSetImage($dersiProgramaEkleSaliButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersiProgramaEkleSaliButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersiProgramaEkleSali()
			EndSwitch
		Case $dersProgDuzenleCARSFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenleCARSFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersiProgramaEkleCarsButon
					GUICtrlSetImage($dersiProgramaEkleCarsButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersiProgramaEkleCarsButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersiProgramaEkleCars()
			EndSwitch
		Case $dersProgDuzenlePERSFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenlePERSFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersiProgramaEklePersembeButon
					GUICtrlSetImage($dersiProgramaEklePersembeButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersiProgramaEklePersembeButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersiProgramaEklePersembe()
			EndSwitch
		Case $dersProgDuzenleCUMAFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenleCUMAFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersiProgramaEkleCumaButon
					GUICtrlSetImage($dersiProgramaEkleCumaButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersiProgramaEkleCumaButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersiProgramaEkleCuma()
			EndSwitch
		Case $dersProgDuzenleCUMARTESIFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenleCUMARTESIFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersiProgramaEkleCumartesiButon
					GUICtrlSetImage($dersiProgramaEkleCumartesiButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersiProgramaEkleCumartesiButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersiProgramaEkleCumartesi()
			EndSwitch
		Case $dersProgDuzenlePAZARFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $dersProgDuzenlePAZARFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $dersiProgramaEklePazarButon
					GUICtrlSetImage($dersiProgramaEklePazarButon, @ScriptDir & "\core\gorseller\kaydetD.jpg")
					Sleep(110)
					GUICtrlSetImage($dersiProgramaEklePazarButon, @ScriptDir & "\core\gorseller\kaydet.jpg")
					dersiProgramaEklePazar()
			EndSwitch
		Case $programAyarlariFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $programAyarlariFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $baslangictaOtomatikCalistirButon
					If (GUICtrlRead($baslangictaOtomatikCalistirButon) == 1) Then
						baslangictaCalistir()
					Else
						baslangictaCalistirmayiKapa()
					EndIf
			EndSwitch
		Case $programHakkindaFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $programHakkindaFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
			EndSwitch
		Case $LisansKontrolFormGUI
			Switch $aMsg[0]
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE, $LisansKontrolFormGUI)
					GUISetState(@SW_SHOW, $anaSayfaFormGUI)
				Case $lisansSatinAlButon
					GUICtrlSetImage($lisansSatinAlButon, @ScriptDir & "\core\gorseller\lisansSatinAlD.jpg")
					Sleep(110)
					GUICtrlSetImage($lisansSatinAlButon, @ScriptDir & "\core\gorseller\lisansSatinAl.jpg")
					ShellExecute("https://llreminder.online/satin-al")
				Case $lisansSayfasiKaydetButon
					GUICtrlSetImage($lisansSayfasiKaydetButon, @ScriptDir & "\core\gorseller\kaydetSmallD.jpg")
					Sleep(110)
					GUICtrlSetImage($lisansSayfasiKaydetButon, @ScriptDir & "\core\gorseller\kaydetSmall.jpg")
					$serial = GUICtrlRead($lisansEkle)
					$status = register_serial($serial)
					If $status Then
						$data = serial_validate($serial)
						_TaskDialog(0, 0, $appname & " Aktivasyonu", $appname & " başarıyla aktive edildi.", "Teşekkürler ! LLReminder'i tekrardan kullanmaya devam edebilirsiniz.", 1, 65528)
						$isok = True
					Else
						_TaskDialog(0, 0, $appname & " Aktivasyonu", "Geçersiz Lisans", "Geçerli bir lisans anahtarı girdiğinize emin olun !", 1, 65530)
					EndIf

			EndSwitch
	EndSwitch
WEnd

;-----> FONSİYONLAR KISMI <-----;

Func dersEkle()
	Global $dersEkleDersAdiGirilenhamveri = GUICtrlRead($dersEkleDersAdi)
	Global $dersEkleDersAdiGirilen = StringUpper($dersEkleDersAdiGirilenhamveri)
	$duzelt2 = StringReplace($dersEkleDersAdiGirilenhamveri, "Ç", "C")
	$duzelt3 = StringReplace($duzelt2, "Ğ", "G")
	$duzelt4 = StringReplace($duzelt3, "İ", "I")
	$duzelt5 = StringReplace($duzelt4, "Ö", "O")
	$duzelt6 = StringReplace($duzelt5, "Ş", "S")
	$duzelt7 = StringReplace($duzelt6, "Ü", "U")
	$duzelt8 = StringReplace($duzelt7, "ı", "I")
	$duzelt9 = StringReplace($duzelt8, "i", "I")
	$duzelt10 = StringReplace($duzelt9, "[", "")
	$duzelt11 = StringReplace($duzelt10, "]", "")
	$sonDersEkleAdi = StringUpper($duzelt11)
	Global $dersEkleDersTuruGirilen = GUICtrlRead($dersEkleDersTuruSecin)
	Global $dersEkleZoomIDGirilen = GUICtrlRead($dersEkleZoomID)
	Local $dersEkleZoomIDGirilenBosluksuz = StringStripWS($dersEkleZoomIDGirilen, $STR_STRIPALL)
	Global $dersEkleZoomPassGirilen = GUICtrlRead($dersEkleZoomPass)
	Global $dersEkleZoomLinkGirilen = GUICtrlRead($dersEkleZoomURL)
	IniWrite(@ScriptDir & "\core\veriler\dersler.ini", $sonDersEkleAdi, "TUR", $dersEkleDersTuruGirilen)
	IniWrite(@ScriptDir & "\core\veriler\dersler.ini", $sonDersEkleAdi, "ID", $dersEkleZoomIDGirilenBosluksuz)
	IniWrite(@ScriptDir & "\core\veriler\dersler.ini", $sonDersEkleAdi, "PASS", $dersEkleZoomPassGirilen)
	IniWrite(@ScriptDir & "\core\veriler\dersler.ini", $sonDersEkleAdi, "URL", $dersEkleZoomLinkGirilen)
	IniWrite(@ScriptDir & "\core\veriler\dersler.ini", $sonDersEkleAdi, "-----------------", "------------------")
	$filedersekle = FileRead(@ScriptDir & "\core\veriler\dersler.ini")
	GUICtrlSetData($dersEkleMevcutDersler, $filedersekle)
EndFunc   ;==>dersEkle

Func dersSil()
	Global $dersSilDersAdiGirilenhamveri = GUICtrlRead($dersSilDersAdi)
	Global $dersSilDersAdiGirilen = StringUpper($dersSilDersAdiGirilenhamveri)
	$duzelt12 = StringReplace($dersSilDersAdiGirilen, "Ç", "C")
	$duzelt13 = StringReplace($duzelt12, "Ğ", "G")
	$duzelt14 = StringReplace($duzelt13, "İ", "I")
	$duzelt15 = StringReplace($duzelt14, "Ö", "O")
	$duzelt16 = StringReplace($duzelt15, "Ş", "S")
	$duzelt17 = StringReplace($duzelt16, "Ü", "U")
	$duzelt18 = StringReplace($duzelt17, "ı", "I")
	$duzelt19 = StringReplace($duzelt18, "i", "I")
	$duzelt20 = StringReplace($duzelt19, "[", "")
	$duzelt21 = StringReplace($duzelt20, "]", "")
	$sonDersSilAdi = StringUpper($duzelt21)
	IniRenameSection(@ScriptDir & "\core\veriler\dersler.ini", $sonDersSilAdi, "x", $FC_OVERWRITE)
	Sleep(100)
	IniDelete(@ScriptDir & "\core\veriler\dersler.ini", "x")
	$filedersSil = FileRead(@ScriptDir & "\core\veriler\dersler.ini")
	GUICtrlSetData($dersSilMevcutDersler, $filedersSil)
	GUICtrlSetData($dersSilDersAdi, "")
	Global $filedersSilini = @ScriptDir & "\core\veriler\dersler.ini"
	Global $sectionsDersSil = IniReadSectionNames($filedersSilini)
	If (Not @Error) Then GUICtrlSetData($dersSilDersAdi, _ArraytoString($sectionsDersSil, "|", 1), $sectionsDersSil[1])
EndFunc   ;==>dersSil

Func dersProgGosterimi()
	Global $programiGosterDosyapzt = FileRead(@ScriptDir & "\core\veriler\PAZARTESI.ini")
	Global $programiGosterDosyasali = FileRead(@ScriptDir & "\core\veriler\SALI.ini")
	Global $programiGosterDosyacars = FileRead(@ScriptDir & "\core\veriler\CARSAMBA.ini")
	Global $programiGosterDosyapers = FileRead(@ScriptDir & "\core\veriler\PERSEMBE.ini")
	Global $programiGosterDosyacuma = FileRead(@ScriptDir & "\core\veriler\CUMA.ini")
	Global $programiGosterDosyacmt = FileRead(@ScriptDir & "\core\veriler\CUMARTESI.ini")
	Global $programiGosterDosyapzr = FileRead(@ScriptDir & "\core\veriler\PAZAR.ini")
	GUICtrlSetData($programiGosterpzt, $programiGosterDosyapzt)
	GUICtrlSetData($programiGostersali, $programiGosterDosyasali)
	GUICtrlSetData($programiGostercars, $programiGosterDosyacars)
	GUICtrlSetData($programiGosterpers, $programiGosterDosyapers)
	GUICtrlSetData($programiGostercuma, $programiGosterDosyacuma)
	GUICtrlSetData($programiGostercmt, $programiGosterDosyacmt)
	GUICtrlSetData($programiGosterpzr, $programiGosterDosyapzr)
EndFunc   ;==>dersProgGosterimi

Func SortNow($ini)
	If FileExists($ini & ".tmp") Then FileDelete($ini & ".tmp")
	$aSArray = IniReadSectionNames($ini)
	For $x = 1 To UBound($aSArray) - 1
		$String = ""
		$avArray = IniReadSection($ini, $aSArray[$x])
		For $i = 1 To UBound($avArray) - 1
			$String = $String & $avArray[$i][0] & "=" & $avArray[$i][1] & Chr(01)
		Next

		$aString = StringSplit($String, Chr(01))

		_ArraySort($aString, 0, 1)

		$File = FileOpen($ini & ".tmp", 1)

		FileWriteLine($File, "[" & $aSArray[$x] & "]")
		For $i = 1 To UBound($aString) - 1
			FileWriteLine($File, $aString[$i])
		Next
		FileWriteLine($File, @CRLF & @CRLF)

		FileClose($File)
	Next
	Sleep(1000)
	FileMove($ini, StringTrimRight($ini, 4) & "Backup" & @MDAY & @MON & @YEAR & "_" & @HOUR & @MIN & ".ini")
	FileMove($ini & ".tmp", $ini)
	FileDelete(StringTrimRight($ini, 4) & "Backup" & @MDAY & @MON & @YEAR & "_" & @HOUR & @MIN & ".ini")
EndFunc   ;==>SortNow

Func dersiProgramaEklePazartesi()
	Global $saatSecPazartesiGirilen = GUICtrlRead($saatSecPazartesi)
	Global $dersSecPazartesiGirilen = GUICtrlRead($dersSecPazartesi)
	IniWrite(@ScriptDir & "\core\veriler\PAZARTESI.ini", "PAZARTESI", $saatSecPazartesiGirilen, $dersSecPazartesiGirilen)
	$txt = StringRegExpReplace(FileRead(@ScriptDir & "\core\veriler\PAZARTESI.ini"), '(?m)^[^=]+=\h*$\R?', "")
	$ini = @ScriptDir & "\core\veriler\PAZARTESI.ini"
	$File = FileOpen($ini, 2)
	FileClose($ini)
	FileWrite($ini, $txt)
	_FileWriteToLine($ini, 1, "[PAZARTESI]" & @CRLF, 1)
	$filedersprogamipzt = FileRead($ini)
	GUICtrlSetData($dersProgramiPazartesiMevcutDersler, $filedersprogamipzt)
	SortNow($ini)
EndFunc   ;==>dersiProgramaEklePazartesi

Func dersiProgramaEkleSali()
	Global $saatSecSaliGirilen = GUICtrlRead($saatSecSali)
	Global $dersSecSaliGirilen = GUICtrlRead($dersSecSali)
	IniWrite(@ScriptDir & "\core\veriler\SALI.ini", "SALI", $saatSecSaliGirilen, $dersSecSaliGirilen)
	$txt = StringRegExpReplace(FileRead(@ScriptDir & "\core\veriler\SALI.ini"), '(?m)^[^=]+=\h*$\R?', "")
	$ini = @ScriptDir & "\core\veriler\SALI.ini"
	$File = FileOpen($ini, 2)
	FileClose($ini)
	FileWrite($ini, $txt)
	_FileWriteToLine($ini, 1, "[SALI]" & @CRLF, 1)
	$filedersprogamisali = FileRead($ini)
	GUICtrlSetData($dersProgramiSaliMevcutDersler, $filedersprogamisali)
	SortNow($ini)
EndFunc   ;==>dersiProgramaEkleSali

Func dersiProgramaEkleCars()
	Global $saatSecCarsGirilen = GUICtrlRead($saatSecCarsamba)
	Global $dersSecCarsGirilen = GUICtrlRead($dersSecCarsamba)
	IniWrite(@ScriptDir & "\core\veriler\CARSAMBA.ini", "CARSAMBA", $saatSecCarsGirilen, $dersSecCarsGirilen)
	$txt = StringRegExpReplace(FileRead(@ScriptDir & "\core\veriler\CARSAMBA.ini"), '(?m)^[^=]+=\h*$\R?', "")
	$ini = @ScriptDir & "\core\veriler\CARSAMBA.ini"
	$File = FileOpen($ini, 2)
	FileClose($ini)
	FileWrite($ini, $txt)
	_FileWriteToLine($ini, 1, "[CARSAMBA]" & @CRLF, 1)
	$filedersprogamicars = FileRead($ini)
	GUICtrlSetData($dersProgramiCarsMevcutDersler, $filedersprogamicars)
	SortNow($ini)
EndFunc   ;==>dersiProgramaEkleCars

Func dersiProgramaEklePersembe()
	Global $saatSecPersembeGirilen = GUICtrlRead($saatSecPersembe)
	Global $dersSecPersembeGirilen = GUICtrlRead($dersSecPersembe)
	IniWrite(@ScriptDir & "\core\veriler\PERSEMBE.ini", "PERSEMBE", $saatSecPersembeGirilen, $dersSecPersembeGirilen)
	$txt = StringRegExpReplace(FileRead(@ScriptDir & "\core\veriler\PERSEMBE.ini"), '(?m)^[^=]+=\h*$\R?', "")
	$ini = @ScriptDir & "\core\veriler\PERSEMBE.ini"
	$File = FileOpen($ini, 2)
	FileClose($ini)
	FileWrite($ini, $txt)
	_FileWriteToLine($ini, 1, "[PERSEMBE]" & @CRLF, 1)
	$filedersprogamiprsmbe = FileRead($ini)
	GUICtrlSetData($dersProgramiPersembeMevcutDersler, $filedersprogamiprsmbe)
	SortNow($ini)
EndFunc   ;==>dersiProgramaEklePersembe

Func dersiProgramaEkleCuma()
	Global $saatSecCumaGirilen = GUICtrlRead($saatSecCuma)
	Global $dersSecCumaGirilen = GUICtrlRead($dersSecCuma)
	IniWrite(@ScriptDir & "\core\veriler\CUMA.ini", "CUMA", $saatSecCumaGirilen, $dersSecCumaGirilen)
	$txt = StringRegExpReplace(FileRead(@ScriptDir & "\core\veriler\CUMA.ini"), '(?m)^[^=]+=\h*$\R?', "")
	$ini = @ScriptDir & "\core\veriler\CUMA.ini"
	$File = FileOpen($ini, 2)
	FileClose($ini)
	FileWrite($ini, $txt)
	_FileWriteToLine($ini, 1, "[CUMA]" & @CRLF, 1)
	$filedersprogamicma = FileRead($ini)
	GUICtrlSetData($dersProgramiCumaMevcutDersler, $filedersprogamicma)
	SortNow($ini)
EndFunc   ;==>dersiProgramaEkleCuma

Func dersiProgramaEkleCumartesi()
	Global $saatSecCumartesiGirilen = GUICtrlRead($saatSecCumartesi)
	Global $dersSecCumartesiGirilen = GUICtrlRead($dersSecCumartesi)
	IniWrite(@ScriptDir & "\core\veriler\CUMARTESI.ini", "CUMARTESI", $saatSecCumartesiGirilen, $dersSecCumartesiGirilen)
	$txt = StringRegExpReplace(FileRead(@ScriptDir & "\core\veriler\CUMARTESI.ini"), '(?m)^[^=]+=\h*$\R?', "")
	$ini = @ScriptDir & "\core\veriler\CUMARTESI.ini"
	$File = FileOpen($ini, 2)
	FileClose($ini)
	FileWrite($ini, $txt)
	_FileWriteToLine($ini, 1, "[CUMARTESI]" & @CRLF, 1)
	$filedersprogamicmrts = FileRead($ini)
	GUICtrlSetData($dersProgramiCumartesiMevcutDersler, $filedersprogamicmrts)
	SortNow($ini)
EndFunc   ;==>dersiProgramaEkleCumartesi

Func dersiProgramaEklePazar()
	Global $saatSecPazarGirilen = GUICtrlRead($saatSecPazar)
	Global $dersSecPazarGirilen = GUICtrlRead($dersSecPazar)
	IniWrite(@ScriptDir & "\core\veriler\PAZAR.ini", "PAZAR", $saatSecPazarGirilen, $dersSecPazarGirilen)
	$txt = StringRegExpReplace(FileRead(@ScriptDir & "\core\veriler\PAZAR.ini"), '(?m)^[^=]+=\h*$\R?', "")
	$ini = @ScriptDir & "\core\veriler\PAZAR.ini"
	$File = FileOpen($ini, 2)
	FileClose($ini)
	FileWrite($ini, $txt)
	_FileWriteToLine($ini, 1, "[PAZAR]" & @CRLF, 1)
	$filedersprogamipzr = FileRead($ini)
	GUICtrlSetData($dersProgramiPazarMevcutDersler, $filedersprogamipzr)
	SortNow($ini)
EndFunc   ;==>dersiProgramaEklePazar

Func tumDersleriSil()
	#Region --- CodeWizard generated code Start ---
	;MsgBox features: Title=Yes, Text=Yes, Buttons=Yes and No, Icon=Question, Timeout=10 ss
	If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
	$iMsgBoxAnswer = MsgBox(52, "Dikkat: Tüm Dersler Silinecektir.", "Sistem üzerindeki bütün dersleri ve zoom giriş bilgilerini silmek istediğinize emin misiniz?", 20)
	Select
		Case $iMsgBoxAnswer = 6
			FileDelete(@ScriptDir & "\core\veriler\dersler.ini")
			MsgBox($MB_ICONINFORMATION, "Dersler Silindi", "Programdaki bütün ders kayıtları silinmiştir.")
		Case $iMsgBoxAnswer = 7
			MsgBox($MB_ICONERROR, "Dersler Silinmedi", "İptal tuşuna bastığınız için dersler silinmedi.")
		Case $iMsgBoxAnswer = -1
			MsgBox($MB_ICONERROR, "Onay işlemi zaman aşımına uğradı", "20 saniye boyunca herhangi bir seçim yapmadığınız için onay işlemi zaman aşımına uğradı. Dersler silinmedi.")
	EndSelect
	#EndRegion --- CodeWizard generated code Start ---
EndFunc   ;==>tumDersleriSil

Func dersPrograminiSil()
	If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
	$iMsgBoxAnswer = MsgBox(52, "Dikkat: Tüm Ders Programı Silinecektir", "Sistem üzerindeki tüm ders programını silmek istediğinize emin misiniz? Dersler silinmeyecek ancak ders takvimi tamamen silinecektir.", 20)
	Select
		Case $iMsgBoxAnswer = 6
			FileDelete(@ScriptDir & "\core\veriler\PAZARTESI.ini")
			FileDelete(@ScriptDir & "\core\veriler\SALI.ini")
			FileDelete(@ScriptDir & "\core\veriler\CARSAMBA.ini")
			FileDelete(@ScriptDir & "\core\veriler\PERSEMBE.ini")
			FileDelete(@ScriptDir & "\core\veriler\CUMA.ini")
			FileDelete(@ScriptDir & "\core\veriler\CUMARTESI.ini")
			FileDelete(@ScriptDir & "\core\veriler\PAZAR.ini")
			FileWrite(@ScriptDir & "\core\veriler\PAZARTESI.ini", "")
			FileWrite(@ScriptDir & "\core\veriler\SALI.ini", "")
			FileWrite(@ScriptDir & "\core\veriler\CARSAMBA.ini", "")
			FileWrite(@ScriptDir & "\core\veriler\PERSEMBE.ini", "")
			FileWrite(@ScriptDir & "\core\veriler\CUMA.ini", "")
			FileWrite(@ScriptDir & "\core\veriler\CUMARTESI.ini", "")
			FileWrite(@ScriptDir & "\core\veriler\PAZAR.ini", "")
			MsgBox($MB_ICONINFORMATION, "Ders Programı Silindi", "Programdaki bütün ders programı kayıtları silinmiştir.")
		Case $iMsgBoxAnswer = 7
			MsgBox($MB_ICONERROR, "Ders Programı Silinmedi", "İptal tuşuna bastığınız için ders programı silinmedi.")
		Case $iMsgBoxAnswer = -1
			MsgBox($MB_ICONERROR, "Onay işlemi zaman aşımına uğradı", "20 saniye boyunca herhangi bir seçim yapmadığınız için onay işlemi zaman aşımına uğradı. Ders programı silinmedi.")
	EndSelect
EndFunc   ;==>dersPrograminiSil

Func guncellemeKontrol()
	$programSurumu = RegRead("HKEY_CURRENT_USER\Software\livelessonreminder\LLReminder", "VER")
	InetGet("https://llreminder.online/surumKontrol.txt", @TempDir&"\LLReminderTemp\check_update.txt", 1)
	$guncellemefile = FileOpen(@TempDir&"\LLReminderTemp\check_update.txt", 0)
	Local $guncellemeline = FileReadLine($guncellemefile)
	FileClose($guncellemefile)
	FileDelete(@TempDir&"\LLReminderTemp\check_update.txt")
	If $guncellemeline = $programSurumu Then
		MsgBox($MB_ICONERROR, "Güncelleme Yok", "Henüz bir güncelleme yok! Lütfen daha sonra tekrar deneyin.", 10)
	Else
		$guncellemeVarMesaji = MsgBox(68, "Yeni Güncelleme Yayınlanmış", "Yeni bir güncellenme yayınlanmış! En kısa sürede yüklemenizi tavsiye ederiz. Yüklemek istiyor musunuz?", 20)
		Select
			Case $guncellemeVarMesaji = 6
				ShellExecute("https://llreminder.online/guncelleme/")
			Case $guncellemeVarMesaji = 7
				MsgBox($MB_ICONERROR, "Güncelleme İptal Edildi", "İptal tuşuna bastığınız için güncelleme gerçekleştirilmedi.")
		EndSelect
	EndIf
EndFunc   ;==>guncellemeKontrol

Func baslangictaCalistir()
	_StartupFolder_Install()
	MsgBox(64, "Ayar Kayıt Edildi", "Ayar kayıt edildi. Artık bilgisayarınızı açtığınız zaman LLReminder otomatik olarak çalışmaya başlayacak.")
EndFunc   ;==>baslangictaCalistir

Func baslangictaCalistirmayiKapa()
	_StartupFolder_Uninstall()
EndFunc   ;==>baslangictaCalistirmayiKapa

Func programiBaslat()
	If ProcessExists("LLReminderDersHatirlatici.exe") Then
		ProcessClose("LLReminderDersHatirlatici.exe")
		TrayTip("", "", 0)
		TrayTip("LLReminder Durduruldu!", "Dersleriniz otomatik olarak açılmayacak.", 7, 3)
		Sleep(10)
		GUICtrlSetImage($anaSayfaBaslatGUIButonu, @ScriptDir & "\core\gorseller\calistir.jpg")
		_GUICtrlStatusBar_SetText($altCubuk, "Program bekleme modunda. Başlatmak için dersleri ayarladıktan sonra başlat butonuna tıklayın. | LLReminder.online")
	Else
		Run(@ScriptDir & "\core\LLReminderDersHatirlatici.exe")
		TrayTip("", "", 0)
		Sleep(490)
		If ProcessExists("LLReminderDersHatirlatici.exe") Then TrayTip("LLReminder Programı Başlatıldı!", "Dersleriniz otomatik olarak açılacak. Eğer ders programını değiştirecekseniz lütfen önce programı durdurun.", 7, 1)
		If ProcessExists("LLReminderDersHatirlatici.exe") Then GUICtrlSetImage($anaSayfaBaslatGUIButonu, @ScriptDir & "\core\gorseller\durdur.jpg")
		If ProcessExists("LLReminderDersHatirlatici.exe") Then _GUICtrlStatusBar_SetText($altCubuk, "Program arka planda çalışıyor. Bu pencereyi kapatabilir, programı durdurmak isterseniz tekrar açabilirsiniz.")
		If Not ProcessExists("LLReminderDersHatirlatici.exe") Then MsgBox(16, "Ders Yok", "Ders programını ayarlayıp tekrardan programı çalıştırın.")
	EndIf
EndFunc   ;==>programiBaslat

Func kilavuzuAc()
	ShellExecute(@ScriptDir & "\core\LLReminderHizliBaslangicRehberi.pdf")
EndFunc   ;==>kilavuzuAc