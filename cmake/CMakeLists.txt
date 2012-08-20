CMAKE_MINIMUM_REQUIRED(VERSION 2.6.0)

PROJECT(LIBMODBUS-ANDROID)

SET(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR})
SET(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR})

INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR})

SET(ANDROID_NDK $ENV{ANDROID_NDK})
MESSAGE(STATUS "ANDROID_NDK : ${ANDROID_NDK}")

# crystax sdk fix
LINK_DIRECTORIES(${LINK_DIRECTORIES} ${ANDROID_NDK}/sources/crystax/empty/arm)

SET(HEADER_FILES
    config.h
    src/modbus.h
    src/modbus-private.h 
    src/modbus-rtu.h
    src/modbus-rtu-private.h
    src/modbus-tcp.h
    src/modbus-tcp-private.h
    src/modbus-version.h.in)

SET(SOURCE_FILES
    src/modbus.c
    src/modbus-tcp.c
    src/modbus-rtu.c
    src/modbus-data.c)

ADD_LIBRARY(modbus ${HEADER_FILES} ${SOURCE_FILES})

#------------------------------------------------------------------------------

INSTALL(FILES src/modbus.h DESTINATION include/modbus)
INSTALL(FILES src/modbus-rtu.h DESTINATION include/modbus)
INSTALL(FILES src/modbus-tcp.h DESTINATION include/modbus)
INSTALL(FILES src/modbus-version.h DESTINATION include/modbus)

INSTALL(TARGETS modbus DESTINATION lib)

ADD_CUSTOM_TARGET(uninstall @echo uninstall package)
    
ADD_CUSTOM_COMMAND(
    COMMENT "uninstall package"
    COMMAND xargs ARGS rm < install_manifest.txt
    COMMAND rm ARGS -r ${CMAKE_INSTALL_PREFIX}/include/vcore
    TARGET  uninstall)
