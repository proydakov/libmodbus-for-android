# libmodbus for android
Libmodbus for android is a set of tools to compile libmodbus library (http://github.com/stephane/libmodbus) for the Android platform.

To compile libmodbus for android you may use one of the following NDKs:

- NDK r7 customized by [CrystaX](http://www.crystax.net/android/ndk.php).
* other SDK is not tested yet. you can help =)

# Quick Start

## Dependencies

 * NDK   ([customized by CrystaX](http://www.crystax.net/android/ndk.php))
 * Git   (from repo or [msysgit for mindows](http://code.google.com/p/msysgit/))
 * CMake (from repo or [cmake from official website](http://www.cmake.org/))

## Usage

    ./build-android.sh

While working in cmake-gui to select the installation directory, and other settings different from default settings.

## Troubleshooting

In case you encounter bunch of linker errors when building your app with libmodbus, this might help:

### NDK 7 (CrystaX)

Add `-lgnustl_static` *AFTER* all boost libraries to the LOCAL_LDLIBS line in Android.mk. Example:

    LOCAL_LDLIBS += lmodbus -lgnustl_static
