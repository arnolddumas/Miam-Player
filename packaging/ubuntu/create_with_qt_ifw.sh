#!/bin/bash

MiamPlayerBuild=$HOME/Miam-Player-build-release
deezerbuild=$HOME/build-deezer-plugin-Desktop-Release

# core
mkdir packages/org.miamplayer.core/data/
cp $MiamPlayerBuild/MiamCore/libmiam-core.so.1.0.0 packages/org.miamplayer.core/data/
cp $MiamPlayerBuild/MiamPlayer/miam-player packages/org.miamplayer.core/data/
cp $MiamPlayerBuild/MiamUniqueLibrary/libmiam-uniquelibrary.so.1.0.0 packages/org.miamplayer.core/data/

# 3rd party
VLCQtLibs=/usr/local/lib
cp $VLCQtLibs/libvlc-qt.so* packages/org.miamplayer.core/data/
cp $VLCQtLibs/libvlc-qt-widgets.so* packages/org.miamplayer.core/data/

# official plugins
mkdir packages/org.miamplayer.plugins.deezer/data/
mkdir packages/org.miamplayer.plugins.deezer/data/plugins/
cp -f $deezerbuild/libdeezer-plugin.so* packages/org.miamplayer.plugins.deezer/data/plugins/

# links
cp generate_symbolic_links.sh packages/org.miamplayer.core/data/

# create the final package
/home/mbach/ifw/binarycreator -c config/config.xml -r resources/additional.qrc -p packages miam-player-0.7.0.run

# delete data folders
rm -rf packages/org.miamplayer.core/data/
rm -rf packages/org.miamplayer.core.vlc/data/
rm -rf packages/org.miamplayer.plugins.coverfetcher/data/
rm -rf packages/org.miamplayer.plugins.deezer/data/
rm -rf packages/org.miamplayer.plugins.minimode/data/



