import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rect
        width: 200
        height: 200
        color: "darkred"
        anchors.centerIn: parent

        Text {
            id: text
            text: Math.round(parent.rotation)
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: 50
        }

        RotationAnimation {
            id: animation
            target: rect
            loops: Animation.Infinite
            from: rect.rotation
            to: 360
            direction: RotationAnimation.Clockwise
            duration: 5000
            running: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(animation.paused) {
                    animation.resume()
                } else {
                    animation.pause()
                }
            }
        }
    }
}
