; INSTALLER for IIPServer x64 with Kakadu and memcached + 32bit transcoder
; Data split to program files and virtual directory files
[Setup]
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed = x64
PrivilegesRequired=admin
AppName=IIPImage JPEG2000
AppVersion=0.9.9
DefaultDirName={pf64}\IIPImage JPEG2000
DefaultGroupName=IIPImage JPEG2000
UninstallDisplayIcon={app}\iipsrv.exe
LicenseFile={#file AddBackslash(SourcePath) + "IIPServerLicense.rtf"}
Compression=lzma2
SolidCompression=yes
AllowNoIcons=no
OutputDir=userdocs:Inno Setup Examples Output\IIPImage JPEG2000\IIS version
OutputBaseFileName=IIPImage_IIS_x64
;maximal resolution 164x314, set is 163x314 creating 1 pixel border 
WizardImageFile=wizardImage.bmp
WizardImageStretch=no
;color which creates border
WizardImageBackColor=$A0A0A0
;max resolution 55x58 pixels
WizardSmallImageFile=wizardSmallImage.bmp

[Dirs]
;directories for images and Logs
Name: "{code:GetVirtDir}\Logs"
Name: "{code:GetImagesDir}"

[Files]
;Program files - exe,dlls,Readme
Source: "Program Files\iipsrv.exe"; DestDir: "{app}"
Source: "Program Files\kdu_v64R.dll"; DestDir: "{app}"
Source: "Program Files\libfcgi.dll"; DestDir: "{app}"
Source: "Program Files\msvcp100.dll"; DestDir: "{app}"
Source: "Program Files\msvcr100.dll"; DestDir: "{app}"
Source: "Readme.rtf"; DestDir: "{app}"; Flags: isreadme
;Virtual directory files 
Source: "Virtual Directory\iipsrv.fcgi"; DestDir: "{code:GetVirtDir}"
Source: "Virtual Directory\MooViewer2.0\css\ie.css"; DestDir: "{code:GetVirtDir}\MooViewer2.0\css"
Source: "Virtual Directory\MooViewer2.0\css\iip.css"; DestDir: "{code:GetVirtDir}\MooViewer2.0\css"
Source: "Virtual Directory\MooViewer2.0\images\iip.32x32.png"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\iip.png"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\iip-favicon.png"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\reset.png"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\reset.svg"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\zoomIn.png"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\zoomIn.svg"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\zoomOut.png"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\images\zoomOut.svg"; DestDir: "{code:GetVirtDir}\MooViewer2.0\images"
Source: "Virtual Directory\MooViewer2.0\javascript\iipmooviewer-2.0.js"; DestDir: "{code:GetVirtDir}\MooViewer2.0\javascript"
Source: "Virtual Directory\MooViewer2.0\javascript\mootools-core-1.3.2-full-nocompat.js"; DestDir: "{code:GetVirtDir}\MooViewer2.0\javascript"
Source: "Virtual Directory\MooViewer2.0\javascript\mootools-more-1.3.2.1.js"; DestDir: "{code:GetVirtDir}\MooViewer2.0\javascript"
Source: "Virtual Directory\MooViewer2.0\javascript\protocols.js"; DestDir: "{code:GetVirtDir}\MooViewer2.0\javascript"
Source: "Virtual Directory\index.html"; DestDir: "{code:GetVirtDir}"
Source: "Virtual Directory\IIPImage MooViewer 2.0.url"; DestDir: "{code:GetVirtDir}"
Source: "Virtual Directory\IIPImage Project Website.url"; DestDir: "{code:GetVirtDir}"
Source: "Virtual Directory\Online Demo.url"; DestDir: "{code:GetVirtDir}"
;Images directory files - demo image
Source: "Images\demo.jp2"; DestDir: "{code:GetImagesDir}"
;JPEG2000Transcoder files
Source: "Jpeg2000Transcoder\Jpeg2000Transcoder.exe"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\djpeg.exe"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\kdu_compress.exe"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\kdu_v64R.dll"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\QtCore4.dll"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\QtGui4.dll"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\msvcp100.dll"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\msvcr100.dll"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
Source: "Jpeg2000Transcoder\configuration.ini"; DestDir: "{code:GetTranscoderDir}\Jpeg2000Transcoder"
;Memcached 64bit compiled in MSVC2010
Source: "Memcached\memcached.exe"; DestDir: "{code:GetMemcachedDir}"
Source: "Program Files\msvcp100.dll"; DestDir: "{code:GetMemcachedDir}"
Source: "Program Files\msvcr100.dll"; DestDir: "{code:GetMemcachedDir}"
;Temporary files - first sets rights and installs IIS, second configures everything,
; third creates index.html and starts it in browser
Source: "Batch Files\install.bat"; DestDir: "{tmp}"
Source: "Batch Files\configure.bat"; DestDir: "{tmp}"
Source: "Batch Files\index-Moo.bat"; DestDir: "{tmp}"

[UninstallDelete]
;web.config is created during configuration of IIS
Type: files; Name: "{code:GetVirtDir}\web.config"

[Icons]
Name: "{group}\IIPImage MooViewer 2.0"; Filename: "{code:GetVirtDir}\IIPImage MooViewer 2.0.url"
Name: "{group}\Jpeg2000 Transcoder"; Filename: "{code:GetTranscoderDir}\Jpeg2000Transcoder.exe"
Name: "{group}\Images"; Filename: "{code:GetImagesDir}"
Name: "{group}\Uninstall IIPImage"; Filename: "{app}\unins000.exe"
Name: "{group}\Readme"; Filename: "{app}\Readme.rtf"
Name: "{group}\IIPImage Project Website"; Filename: "{code:GetVirtDir}\IIPImage Project Website.url"
Name: "{group}\Online Demo"; Filename: "{code:GetVirtDir}\Online Demo.url"

[Code]
var
  //global variables - in whole code there is reference to this pages
  VirtDirNamePage: TInputQueryWizardPage;
  ImagesPathPage: TInputDirWizardPage;
  MemcachedPathPage: TInputDirWizardPage;
  TranscoderPathPage: TInputDirWizardPage;
  ProgressPage: TOutputProgressWizardPage;
  
procedure CreateTheWizardPages;
begin
  VirtDirNamePage := CreateInputQueryPage(wpSelectDir,
    'Name of virtual directory', 'What will be name of directory?',
    'Please specify name for your virtual directory, it will be included in URL for all accesses to ImageServer.');
  VirtDirNamePage.Add('Name of virtual directory:', False);
  VirtDirNamePage.Values[0] := 'imageserver';
  
  MemcachedPathPage := CreateInputDirPage(VirtDirNamePage.ID,
    'Select directory for Memcached', 'Where should be Memcached installed?',
    'Select folder where will be installed Memcached, cache server improving performance of IIPImage, then click Next',
    True, 'Memcached');
  MemcachedPathPage.Add('Memcached directory:');
  MemcachedPathPage.Values[0] := ExpandConstant('{pf64}\Memcached');
  
  TranscoderPathPage := CreateInputDirPage(MemcachedPathPage.ID,
    'Select directory for JPEG2000 Transcoder', 'Where should be JPEG2000 Transcoder installed?',
    'Select directory where will be installed JPEG2000 Transcoder, utility for transcoding images to jp2 format',
    True, 'JPEG2000 Transcoder');
  TranscoderPathPage.Add('JPEG2000 Transcoder directory:');
  TranscoderPathPage.Values[0] := ExpandConstant('{pf32}\JPEG2000 Transcoder');
    
  ImagesPathPage := CreateInputDirPage(TranscoderPathPage.ID,
    'Select physical path for Images directory', 'Where should be stored images?',
    'Select folder where will be stored images, then click Next',
    True, 'IIPImage Images');
  ImagesPathPage.Add('Images directory:');
  ImagesPathPage.Values[0] := ExpandConstant('{commondocs}\IIPImage Images');
  
  ProgressPage := CreateOutputProgressPage('Configuration', 'Installer is now '
    +'installing and configuring required components');
end;

{ Getters for directories and names set by user in installation, needed in Setup section }
function GetImagesDir(Param: String): String;
begin
  Result := ImagesPathPage.Values[0];
end;

function GetVirtDir(Param: String): String;
begin
  Result := ExpandConstant('{app}\virtual-directory');
end;

function GetVirtDirName(Param: String): String;
begin
  Result := VirtDirNamePage.Values[0];
end;

function GetMemcachedDir(Param: String): String;
begin
  Result := MemcachedPathPage.Values[0];
end;

function GetTranscoderDir(Param: String): String;
begin
  Result := TranscoderPathPage.Values[0];
end;

{ Updates information shown just before installation}
function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  S := '';
  S := S + MemoDirInfo + NewLine;
  S := S + NewLine;
  S := S + 'Memcached Directory:' + NewLine;
  S := S + Space + 'Destination' + MemcachedPathPage.Values[0] + NewLine;
  S := S + NewLine;
  S := S + 'JPEG2000 Transcoder Directory:' + NewLine;
  S := S + Space + 'Destination:' + TranscoderPathPage.Values[0] + NewLine;
  S := S + NewLine;
  S := S + 'Virtual Directory:' + NewLine;
  S := S + Space + 'Name: ' + VirtDirNamePage.Values[0] + NewLine;
  S := S + Space + 'Destination:' + GetVirtDir('') + NewLine;
  S := S + NewLine;
  S := S + 'Images Directory:' + NewLine;
  S := S + Space + 'Destination:' + ImagesPathPage.Values[0] + NewLine;
  S := S + NewLine;
  S := S + MemoGroupInfo + NewLine;
  Result := S;
end;

{ Configuration section and installation of IIS }
procedure MyAfterInstall();
var
  ResultCode,I: Integer;
begin
  // Save the name of virtual directory into registry
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\IIPImage JPEG2000_is1',
    'VirtDirName', VirtDirNamePage.Values[0]);
  ProgressPage.SetText('Installing and configuring IIS', '');
  ProgressPage.SetProgress(0, 0);
  ProgressPage.Show;
  // Install IIS and set rights for virtual directory:
  // 1. param - physical path to virtual directory,
  // 2. param - path to Images directory,
  Exec(ExpandConstant('{tmp}\install.bat'),
   '"'+GetVirtDir('')+'" "'
   +ImagesPathPage.Values[0]+'"', '',
      SW_HIDE, ewNoWait, ResultCode);
  I := 0;
  try
    // active waiting for execution of script but maximum is cca 5 minutes 
    while((NOT RegValueExists(HKEY_LOCAL_MACHINE,
     'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\IIPImage JPEG2000_is1', 'IISScript')) 
     and (I < 3000)) do 
    begin
      //every tick increase by 0.1% and on 100% it starts again from zero
      ProgressPage.SetProgress((I mod 1000), 1000);
      sleep(100);
      I := I+1;
    end;
    // Starts memcached as service and configures iis and virtual directory
    // 1. param - path to app. directory, 
    // 2. param - name of virtual directory,
    // 3. param - physical path to virtual directory,
    // 4. param - path to Images folder,
    // 5. param - path to memcached folder
    Exec(ExpandConstant('{tmp}\configure.bat'), 
      '"'+ExpandConstant('{app}')
      +'" "'+VirtDirNamePage.Values[0]
      +'" "'+GetVirtDir('')
      +'" "'+ImagesPathPage.Values[0]
      +'" "'+MemcachedPathPage.Values[0]+'"',
       '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    if (ResultCode <> 0) then 
      MsgBox('CRITICAL ERROR:' #13#13 'Error occured during installation or configuration of IIS.' #13 
      'Please read Readme.txt file for information how to solve this problem.',
         mbCriticalError, MB_OK);
    // Create index.html, url shortcut to this file and configures configuration.ini for transcoder
    // 1. param - name of virtual directory,
    // 2. param - physical path to virtual directory,
    // 3. param - path to Images folder,
    // 4. param - path to transcoder dir
    Exec(ExpandConstant('{tmp}\index-Moo.bat'), 
      '"'+VirtDirNamePage.Values[0]
      +'" "'+GetVirtDir('')
      +'" "'+ImagesPathPage.Values[0]
      +'" "'+TranscoderPathPage.Values[0]+'"', 
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    ProgressPage.SetProgress(100, 100);
  finally
    ProgressPage.Hide;
  end;
end;

{ Start of Installer }
procedure InitializeWizard();
begin
{ Custom wizard pages - Virtual Dir. path, name and Progress page }
  CreateTheWizardPages;
  { if pkgmgr does not exist, exit installation, we can't do antyhing }
  if(NOT FileExists(ExpandConstant('{sys}\PkgMgr.exe'))) then
  begin
    MsgBox('MISSING PACKAGE MANAGER:' #13#13 
    'Package manager PkgMgr.exe was not found on this system.'
    +' For successful installation you must have windows Vista, Windows Server '
    +'2008 or higher operation system.', mbCriticalError, MB_OK);
    Abort();
  end;
end;

{ Function after clicking Next button (checks for previous installation) }
function NextButtonClick(CurPageID: Integer): Boolean;
var UninstallString: String; ResultCode: Integer;
begin
  //IIPIMAGE BRANCH
  if CurPageID = wpWelcome then
  begin;
    // check if previous installation exists
    if (RegValueExists(HKEY_LOCAL_MACHINE,
      'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\IIPImage JPEG2000_is1', 'UninstallString')) then
    begin
      if (MsgBox('Already installed:' #13#13 'The previous IIPImage installation was found. '
                + 'Previous version should be uninstalled before installing new one.'
                + 'Do you want to uninstall previous version now?', mbConfirmation, MB_YESNO) = IDYES) then
      begin
        RegQueryStringValue(HKEY_LOCAL_MACHINE,
          'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\IIPImage JPEG2000_is1',
          'UninstallString', UninstallString);
        //uninstall string contains quotes, so we have to pass the uninstall string using '>'
        //see documentation of Exec for more info
        Exec('>', UninstallString, '', SW_SHOW, ewWaitUntilTerminated, ResultCode)
        if (ResultCode <> 0) then
        begin
          MsgBox('Uninstallation cancelled:' #13#13 'Uninstallation was cancelled, please uninstall again.',
                mbInformation, MB_OK);
          Abort();
        end;
        MsgBox('Installation continue:' #13#13 'The previous IIPImage installation was removed. '
                + 'Installation may continue.', mbInformation, MB_OK);
      end
      else
      begin
        MsgBox('Installation failed:' #13#13 'Can''t continue installation without removing previous version.',
        mbInformation, MB_OK);
        Abort();
      end;
    end;//end of branch with existing previous IIPImage
  end;//end of wpWelcome Next button click
  Result := True;
end;

{ After files were copied in appropriate directories }
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then begin
    MyAfterInstall();
  end;
end;

{ Uninstall }
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var ResultCode,ErrorCode: Integer; App,VirtDirName: String;
begin
  if CurUninstallStep = usUninstall then begin
    if (MsgBox('Remove virtual directory and FCGI application:' #13#13 'Do you want to remove virtual directory and FCGI application for IIP Image Server created during installation process?', mbConfirmation, MB_YESNO) = idYes) then
    begin
      ErrorCode := -2;
      if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\IIPImage JPEG2000_is1',
        'InstallLocation', App) then
      begin
        Exec(ExpandConstant('{cmd}'), '/C %windir%\system32\inetsrv\appcmd.exe set config -section:system.webServer/fastCgi /-"[fullPath='''+App+'iipsrv.exe'']" /commit:apphost', '', SW_HIDE,
              ewWaitUntilTerminated, ResultCode);
        if (ResultCode = 0) then ErrorCode := 0
        else ErrorCode := 2;
      end;
      if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\IIPImage JPEG2000_is1',
        'VirtDirName', VirtDirName) then
      begin
        Exec(ExpandConstant('{cmd}'), '/C %windir%\system32\inetsrv\appcmd.exe delete vdir /vdir.name:"Default Web Site/'+
        VirtDirName+'"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
        if (ResultCode <> 0) then ErrorCode := ErrorCode + 3;
      end
      else ErrorCode := ErrorCode - 3;
      if (ErrorCode <> 0) then
      {Info about ErrorCode (for developers, users don't care)
      -5=Both registry values not found,
      -3=First command successful, second registry not found,
      -2=First registry not found, second command successful,
      -1=First command failed, second registry not found,
       0=Both commands successful,
       1=First registry not found, second command failed,
       3=First command successful, second failed,
       5=Both commands failed}       
        MsgBox('ERROR '+IntToStr(ErrorCode)+':' #13#13 'Error occured during removing virtual directory or FCGI application.'
          +' Please remove it manually.', mbInformation, MB_OK);
    end;
    //stop memcached so it can be uninstalled and remove memcached service
    Exec(ExpandConstant('{cmd}'), '/C sc stop "memcached Server"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec(ExpandConstant('{cmd}'), '/C sc delete "memcached Server"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    //kill iipsrv.exe if running, so it can be uninstalled
    Exec(ExpandConstant('{cmd}'), '/C taskkill /F /IM iipsrv.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  end;
end;
