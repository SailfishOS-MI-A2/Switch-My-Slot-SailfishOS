import QtQuick 2.0
import Sailfish.Silica 1.0
import io.thp.pyotherside 1.5

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingSmall
            PageHeader {
                title: qsTr("Switch My Slot")
            }
            Label {
                id: halVersionLabel
                x: Theme.horizontalPageMargin
                text: qsTr("HAL Version: ")
                color: Theme.secondaryHighlightColor
                font.pixelSize: 45
            }
            Label {
                text: qsTr("App Version: v0.3")
                x: Theme.horizontalPageMargin
                color: Theme.secondaryHighlightColor
            }
            Label {
                id: noOfSlotsLabel
                x: Theme.horizontalPageMargin
                text: qsTr("Number of slots: ")
                color: Theme.secondaryHighlightColor
            }

            Label {
                id: currentSlotSuffixLabel
                x: Theme.horizontalPageMargin
                text: qsTr("Current slot suffix: ")
                color: Theme.secondaryHighlightColor
            }

            Button {
                id: switchSlotButton
                x: Theme.horizontalPageMargin
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Switch slot")
                color: Theme.secondaryHighlightColor
                onClicked: {
                    python.switchSlotFunc();
                }
            }

            Label {
                id: currentSlotLabel
                x: Theme.horizontalPageMargin
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Current slot: ")
                color: Theme.secondaryHighlightColor
            }
            Label {
                x: Theme.horizontalPageMargin
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Developed by Shou")
                color: Theme.secondaryHighlightColor
                font.pixelSize: 45
            }
            Label {
                id: openRepo
                x: Theme.horizontalPageMargin
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.secondaryHighlightColor
                font.pixelSize: 45
                text: "<a href='https://github.com/SailfishOS-MI-A2/Switch-My-Slot-SailfishOS'>Licensed under MIT</a>"
                onLinkActivated: Qt.openUrlExternally(link)
            }

            Python {
                    id: python

                    Component.onCompleted: {
                        addImportPath(Qt.resolvedUrl('.'));
                        setHandler('halVersion', function(halVersion) {
                           halVersionLabel.text = halVersion;
                        });
                        setHandler('noOfSlots', function(noOfSlots) {
                           noOfSlotsLabel.text = "Number of slots: " + noOfSlots;
                        });
                        setHandler('currentSlotSuffix', function(currentSlotSuffix) {
                           currentSlotSuffixLabel.text = "Current slot suffix: " + currentSlotSuffix;
                        });
                        setHandler('currentSlot', function(currentSlot) {
                           currentSlotLabel.text = "Current slot: " + currentSlot;
                        });
                        importModule('logic', function () {});
                    }

                    function switchSlotFunc() {
                        switchSlotButton.enabled = false
                        currentSlotLabel.text = "Please reboot/ turn off your phone now";
                        call('logic.switchSlotFunc', function() {});
                    }

                    onError: {
                        console.log('python error: ' + traceback);
                    }

                    onReceived: {
                        console.log('got message from python: ' + data);
                    }
                }
        }
    }
}
