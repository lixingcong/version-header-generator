TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

include($$PWD/../../qmake/version-header-generator.pri)

SOURCES += \
        main.cpp
