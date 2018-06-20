# Android Messages for Desktop
[![Build Status](https://travis-ci.org/omouren/android-messages-for-desktop.svg?branch=master)](https://travis-ci.org/omouren/android-messages-for-desktop)

A desktop app for [Android Messages](https://messages.android.com). This desktop app is supported by both [Nativefier](https://github.com/jiahaog/nativefier) and [Electron](https://github.com/electron/electron).

The Mac, Windows, and Linux apps can be downloaded from the [latest release](https://github.com/omouren/android-messages-for-desktop/releases).

## Purpose
The purpose of this project is to build dedicated desktop apps for Android Messages and leverage your OS's built in notification system.

This desktop app is not an official product of Google and I am not affiliated with Google in any way.

## Rebuilding the app
Requires `node`

### Nativefier
Install nativefier and make sure to have your [optional dependencies](https://github.com/jiahaog/nativefier#optional-dependencies) set up to replace the icon.
```
npm install -g nativefier
```

### Mac
```
nativefier --platform "mac" --icon android-messages-logo.png --name "Android Messages" "https://messages.android.com" --honest --disable-dev-tools --single-instance --tray
```

### Windows
```
nativefier --platform "windows" --icon android-messages-logo.png --name "Android Messages" "https://messages.android.com" --honest --disable-dev-tools --single-instance --tray
```

### Linux
```
nativefier --platform "linux" --icon android-messages-logo.png --name "AndroidMessages" "https://messages.android.com" --honest --disable-dev-tools --single-instance --tray
```
