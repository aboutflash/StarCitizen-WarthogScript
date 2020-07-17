!include "MUI2.nsh"

!define SC_MAJORVER "3.9"
!define SC_MINORVER "0"
!define SC_VERSION "${SC_MAJORVER}.${SC_MINORVER}"
!define SCRIPT_VERSION "v2.5.0"
!define TM_VERSION "3.0.18.328"

Name "Fourth Installer"
!define INSTALLATIONNAME "MyFourthInstaller"
OutFile "fourthinstaller.exe"
InstallDir $PROGRAMFILES\${INSTALLATIONNAME}

RequestExecutionLevel user

Page components
Page directory
Page instfiles
;UninstPage uninstConfirm
;UninstPage instfiles

;default section
Section
  SetOutPath $INSTDIR
SectionEnd

;Section "Start Menu Shortcuts"
;  CreateDirectory "$SMPROGRAMS\${INSTALLATIONNAME}"
;  CreateShortCut "$SMPROGRAMS\${INSTALLATIONNAME}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
;  CreateShortCut "$SMPROGRAMS\${INSTALLATIONNAME}\notepad.lnk" "$INSTDIR\notepad.exe" "" "$INSTDIR\notepad.exe" 0
;SectionEnd

;Section "Uninstall"
;  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLATIONNAME}"
;  Delete $INSTDIR\uninstall.exe
;  Delete $INSTDIR\notepad.exe
;  RMDir $INSTDIR
;  Delete "$SMPROGRAMS\${INSTALLATIONNAME}\*.*"
;  RMDir "$SMPROGRAMS\${INSTALLATIONNAME}"
;SectionEnd

Section
    
SectionEnd

Section "Create Shortcut" 1
	SetOutPath "$INSTDIR\warthog\"

	;--------------------------------
	; Files
	File /r "..\script"
	File /r "..\sc-settings"
	File "..\README.md"

	createShortCut "$DESKTOP\Warthog_profile-StarCitizen-${SC_VERSION}.lnk" "C:\Program Files (x86)\Thrustmaster\TARGET\x64\TARGETGUI.exe" "-r $\"E:\Games\Cloud Imperium Games\Script\StarCitizen-WarthogScript\script\StarCitizen_${SC_MAJORVER}.x_combined.tmc$\""
SectionEnd

Section "Create other Shortcut" 2
SectionEnd

Section /o "Show message" 3
    MessageBox MB_YESNOCANCEL "messagebox_text" 
SectionEnd