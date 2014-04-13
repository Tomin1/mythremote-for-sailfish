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

Button {
    property string action
    property string key

    anchors.margins: Theme.paddingLarge

    text: key
    onClicked: {
        if (action == "play or pause") {
            if (!remote.send_command("query location").match("pause")) {
                remote.send_command("play speed pause")
            } else {
                remote.send_command("play speed normal")
            }
        } else if (action != "none")
            remote.send_command(action + " " + key)
    }

    width: parent.width / 3
}
