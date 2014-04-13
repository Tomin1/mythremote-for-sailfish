/**
 * MythTV remote control application for Sailfish
 * Copyright (c) 2014 Tomi Leppänen
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "parts"

Dialog {
    id: dialog
    onAccepted: {
        var status = remote.connect(host.text, port.text)
        if (status == 0) {
            pageStack.replace(Qt.resolvedUrl("NavigationPage.qml"))
            pageStack.pushExtra(Qt.resolvedUrl("MediaPage.qml"))
        } else { //
            // An error happened. Do something
            console.log("Status was: ", status);
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            spacing: Theme.paddingLarge
            width: parent.width

            DialogHeader {
                title: "Connect"
            }

            Label {
                x: Theme.paddingLarge
                text: "Start by connecting \nto a frontend"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            TextField {
                anchors.margins: Theme.paddingLarge
                id: host
                inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
                label: "Host name or ip"
                placeholderText: "Enter host name or ip"
                width: parent.width
                // EnterKey.enabled: text.length > 0
                // EnterKey.iconSource: "image://theme/icon-m-enter-next"
                // EnterKey.onClicked: port.focus
            }

            TextField {
                anchors.margins: Theme.paddingLarge
                id: port
                inputMethodHints: Qt.ImhDigitsOnly | Qt.ImhNoPredictiveText
                placeholderText: "Enter port"
                label: "Port"
                text: "6546"
                width: parent.width
                // EnterKey.enabled: text.length > 0
                // EnterKey.enabled: dialog.onAccepted()
            }
        }
    }
}


