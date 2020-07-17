
;--------------------------------
;Include Modern UI

!include "MUI2.nsh"

!define SC_MAJORVER "3.9"
!define SC_MINORVER "0"
!define SC_VERSION "${SC_MAJORVER}.${SC_MINORVER}"
!define SCRIPT_VERSION "v2.5.0"
!define TM_VERSION "3.0.18.328"

;--------------------------------
;General
Name "Warthog Script Installer ${SCRIPT_VERSION} for StarCitizen ${SC_VERSION}"
OutFile "warthog-script-${SCRIPT_VERSION}-sc${SC_VERSION}-installer.exe"

;Default installation folder
InstallDir "E:\Cloud Imperium Games\Star Citizen\warthog-script-${SCRIPT_VERSION}-sc${SC_VERSION}"

;Request application privileges for Windows Vista
RequestExecutionLevel user

;--------------------------------
;Languages

;!insertmacro MUI_LANGUAGE "English"

;--------------------------------
;defines MUST come before pages to apply to them (in hindsight: duh!)

!define MUI_PAGE_HEADER_TEXT "aboutflash:"
!define MUI_PAGE_HEADER_SUBTEXT "WarthogScript Installer for StarCitizen ${SC_VERSION}"

!define MUI_DIRECTORYPAGE_TEXT_TOP "Choose the Cloud Imperium Games installation folder"
!define MUI_DIRECTORYPAGE_TEXT_DESTINATION "MUI_DIRECTORYPAGE_TEXT_DESTINATION"
!define MUI_DIRECTORYPAGE_VARIABLE $INSTDIR

!define MUI_INSTFILESPAGE_FINISHHEADER_TEXT "Everything is done."
!define MUI_INSTFILESPAGE_FINISHHEADER_SUBTEXT "Now run the TARGET profile and load the keybindings in StarCitizen."
!define MUI_INSTFILESPAGE_ABORTHEADER_TEXT "Installation aborted."
!define MUI_INSTFILESPAGE_ABORTHEADER_SUBTEXT ""

!define MUI_FINISHPAGE_TITLE "Installation"
!define MUI_FINISHPAGE_TEXT "Monkey Time!"
!define MUI_FINISHPAGE_BUTTON "Booyah."
!define MUI_FINISHPAGE_CANCEL_ENABLED
;!define MUI_FINISHPAGE_TEXT_REBOOT "MUI_FINISHPAGE_TEXT_REBOOT"
;!define MUI_FINISHPAGE_TEXT_REBOOTNOW "MUI_FINISHPAGE_TEXT_REBOOTNOW"
;!define MUI_FINISHPAGE_TEXT_REBOOTLATER "MUI_FINISHPAGE_TEXT_REBOOTLATER"
;!define MUI_FINISHPAGE_TEXT_REBOOTLATER_DEFAULT

;!define MUI_FINISHPAGE_RUN "some_exe_file"
;!define MUI_FINISHPAGE_RUN_TEXT "MUI_FINISHPAGE_RUN_TEXT"
;Parameters for the application to run. Don't forget to escape double quotes in the value (use $\").
;!define MUI_FINISHPAGE_RUN_PARAMETERS
;!define MUI_FINISHPAGE_RUN_NOTCHECKED
;!define MUI_FINISHPAGE_RUN_FUNCTION

;!define MUI_FINISHPAGE_SHOWREADME "somefile.txt"
;Don't make this label too long or it'll cut on top and bottom.
;!define MUI_FINISHPAGE_SHOWREADME_TEXT "This would open a README if there was one."
;!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
;MUI_FINISHPAGE_SHOWREADME_FUNCTION Function

;!define MUI_FINISHPAGE_LINK "This goes to reddit just because."
;!define MUI_FINISHPAGE_LINK_LOCATION "http://www.reddit.com/"
;!define MUI_FINISHPAGE_LINK_COLOR RRGGBB

!define MUI_FINISHPAGE_NOREBOOTSUPPORT

;!define MUI_UNCONFIRMPAGE_TEXT_TOP "MUI_UNCONFIRMPAGE_TEXT_TOP"
;!define MUI_UNCONFIRMPAGE_TEXT_LOCATION "MUI_UNCONFIRMPAGE_TEXT_LOCATION"

;hide descriptions on hover
;!define MUI_COMPONENTSPAGE_NODESC

;--------------------------------
;Pages

;!insertmacro MUI_PAGE_WELCOME
;!insertmacro MUI_PAGE_LICENSE "C:\Users\Oscillot\Desktop\License.txt"
;!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

;!insertmacro MUI_UNPAGE_WELCOME
;!insertmacro MUI_UNPAGE_CONFIRM
;!insertmacro MUI_UNPAGE_INSTFILES
;!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections
Section ""
	ClearErrors
	ReadRegStr $0 HKLM "SOFTWARE\WOW6432Node\Thrustmaster\Thrustmaster TARGET" "NUL:"
	${If} ${Errors}
		MessageBox MB_OK "Value not found"
	${Else}
	${IF} $0 == ""
				MESSAGEBOX MB_OK "NUL exists and it's empty"
			${ELSE}
				;WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Ports" "NUL:" ""
			${ENDIF}
	${EndIf}

	DetailPrint "Test 1 succeeded (output: $INSTDIR)"
SectionEnd

Section "Shortcut" 2
	SetOutPath "$INSTDIR\warthog\"

	;--------------------------------
	; Files
	File /r "..\script"
	File /r "..\sc-settings"
	File "..\README.md"

	createShortCut "$DESKTOP\Warthog_profile-StarCitizen-${SC_VERSION}.lnk" "C:\Program Files (x86)\Thrustmaster\TARGET\x64\TARGETGUI.exe" "-r $\"E:\Games\Cloud Imperium Games\Script\StarCitizen-WarthogScript\script\StarCitizen_${SC_MAJORVER}.x_combined.tmc$\""
SectionEnd

#LangString MUI_TEXT_DIRECTORY_TITLE ${LANG_ENGLISH} "Star Citizen Verzeichnis"


; HKEY_LOCAL_MACHINE\SOFTWARE\Thrustmaster\HotasWT
; HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Thrustmaster\Thrustmaster TARGET
; HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Thrustmaster\Thrustmaster TARGET\$TM_VERSION