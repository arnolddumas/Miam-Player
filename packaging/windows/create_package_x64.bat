@echo off

rem core
set MiamPlayerBuild="C:\dev\Miam-Player-build-x64"
xcopy %MiamPlayerBuild%\MiamCore\release\MiamCore.dll packages\org.miamplayer.core\data\ /y/e
copy %MiamPlayerBuild%\MiamPlayer\release\MiamPlayer.exe packages\org.miamplayer.core\data\
copy %MiamPlayerBuild%\MiamUniqueLibrary\release\MiamUniqueLibrary.dll packages\org.miamplayer.core\data\

rem 3rd party
set MiamPlayerLibs="C:\dev\Miam-Player\lib\release\win-x64"
copy %MiamPlayerLibs%\*.dll packages\org.miamplayer.core\data\
xcopy %MiamPlayerLibs%\plugins packages\org.miamplayer.core.vlc\data\plugins /y/i/e

rem qt libraries
set QTDIR="C:\Qt\Qt5.4.1\5.4\msvc2013_64"
echo f | xcopy %QTDIR%\plugins\bearer\qgenericbearer.dll packages\org.miamplayer.core\data\bearer\qgenericbearer.dll /y/s
echo f | xcopy %QTDIR%\plugins\imageformats\qjpeg.dll packages\org.miamplayer.core\data\imageformats\qjpeg.dll /y/s
echo f | xcopy %QTDIR%\plugins\mediaservice\qtmedia_audioengine.dll packages\org.miamplayer.core\data\mediaservice\qtmedia_audioengine.dll /y/s
echo f | xcopy %QTDIR%\plugins\mediaservice\wmfengine.dll packages\org.miamplayer.core\data\mediaservice\wmfengine.dll /y/s
echo f | xcopy %QTDIR%\plugins\platforms\qminimal.dll packages\org.miamplayer.core\data\platforms\qminimal.dll /y/s
echo f | xcopy %QTDIR%\plugins\platforms\qwindows.dll packages\org.miamplayer.core\data\platforms\qwindows.dll /y/s
echo f | xcopy %QTDIR%\plugins\playlistformats\qtmultimedia_m3u.dll packages\org.miamplayer.core\data\playlistformats\qtmultimedia_m3u.dll /y/s
echo f | xcopy %QTDIR%\plugins\sqldrivers\qsqlite.dll packages\org.miamplayer.core\data\sqldrivers\qsqlite.dll /y/s
echo f | xcopy %QTDIR%\translations\qt_ar.qm packages\org.miamplayer.core\data\translations\qt_ar.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_cs.qm packages\org.miamplayer.core\data\translations\qt_cs.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_de.qm packages\org.miamplayer.core\data\translations\qt_de.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_es.qm packages\org.miamplayer.core\data\translations\qt_es.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_fr.qm packages\org.miamplayer.core\data\translations\qt_fr.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_it.qm packages\org.miamplayer.core\data\translations\qt_it.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_ja.qm packages\org.miamplayer.core\data\translations\qt_ja.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_ko.qm packages\org.miamplayer.core\data\translations\qt_ko.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_pt.qm packages\org.miamplayer.core\data\translations\qt_pt.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_ru.qm packages\org.miamplayer.core\data\translations\qt_ru.qm /y/s
echo f | xcopy %QTDIR%\translations\qt_zh_CN.qm packages\org.miamplayer.core\data\translations\qt_zh_CN.qm /y/s
copy %QTDIR%\bin\icudt53.dll packages\org.miamplayer.core\data\icudt53.dll
copy %QTDIR%\bin\icuin53.dll packages\org.miamplayer.core\data\icuin53.dll
copy %QTDIR%\bin\icuuc53.dll packages\org.miamplayer.core\data\icuuc53.dll
copy %QTDIR%\bin\libEGL.dll packages\org.miamplayer.core\data\libEGL.dll
copy %QTDIR%\bin\libGLESv2.dll packages\org.miamplayer.core\data\libGLESv2.dll
copy %QTDIR%\bin\Qt5Core.dll packages\org.miamplayer.core\data\Qt5Core.dll
copy %QTDIR%\bin\Qt5Gui.dll packages\org.miamplayer.core\data\Qt5Gui.dll
copy %QTDIR%\bin\Qt5Multimedia.dll packages\org.miamplayer.core\data\Qt5Multimedia.dll
copy %QTDIR%\bin\Qt5MultimediaWidgets.dll packages\org.miamplayer.core\data\Qt5MultimediaWidgets.dll
copy %QTDIR%\bin\Qt5Network.dll packages\org.miamplayer.core\data\Qt5Network.dll
copy %QTDIR%\bin\Qt5OpenGL.dll packages\org.miamplayer.core\data\Qt5OpenGL.dll
copy %QTDIR%\bin\Qt5Sql.dll packages\org.miamplayer.core\data\Qt5Sql.dll

