import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: subWindow
    width: 300
    height: 200
    title: "Sub Window"
    visible: false
    x: 0
    y: screenHeight - height
    color: "black"
    flags: Qt.WindowStaysOnTopHint

    // Properties for setting the position of the main window
    property int xPosition: mainWindow.x
    property int yPosition: mainWindow.y
    property int wSize: mainWindow.width
    property int hSize: mainWindow.height

    onXPositionChanged: mainWindow.x = xPosition
    onYPositionChanged: mainWindow.y = yPosition
    onWSizeChanged: mainWindow.width = wSize
    onHSizeChanged: mainWindow.height = hSize

    Column {
        anchors.centerIn: parent

        Row {
            Layout.alignment: Qt.AlignVCenter
            Label {
                text: "x"
            }

            Button {
                text: "-"
                onClicked: xField.text = parseInt(xField.text) - 1
            }

            TextField {
                id: xField
                text: mainWindow.x
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: xPosition = parseInt(text)
            }

            Button {
                text: "+"
                onClicked: xField.text = parseInt(xField.text) + 1
            }
        }

        Row {
            Layout.alignment: Qt.AlignVCenter
            Label {
                text: "y"
            }
            Button {
                text: "-"
                onClicked: yField.text = parseInt(yField.text) - 1
            }

            TextField {
                id: yField
                text: mainWindow.y
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: yPosition = parseInt(text)
            }

            Button {
                text: "+"
                onClicked: yField.text = parseInt(yField.text) + 1
            }
        }

        Row {
            Label {
                text: "w"
            }

            Button {
                text: "-"
                onClicked: wField.text = parseInt(wField.text) - 1
            }

            TextField {
                id: wField
                text: mainWindow.width
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: wSize = parseInt(text)
            }

            Button {
                text: "+"
                onClicked: wField.text = parseInt(wField.text) + 1
            }
        }

        Row {
            Label {
                text: "h"
            }

            Button {
                text: "-"
                onClicked: hField.text = parseInt(hField.text) - 1
            }

            TextField {
                id: hField
                text: mainWindow.height
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: hSize = parseInt(text)
            }

            Button {
                text: "+"
                onClicked: hField.text = parseInt(hField.text) + 1
            }
        }

    }

}
