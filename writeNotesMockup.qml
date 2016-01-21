import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
/*
      É apenas um mockup
      Sim o código pode ser modularizado mas é apenas um mockup
      Sim, muitas coisas podem ser melhoradas mas isso é apenas um mockup
*/
Window {
    id: window
    width: 800
    height: 600
    Row {
        id: row
        anchors.fill: parent
        Item {
            id: menu
            function toggle() {
                if (menu.visible) {
                    menu.visible = false
                } else {
                    menu.visible = true
                }
            }
            width: window.width * 0.2
            height: parent.height
            Rectangle {
                anchors.fill: parent
                color: "pink"
            }
        }
        Item {
            width: parent.width
            height: parent.height
            Flickable {
                anchors.fill: parent
                contentWidth: grid.width
                contentHeight: grid.height
                Grid {
                    id: grid
                    spacing: 4
                    columns: 4
                    width: menu.visible ? row.width * 0.8 : row.width
                    Repeater {
                        model: 40
                        Rectangle {
                            width: 150
                            height: 100
                            color: "white"
                            border.color: "black"
                            border.width: 1
                        }
                    }
                }
            }
        }
        move : Transition {
            NumberAnimation { properties: "x,y"; duration: 200 }
        }
    }
    Rectangle {
        id: menuButton
        width: Screen.pixelDensity * 5
        height: width
        color: "black"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menu.toggle()
            }
        }
    }
}
