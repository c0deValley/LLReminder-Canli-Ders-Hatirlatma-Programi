#include-once
#include <Crypt.au3>
#include <String.au3>
#include <Date.au3>
#include "Includes\TaskDialog.au3"
#include <Crypt.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>


Global $appName = "LLReminder"
Global $companyName = "livelessonreminder"
Global $myURL="https://LLReminder.online/satin-al/"
Global $almost_ending = True

Func setinfo($status)
	Global $almost_ending = $status
EndFunc

Func license_warning()
	Enum $ID_BTN1 = 1001, $ID_BTN2, $ID_BTN3
	Dim $pnButton, $pnRadioButton, $pfVerificationFlagChecked
	Dim $Buttons[3][2] = [[$ID_BTN1, ""&$appname&" Lisansı Satın Al" & @LF & " Satın alma rehberine yönlendirileceksiniz"], _
			[$ID_BTN2, "Lisans Anahtarı Girin" & @LF & " Satın almış olduğunuz lisans anahtarını girin"], _
			[$ID_BTN3, "LLReminder'ı Kapat" & @LF & " Programı kullanamayacaksınız"]]
	$ret = _TaskDialogIndirectParams($pnButton, $pnRadioButton, $pfVerificationFlagChecked, 0, 0, $TDF_USE_COMMAND_LINKS, 0, $appname, 65529, _
			"Lisans Süreniz Doldu!", "LLReminder lisansınızın süresi doldu."&@CRLF&"Lütfen programı kullanmaya devam edebilmek için aşağıdaki seçeneklerden birini seçin : ", _
			$Buttons, $ID_BTN1)
	Switch $pnButton
		Case 1001
			#Region ### START Koda GUI section ###
				GUICreate("LLReminder Lisansı Satın Alma", 607, 515, -1, -1)
				GUISetBkColor(0x1B262C)
				GUICtrlCreateLabel("LLReminder Lisansı Satın Alma", 138, 16, 330, 31)
				GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("LLReminder lisansı yıllık olarak satılmaktadır ve LLReminder.online web", 70, 58, 466, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("sitesi üzerinden farklı ödeme seçeneklerini kullanarak edinilebilir.", 90, 76, 425, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("Bunun için ilk olarak aşağıdaki cihaz kimliğinizi kopyalayın. Aktivasyon kodu", 57, 106, 492, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("bu cihaz kimliği ile sadece sizin bilgisayarınızda geçerli olacak şekilde hazırlanacaktır.", 24, 125, 558, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("Kimliği kopyaladıktan sonra aşağıdaki butona basarak satın alma sayfasına", 62, 208, 481, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("ulaşabilir ve istediğiniz ödeme yöntemini seçebilirsiniz.", 124, 227, 357, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("LLReminder lisansını satın aldıktan sonra satın alma sayfasında belirtilen e-posta", 44, 314, 518, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("en geç 12 saat içerisinde tarafınıza iletilecektir.", 151, 349, 304, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("LLReminder lisansı satın almak için mevcut ödeme yöntemleri:", 124, 389, 358, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("- Bitcoin, Bitcoin Cash, Ethereum, Litecoin ve Coinbase tarafından desteklenen", 80, 448, 445, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("diğer kripto para seçenekleri.", 217, 464, 171, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("- Ön ödemeli kartlar üzerinden para transferi", 175, 412, 256, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("- Havale veya EFT", 252, 430, 101, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				$bilgisayarIDbilgi = machineID()
				$bilgisayarID = GUICtrlCreateEdit("", 83, 160, 440, 25, BitOR($ES_CENTER,$ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_BORDER))
				GUICtrlSetData(-1, $bilgisayarIDbilgi)
				$siteyeGitButon = GUICtrlCreateButton("Web Sitesine Git", 177, 256, 251, 33)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlSetBkColor(-1, 0x0F4C75)
				GUICtrlCreateLabel("adresine cihaz kimliğinizi atmanız gerekmektedir. Aktivasyon kodunuz ", 75, 331, 456, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUISetState(@SW_SHOW)
				#EndRegion ### END Koda GUI section ###

			While 1
				$nMsg = GUIGetMsg()
				Switch $nMsg
					Case $GUI_EVENT_CLOSE
						Exit
					Case $siteyeGitButon
						ShellExecute($myURL)
				EndSwitch
			WEnd
		Case 1002
			$isok=False
			Do
			$serial = InputBox($appName, "Size e-posta yolu ile iletilmiş olan LLReminder Lisans Anahtarınızı girin:")
			If @error then
				Exit
			EndIf
			$status = register_serial($serial)
			If $status Then
				$data = serial_validate($serial)
				_TaskDialog(0, 0, $appname&" Aktivasyonu", $appname&" başarıyla aktive edildi.", "Teşekkürler ! LLReminder'i tekrardan kullanmaya devam edebilirsiniz.", 1, 65528)
				$isok=true
			Else
				_TaskDialog(0, 0, $appname&" Aktivasyonu", "Geçersiz Lisans", "Geçerli bir lisans anahtarı girdiğinize emin olun !", 1, 65530)
			EndIf
			until $isok=true
		Case 1003
			Exit
	EndSwitch
EndFunc

Func license_registered()
	$serial = getlicense()
	If Not $serial Then Return False
	$info = serial_validate($serial)
	If IsBool($info) Then Return False
	$date_valid = StringSplit($info[2], "/")

	If $almost_ending Then
		$dias = Abs(_DateDiff('D', $date_valid[1] & "/" & $date_valid[2] & "/" & $date_valid[3], _NowCalcDate()))
		If $dias > 3 Then Return True
		Enum $ID_BTN1 = 1001, $ID_BTN2, $ID_BTN3
		Dim $pnButton, $pnRadioButton, $pfVerificationFlagChecked
		Dim $Buttons[3][2] = [[$ID_BTN1, "Lisansı Satın Al" & @LF & " Satın alma rehberine yönlendirileceksiniz"], _
			[$ID_BTN2, "Lisans Anahtarı Girin" & @LF & " Satın almış olduğunuz lisans anahtarını girin"], _
			[$ID_BTN3, "Programı Kullanmaya Devam Et" & @LF & " LLReminder'ı aç"]]
		$registernow = _TaskDialogIndirectParams($pnButton, $pnRadioButton, $pfVerificationFlagChecked, 0, 0, $TDF_USE_COMMAND_LINKS, 0, $appname, 65530, _
			"Lisans Süreniz Bitmek Üzere !", "Lisansınız için kalan gün sayısı : "&$dias&" gün"&@CRLF&"Devam edebilmek için aşağıdakilerden birini seçin : ", _
			$Buttons, $ID_BTN1)
		Switch $pnButton
			Case 1001
				#Region ### START Koda GUI section ###
				GUICreate("LLReminder Lisansı Satın Alma", 607, 515, -1, -1)
				GUISetBkColor(0x1B262C)
				GUICtrlCreateLabel("LLReminder Lisansı Satın Alma", 138, 16, 330, 31)
				GUICtrlSetFont(-1, 14, 800, 0, "Arial Black")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("LLReminder lisansı yıllık olarak satılmaktadır ve LLReminder.online web", 70, 58, 466, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("sitesi üzerinden farklı ödeme seçeneklerini kullanarak edinilebilir.", 90, 76, 425, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("Bunun için ilk olarak aşağıdaki cihaz kimliğinizi kopyalayın. Aktivasyon kodu", 57, 106, 492, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("bu cihaz kimliği ile sadece sizin bilgisayarınızda geçerli olacak şekilde hazırlanacaktır.", 24, 125, 558, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("Kimliği kopyaladıktan sonra aşağıdaki butona basarak satın alma sayfasına", 62, 208, 481, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("ulaşabilir ve istediğiniz ödeme yöntemini seçebilirsiniz.", 124, 227, 357, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("LLReminder lisansını satın aldıktan sonra satın alma sayfasında belirtilen e-posta", 44, 314, 518, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("en geç 12 saat içerisinde tarafınıza iletilecektir.", 151, 349, 304, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("LLReminder lisansı satın almak için mevcut ödeme yöntemleri:", 124, 389, 358, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("- Bitcoin, Bitcoin Cash, Ethereum, Litecoin ve Coinbase tarafından desteklenen", 80, 448, 445, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("diğer kripto para seçenekleri.", 217, 464, 171, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("- Ön ödemeli kartlar üzerinden para transferi", 175, 412, 256, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlCreateLabel("- Havale veya EFT", 252, 430, 101, 19)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				$bilgisayarIDbilgi = machineID()
				$bilgisayarID = GUICtrlCreateEdit("", 83, 160, 440, 25, BitOR($ES_CENTER,$ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_BORDER))
				GUICtrlSetData(-1, $bilgisayarIDbilgi)
				$siteyeGitButon = GUICtrlCreateButton("Web Sitesine Git", 177, 256, 251, 33)
				GUICtrlSetFont(-1, 9, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUICtrlSetBkColor(-1, 0x0F4C75)
				GUICtrlCreateLabel("adresine cihaz kimliğinizi atmanız gerekmektedir. Aktivasyon kodunuz ", 75, 331, 456, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "Arial")
				GUICtrlSetColor(-1, 0xFFFFFF)
				GUISetState(@SW_SHOW)
				#EndRegion ### END Koda GUI section ###

				While 1
					$nMsg = GUIGetMsg()
					Switch $nMsg
						Case $GUI_EVENT_CLOSE
							Exit
						Case $siteyeGitButon
							ShellExecute($myURL)
					EndSwitch
				WEnd
			Case 1002
				$isok=False
				Do
					$serial = InputBox($appName, "Lisans anahtarınızı girin:")
					If @error then
						ExitLoop
					EndIf
						$status = register_serial($serial)
					If $status Then
						$data = serial_validate($serial)
						_TaskDialog(0, 0, $appname&" Aktivasyonu", $appname&" başarıyla aktive edildi.", "Teşekkürler ! LLReminder'i tekrardan kullanmaya devam edebilirsiniz.", 1, 65528)
						$isok=true
					Else
						_TaskDialog(0, 0, $appname&" Aktivasyonu", "Geçersiz Lisans", "Geçerli bir lisans anahtarı girdiğinize emin olun !", 1, 65530)
					EndIf
				Until $isok=true
		EndSwitch
	EndIf
	Return True
EndFunc

Func register_serial($serial)
	$info = serial_validate($serial)
	If IsBool($info) Then Return False

	RegDelete("HKEY_CURRENT_USER\Software\"&$companyName&"\"&$appName, "KEY")
	RegWrite("HKEY_CURRENT_USER\Software\"&$companyName&"\"&$appName, "KEY", "REG_SZ", $serial)
	Return True
EndFunc

Func serial_validate($serial)
	If @OSArch='x86' Then
		$reg='HKEY_LOCAL_MACHINE'
	Else
		$reg='HKEY_LOCAL_MACHINE64'
	EndIf
	$id=RegRead($reg & '\SOFTWARE\Microsoft\Cryptography', 'MachineGuid')
	$id=StringTrimLeft(StringTrimRight($id, 1), 1)
	$decrypted=BinaryToString(_Crypt_DecryptData($serial, $id, $CALG_AES_192))
	$decrypted = StringSplit($decrypted, "\")
	If UBound($decrypted) <> 3 Then Return False
	If $decrypted[1] <> machineID() Then Return False
	$until = StringSplit($decrypted[2], "/")
	If UBound($until) <> 4 Then Return False
	$until = _DateToDayValue($until[1], $until[2], $until[3])
	$now = _DateToDayValue(@YEAR, @MON, @MDAY)
	If $now > $until Then Return False
	Dim $retorno[3]
	$retorno[1] = $decrypted[1]
	$retorno[2] = $decrypted[2]
	Return $retorno
EndFunc

Func machineID()
	If @OSArch='x86' Then
		$reg='HKEY_LOCAL_MACHINE'
	Else
		$reg='HKEY_LOCAL_MACHINE64'
	EndIf
	$id=RegRead($reg & '\SOFTWARE\Microsoft\Cryptography', 'MachineGuid')
	Return StringTrimLeft(StringTrimRight($id, 1), 1)
EndFunc

Func getlicense()
	Return RegRead("HKEY_CURRENT_USER\Software\"&$companyName&"\"&$appName, "KEY")
EndFunc

