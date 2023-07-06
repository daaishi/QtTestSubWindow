import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import Qt.labs.platform 1.1
import "QML" as QMLComponents

Window {
    id: mainWindow
    x: 0
    y: 0
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = Qt.BlankCursor
        }
    }

    QMLComponents.SubWindow {
        id: subWindow
        x: 0
        y: screenHeight - height

        onVisibleChanged: {
            if (!visible) {
                mainWindow.flags = Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
            }
        }
    }

    Shortcut {
        sequence: (Qt.platform.os === "windows") ? "Ctrl+," : "Ctrl+,"
        onActivated: {
            subWindow.visible = true
            mainWindow.flags = Qt.FramelessWindowHint
        }
    }
}
