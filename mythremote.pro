# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = mythremote

CONFIG += sailfishapp

SOURCES += src/mythremote.cpp \
    src/remote.cpp

OTHER_FILES += qml/mythremote.qml \
    qml/cover/CoverPage.qml \
    rpm/mythremote.spec \
    rpm/mythremote.yaml \
    mythremote.desktop \
    COPYING \
    qml/pages/NavigationPage.qml \
    qml/pages/MediaPage.qml \
    qml/pages/parts/DefaultPullDownMenu.qml \
    qml/pages/parts/RemoteButton.qml \
    qml/pages/ConnectPage.qml

HEADERS += \
    src/remote.h

