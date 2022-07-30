; MEDIA PLAYER CONTROL KEYS
;===============================================================================
; AutoHotkey Media Keys
^!Space::Send       {Media_Play_Pause}
^!Left::Send        {Media_Prev}
^!Right::Send       {Media_Next}
^!NumpadMult::Send  {Volume_Mute}
^!NumpadAdd::Send   {Volume_Up}
^!NumpadSub::Send   {Volume_Down}

; STAY ON TOP TOGGLE
;===============================================================================
; Press Ctrl+Shift+Space to set any currently active window to be always on top.
; Press Ctrl+Shift+Space again set the window to no longer be always on top.
; Source: https://www.howtogeek.com/196958/the-3-best-ways-to-make-a-window-always-on-top-on-windows
^+SPACE::
	WinGetTitle, activeWindow, A
	if IsWindowAlwaysOnTop(activeWindow) {
		notificationMessage := "The window """ . activeWindow . """ is now always on top."
		notificationIcon := 16 + 1 ; No notification sound (16) + Info icon (1)
	}
	else {
		notificationMessage := "The window """ . activeWindow . """ is no longer always on top."
		notificationIcon := 16 + 2 ; No notification sound (16) + Warning icon (2)
	}
	Winset, Alwaysontop, , A
	TrayTip, Always-on-top, %notificationMessage%, , %notificationIcon% 
	Sleep 3000 ; Let it display for 3 seconds.
	HideTrayTip()

	IsWindowAlwaysOnTop(windowTitle) {
		WinGet, windowStyle, ExStyle, %windowTitle%
		isWindowAlwaysOnTop := if (windowStyle & 0x8) ? false : true ; 0x8 is WS_EX_TOPMOST.
		return isWindowAlwaysOnTop
	}

	HideTrayTip() {
		TrayTip  ; Attempt to hide it the normal way.
		if SubStr(A_OSVersion,1,3) = "10." {
			Menu Tray, NoIcon
			Sleep 200  ; It may be necessary to adjust this sleep.
			Menu Tray, Icon
		}
	}

^+F1::
	Click,3435,720
	Sleep, 500
	Click,3200,820
	Sleep, 500
	Click,3200,820
	Sleep, 500
	Click,3030,720

^+F2::
	Click,3435,720
	Sleep, 500
	Click,3200,820
	Sleep, 500
	Click,3200,900
	Sleep, 500
	Click,3030,720

Return