copy %QTDIR%\bin\Qt5Widgets.dll packages\org.miamplayer.core\data\Qt5Widgets.dll
copy %QTDIR%\bin\Qt5WinExtras.dll packages\org.miamplayer.core\data\Qt5WinExtras.dll

rem official plugins
set CoverFetcherBuild="C:\dev\cover-fetcher-build-x64\release"
set DeezerPluginBuild="C:\dev\deezer-plugin-build-x64\release"
set MiamPlayerShellBuild="C:\dev\Miam-Player-shell-build-x64"
set MiniModeBuild="C:\dev\mini-mode-build-x64\release"
set WindowsToolbarBuild="C:\dev\windows-toolbar-build-x64\release"

rem Deezer talks to the Internet with QtWebKit
copy %QTDIR%\bin\Qt5WebKit.dll packages\org.miamplayer.core\data\Qt5WebKit.dll
copy %QTDIR%\bin\Qt5WebKitWidgets.dll packages\org.miamplayer.core\data\Qt5WebKitWidgets.dll

rem WebKit has a lot of dependencies!
copy %QTDIR%\bin\Qt5Positioning.dll packages\org.miamplayer.core\data\Qt5Positioning.dll
copy %QTDIR%\bin\Qt5PrintSupport.dll packages\org.miamplayer.core\data\Qt5PrintSupport.dll
copy %QTDIR%\bin\Qt5Qml.dll packages\org.miamplayer.core\data\Qt5Qml.dll
copy %QTDIR%\bin\Qt5Quick.dll packages\org.miamplayer.core\data\Qt5Quick.dll
copy %QTDIR%\bin\Qt5Sensors.dll packages\org.miamplayer.core\data\Qt5Sensors.dll
copy %QTDIR%\bin\Qt5WebChannel.dll packages\org.miamplayer.core\data\Qt5WebChannel.dll

xcopy %CoverFetcherBuild%\cover-fetcher.dll packages\org.miamplayer.plugins.coverfetcher\data\plugins\ /y/e
xcopy %DeezerPluginBuild%\deezer-plugin.dll packages\org.miamplayer.plugins.deezer\data\plugins\ /y/e
xcopy %MiamPlayerShellBuild%\MiamShell\release\MiamPlayerShell.dll packages\org.miamplayer.plugins.miamplayershell\data\ /y/e
xcopy %MiamPlayerShellBuild%\MiamShellGui\release\MiamShellGui.dll packages\org.miamplayer.plugins.miamplayershell\data\plugins\ /y/e
xcopy %MiniModeBuild%\mini-mode.dll packages\org.miamplayer.plugins.minimode\data\plugins\ /y/e
xcopy %WindowsToolbarBuild%\windows-toolbar.dll packages\org.miamplayer.plugins.windowstoolbar\data\plugins\ /y/e

rem vc redist 2012 and 2013 are required too
xcopy vcredist packages\org.miamplayer.core\data\vcredist /y/i/e

rem create the final package
binarycreator --offline-only -c config\config.xml -r resources/additional.qrc -p packages MiamPlayer-0.7.2.exe

rem delete data folders
rmdir packages\org.miamplayer.core\data\ /s /q
rmdir packages\org.miamplayer.core.vlc\data\ /s /q
rmdir packages\org.miamplayer.plugins.coverfetcher\data\ /s /q
rmdir packages\org.miamplayer.plugins.deezer\data\ /s /q
rmdir packages\org.miamplayer.plugins.miamplayershell\data\ /s /q
rmdir packages\org.miamplayer.plugins.minimode\data\ /s /q
rmdir packages\org.miamplayer.plugins.windowstoolbar\data\ /s /q
