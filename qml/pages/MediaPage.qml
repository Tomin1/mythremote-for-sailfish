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

Page {
    allowedOrientations: Orientation.Portrait
    id: media_page

    SilicaGridView {
        anchors.fill: parent
        flow: GridView.LeftToRight
        header: PageHeader {
            title: "MythTV remote"
        }
        cellHeight: width / 3
        cellWidth: width / 3

        DefaultPullDownMenu { }

        delegate: Component {
            RemoteButton {
                action: a
                key: k
                text: t
            }
        }

        model: ListModel {
            ListElement {
                a: "key"
                k: "home"
                t: "Home"
            }

            ListElement {
                a: "key"
                k: "up"
                t: "Fast backward"
            }

            ListElement {
                a: "key"
                k: "end"
                t: "End"
            }

            ListElement {
                a: "play seek"
                k: "backward"
                t: "Backward"
            }

            ListElement {
                a: "play or pause"
                k: ""
                t: "Play"
            }

            ListElement {
                a: "play seek"
                k: "forward"
                t: "Forward"
            }

            ListElement {
                a: "play"
                k: "channel down"
                t: "Ch down"
            }

            ListElement {
                a: "key"
                k: "down"
                t: "Fast forward"
            }

            ListElement {
                a: "play"
                k: "channel up"
                t: "Ch up"
            }

            ListElement {
                a: "key"
                k: "i"
                t: "Info"
            }

            ListElement {
                a: "key"
                k: "space"
                t: "Bookmark"
            }

            ListElement {
                a: "key"
                k: "s"
                t: "Epg"
            }

            ListElement {
                a: "key"
                k: "r"
                t: "Rec"
            }

            ListElement {
                a: "play"
                k: "stop"
                t: "Stop"
            }

            ListElement {
                a: "key"
                k: "t"
                t: "Text"
            }
        }
    }
}
