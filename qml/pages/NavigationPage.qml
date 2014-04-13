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
    id: navigation_page

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
                k: "escape"
                t: "Escape"
            }

            ListElement {
                a: "key"
                k: "up"
                t: "Up"
            }

            ListElement {
                a: "key"
                k: "m"
                t: "Menu"
            }

            ListElement {
                a: "key"
                k: "left"
                t: "Left"
            }

            ListElement {
                a: "key"
                k: "enter"
                t: "Enter"
            }

            ListElement {
                a: "key"
                k: "right"
                t: "Right"
            }

            ListElement {
                a: "none"
                k: ""
                t: ""
            }

            ListElement {
                a: "key"
                k: "down"
                t: "Down"
            }

            ListElement {
                a: "none"
                k: ""
                t: ""
            }
        }
    }
}
