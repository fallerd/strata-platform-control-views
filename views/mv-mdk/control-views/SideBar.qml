import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQml 2.12

import "qrc:/js/help_layout_manager.js" as Help
import "../widgets"

import tech.strata.sgwidgets 1.0

Rectangle {

    // ======================== General Settings ======================== //

    id: sideBar
    color: "#454545"
    implicitWidth: 70
    Layout.fillHeight: true

    // property alias cp_spd_loop_params_accel: controlsParameters.cp_spd_loop_params_accel.text
    // property alias send_spd_loop_params: controlsParameters.send_spd_loop_params()

    // ======================== UI Initialization ======================== //
    
    Component.onCompleted: {

        // ------------------------ Help Messages ------------------------ //

        // Help messages
        Help.registerTarget(speedButton, "Click here for a popout slider to set the motor's target speed. The maximum value will be updated based on the Max RPM set on the Motor and Load Parameters tab in the Motor and Load Parameters section.", 0, "BasicControlHelp")
        Help.registerTarget(accelButton, "Click here for a popout slider to set the motor's startup acceleration. The value will be updated based on the Acceleration Rate set on the Motor and Load Parameters tab in the Speed Loop Parameters section.", 1, "BasicControlHelp")
        Help.registerTarget(runButton, "Click the run icon to start spinning the motor. The run icon will change to a stop icon once clicked. Click the stop icon to stop the motor. The motor control values on the Controls and Parameters tab may need to be adjusted depending on the connected motor's specifications. The direction control icon will be disabled while the motor is spinning.", 2, "BasicControlHelp")
        Help.registerTarget(brakeButton, "Click the brake icon to brake the motor. This feature may be disabled for certain motor contorllers", 3, "BasicControlHelp")
        Help.registerTarget(directionButton, "Click this icon to change the direction of the motor. The direction control icon will be disabled while the motor is spinning.", 4, "BasicControlHelp")
        Help.registerTarget(warnings, "Warnings and errors are shown here for events such as Over Current Protection (OCP).", 5, "BasicControlHelp")

        // ------------------------ Default Values ------------------------ //
        // Do this here instead of in PlatformInterface.qml because PIG overwrites values

        // target_speed
        platformInterface.notifications.target_speed.caption = ""
        platformInterface.notifications.target_speed.scales.index_0 = 0
        platformInterface.notifications.target_speed.scales.index_1 = 0
        platformInterface.notifications.target_speed.scales.index_2 = 0
        platformInterface.notifications.target_speed.states = [0]
        platformInterface.notifications.target_speed.value = 0.0
        platformInterface.notifications.target_speed.values = []
        platformInterface.notifications.target_speed.unit = ""
        // target_speed
        platformInterface.notifications.acceleration.caption = ""
        platformInterface.notifications.acceleration.scales.index_0 = 0
        platformInterface.notifications.acceleration.scales.index_1 = 0
        platformInterface.notifications.acceleration.scales.index_2 = 0
        platformInterface.notifications.acceleration.states = [0]
        platformInterface.notifications.acceleration.value = 0.0
        platformInterface.notifications.acceleration.values = []
        platformInterface.notifications.acceleration.unit = ""
        // warnings
        platformInterface.notifications.warning_1.caption = ""
        platformInterface.notifications.warning_1.value = false
        platformInterface.notifications.warning_2.caption = ""
        platformInterface.notifications.warning_2.value = false
        platformInterface.notifications.warning_3.caption = ""
        platformInterface.notifications.warning_3.value = false
        // run, brake, direction
        platformInterface.notifications.run.caption = ""
        platformInterface.notifications.brake.caption = ""
        platformInterface.notifications.direction.caption = ""
    }

    // ======================== UI Objects ======================== //

    ColumnLayout {
        id: sideBarColumn
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        SGText {
            text: "Quick Start Controls"
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            fontSizeMultiplier: .8
            color: "white"
        }

        // ------------------------ Target Speed ------------------------ //

        IconButton {
            id: speedButton
            toolTipText: "Set " + platformInterface.notifications.target_speed.caption.toLowerCase()
            value: platformInterface.notifications.target_speed.value
            unit: platformInterface.notifications.target_speed.unit
            source: "qrc:/images/tach.svg"
            iconOpacity: speedPop.visible ? .5 : 1

            onClicked:  {
                speedPop.visible = !speedPop.visible                
            }

            SliderPopup {
                id: speedPop
                x: parent.width + sideBarColumn.anchors.margins

                value: platformInterface.notifications.target_speed.value
                title: platformInterface.notifications.target_speed.caption
                unit: platformInterface.notifications.target_speed.unit
                to: platformInterface.notifications.target_speed.scales.index_0
                from: platformInterface.notifications.target_speed.scales.index_1
                stepSize: platformInterface.notifications.target_speed.scales.index_2
                // states[0] for non-arrays, SGSlider automatically sets opacity 
                // i.e., state = Disabled (not grayed) set to state = Disabled and Grayed Out
                enabled: !Boolean(platformInterface.notifications.target_speed.states[0])

                onUserSet: {
                    console.log("onUserSet:", value)
                    platformInterface.commands.target_speed.update(
                        speedPop.value
                    )
                }

            }
        }

        // ------------------------ Acceleration ------------------------ //

        IconButton {
            id: accelButton
            toolTipText: "Set " + platformInterface.notifications.acceleration.caption.toLowerCase()
            value: platformInterface.notifications.acceleration.value
            unit: platformInterface.notifications.acceleration.unit
            source: "qrc:/images/tach.svg"
            iconOpacity: accelPop.visible ? .5 : 1

            onClicked:  {
                accelPop.visible = !accelPop.visible
            }
                
            SliderPopup {
                id: accelPop
                x: parent.width + sideBarColumn.anchors.margins

                value: platformInterface.notifications.acceleration.value
                title: platformInterface.notifications.acceleration.caption
                unit: platformInterface.notifications.acceleration.unit
                to: platformInterface.notifications.acceleration.scales.index_0
                from: platformInterface.notifications.acceleration.scales.index_1
                stepSize: platformInterface.notifications.acceleration.scales.index_2
                // states[0] for non-arrays, SGSlider automatically sets opacity 
                // i.e., state = Disabled (not grayed) set to state = Disabled and Grayed Out
                enabled: !Boolean(platformInterface.notifications.acceleration.states[0])

                onUserSet: {
                    console.log("onUserSet:", value)

                    // Template should only need to use this line
                    // platformInterface.commands.acceleration.update(accelPop.value)

                    // MV MDK integrates acceleration into spd_loop_params command so instead:
                    // 1) update secondary acceleration control UI element on Controls and Parameters tab
                    // 2) set platformInterface's acceleration notification value to ensure accelPop.value tracks platformInterface
                    // 3) send spd_loop_params with all required parameters
                    // platformInterface.commands.acceleration.set(accelPop.value)
                    controlsParameters.cp_spd_loop_params_accel.text = String(accelPop.value)
                    platformInterface.notifications.acceleration.value = accelPop.value
                    controlsParameters.send_spd_loop_params()
                }
                
            }
        }

        // ------------------------ Motor Run, Brake, and Direction Buttons ------------------------ //

        // Run
        IconButton {
            id: runButton
            source: run ? "qrc:/images/stop-solid.svg" : "qrc:/images/play-solid.svg"
            iconColor: run ? "#db0909" : "#45e03a"
            toolTipText: platformInterface.notifications.run.caption

            property bool run: false
            
            // states
            Connections {
                target: platformInterface.notifications.run
                onNotificationFinished: {
                    runButton.run = Boolean(platformInterface.notifications.run.value)
                    runButton.enabled = !Boolean(platformInterface.notifications.run.states[0])
                    if (platformInterface.notifications.run.states[0] == 2) {
                        runButton.opacity = 0.5
                    } else {
                        runButton.opacity = 1
                    }
                }
            }

            onClicked:  {
                run = !run
                console.log("onClicked:", run)
                platformInterface.commands.run.update(
                    Number(run)
                )
            }
        }

        // Brake
        IconButton {

            id: brakeButton
            source: "qrc:/images/brake.svg"
            iconColor: brake ? "yellow" : "white"
            toolTipText: platformInterface.notifications.brake.caption
            
            property bool brake: false

            // states
            Connections {
                target: platformInterface.notifications.brake
                onNotificationFinished: {
                    brakeButton.brake = Boolean(platformInterface.notifications.brake.value)
                    brakeButton.enabled = !Boolean(platformInterface.notifications.brake.states[0])
                    if (platformInterface.notifications.brake.states[0] == 2) {
                        brakeButton.opacity = 0.5
                    } else {
                        brakeButton.opacity = 1
                    }
                }
            }

            onClicked:  {
                brake = !brake
                console.log("onClicked:", brake)
                platformInterface.commands.brake.update(
                    Number(brake)
                )
           }
        }

        // Direction
        IconButton {
            id: directionButton
            source: direction ? "qrc:/images/redo-alt-solid.svg" : "qrc:/images/undo.svg"
            toolTipText: platformInterface.notifications.direction.caption
            animationRunning: runButton.run
            animationDirection: direction ? RotationAnimator.Clockwise : RotationAnimator.Counterclockwise

            property bool direction: true // true = CW, false = CCW

            // states
            Connections {
                target: platformInterface.notifications.direction
                onNotificationFinished: {
                    // Ignore control properties if motor is running to avoid direction change
                    if (runButton.run === false) {
                        directionButton.direction = Boolean(platformInterface.notifications.direction.value)
                        directionButton.enabled = !Boolean(platformInterface.notifications.direction.states[0])
                        if (platformInterface.notifications.direction.states[0] == 2) {
                            directionButton.opacity = 0.5
                        } else {
                            directionButton.opacity = 1
                        }
                    }
                }
            }
            // When run notification is received reset default behavior to 
            // ensure direction button is disabled when motor is run 
            Connections {
                target: runButton
                onClicked: {
                    directionButton.enabled = !runButton.run
                    directionButton.opacity = !runButton.run ? 1 : .5                    
                }
            } 

            onClicked:  {
                direction = !direction
                console.log("onClicked:", direction)
                platformInterface.commands.direction.update(
                    Number(direction)
                )
            }
        }

        // ------------------------ Column Sidebar Filler ------------------------ //

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        // ------------------------ Warnings ------------------------ //

        ColumnLayout {
            id: warnings
            spacing: 8

            FaultLight {
                text: platformInterface.notifications.warning_1.caption
                toolTipText: platformInterface.notifications.warning_1.caption
                status: {
                    if (platformInterface.notifications.warning_1.value) {
                        status: SGStatusLight.Red
                    } else {
                        SGStatusLight.Off
                    }
                }
            }

            FaultLight {
                text: platformInterface.notifications.warning_2.caption
                toolTipText: platformInterface.notifications.warning_2.caption
                status: {
                    if (platformInterface.notifications.warning_2.value) {
                        status: SGStatusLight.Red
                    } else {
                        SGStatusLight.Off
                    }
                }
            }

            FaultLight {
                text: platformInterface.notifications.warning_3.caption
                toolTipText: platformInterface.notifications.warning_3.caption
                status: {
                    if (platformInterface.notifications.warning_3.value) {
                        status: SGStatusLight.Red
                    } else {
                        SGStatusLight.Off
                    }
                }
            }
        }

        // ------------------------ Column Sidebar Filler ------------------------ //

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        // ------------------------ Help Messages ------------------------ //

        IconButton {
            id: helpIcon
            source: "qrc:/sgimages/question-circle.svg" // Generic icon from SGWidgets
            iconColor: containsMouse ? "grey" : "lightgrey"

            onClicked:  {
                // Start different help tours depending on which view is visible
                switch (tabBar.currentIndex) {
                case 0:
                    Help.startHelpTour("BasicControlHelp")
                    return
                case 1:
                    Help.startHelpTour("ControlsAndParametersHelp")
                    return
                }
            }
        }
    }
}
