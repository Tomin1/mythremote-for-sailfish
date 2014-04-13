/**
 * MythTV remote control application for Sailfish
 * Copyright (c) 2012-2014 Tomi Leppänen
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

#include "remote.h"
#include <QTcpSocket>
#include <QtGui>

Remote::Remote(QObject *parent) : QObject(parent) {
    socket = new QTcpSocket(this);
    connected = false;
    emit connectedStateChanged();
}

int Remote::connect(QString host, QString port) {
    this->host = host;
    this->port = port;
    if (this->connected)
        disconnect();
    socket->connectToHost(host, port.toInt());
    socket->waitForConnected(1000);
    if (socket->error() == QAbstractSocket::ConnectionRefusedError) {
        qDebug() << "Connection refused\n";
        return -1; // If can't connect
    }

    socket->waitForReadyRead(1000);
    QString ret_val;
    while (socket->bytesAvailable()) {
        ret_val.append(QString(socket->read(128)));
    }
    qDebug() << "Connected\n" << ret_val;

    if (!ret_val.contains("MythFrontend Network Control")) {
        qDebug() << "Wrong server\nServer returned: " << ret_val;
        disconnect();
        return -2; // If it's not mythfrontend
    }
    connected = true;
    emit connectedStateChanged();
    return 0;
}

QString Remote::send_command(QString command) {
    command.append("\n");
    socket->write(command.toLatin1());
    socket-> waitForReadyRead(1000);
    QString ret_val;
    while (socket->bytesAvailable()) {
        ret_val.append(QString(socket->read(128)));
    }
    qDebug() << "Command:" << command << ret_val;
    if (socket->error() == QAbstractSocket::RemoteHostClosedError) {
        disconnect();
        return "Error: RemoteHostClosed"; // If frontend is closed
    }
    return ret_val;
}

int Remote::disconnect() {
    socket->disconnectFromHost();
    socket->abort();
    if (connected) {
        connected = false;
        emit connectedStateChanged();
    }
    qDebug() << "Disconnected";
    return 0;
}

bool Remote::isConnected() {
    return connected;
}

bool Remote::isPlaying() {
    if (!isConnected())
        return false;
    QString ret_val = send_command("query location");
    if (ret_val.indexOf("pause") == -1)
        return true;
    return false;
}

QString Remote::getHost() {
    return host;
}

QString Remote::getPort() {
    return port;
}

void Remote::setVolume(int volume) {
    this->volume = volume;
    emit volumeChanged(volume);
}

int Remote::getVolume() {
    return volume;
}
