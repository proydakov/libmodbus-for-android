#!/bin/sh
#
#  Copyright (c) 2012 Evgeny Proydakov <lord.tiran@gmail.com>
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.
#

echo  -e "Start build libmodbus\n"

# Add common build methods
. `dirname $0`/build-common.sh

echo -e "HOST_OS :" $HOST_OS "\n"
 
git clone git://github.com/stephane/libmodbus.git

cp cmake/CMakeLists.txt libmodbus/
cp cmake/android.toolchain.cmake libmodbus/
cp header/config.h libmodbus/
cp header/modbus-version.h libmodbus/src/

cd libmodbus
mkdir build
cd build

if [ "$HOST_OS" = "windows" ] ; then
    cmake -G"MinGW Makefiles" -D CMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake ..
    cmake -G"MinGW Makefiles" -D CMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake ..
elif [ "$HOST_OS" = "darwin" ] ; then
    cmake -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake ..
elif [ "$HOST_OS" = "linux" ] ; then
    cmake -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake ..
else
    echo "Unsupported OS : ${HOST_OS}."
    exit 1
fi
cmake-gui ..

make
make install

echo -e "\nEnd build libmodbus"