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

#ifndef REMOTE_H
#define REMOTE_H

#include <QObject>
#include <QTcpSocket>

class Remote : public QObject {
    Q_OBJECT
    QTcpSocket *socket;
    Q_PROPERTY(bool connected READ isConnected NOTIFY connectedStateChanged)
    Q_PROPERTY(QString host READ getHost)
    Q_PROPERTY(QString port READ getPort)
    Q_PROPERTY(int volume READ getVolume)
public:
    QString host;
    QString port;
    int volume;
    bool connected;
    explicit Remote(QObject *parent = 0);

    Q_INVOKABLE int connect(QString host, QString port);
    Q_INVOKABLE QString send_command(QString command);
    Q_INVOKABLE int disconnect();

    Q_INVOKABLE bool isConnected();
    Q_INVOKABLE bool isPlaying();
    Q_INVOKABLE QString getHost();
    Q_INVOKABLE QString getPort();
    Q_INVOKABLE int getVolume();
    
signals:
    void connectedStateChanged();
    void volumeChanged(int volume);

public slots:
    void setVolume(int volume);
};

#endif // REMOTE_H
