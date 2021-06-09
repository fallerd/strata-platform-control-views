import QtQuick 2.12

import tech.strata.sgwidgets 1.0

UIBase { // start_uibase

    // General settings 
    columnCount: 30
    rowCount: 25

    // Objects shared between QML files
    property alias b_title: b_title
    property alias b_subtitle: b_subtitle

    // UI objects
    LayoutText { // start_8695e
        id: b_title
        layoutInfo.uuid: "8695e"
        layoutInfo.columnsWide: 28
        layoutInfo.rowsTall: 1
        layoutInfo.xColumns: 1
        layoutInfo.yRows: 0

        text: "BLDC Motor Drive EVB for 30-60V 1200W Applications"
        fontSizeMode: Text.Fit
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#000000"
    } // end_8695e

    LayoutText { // start_bb4f0
        id: b_subtitle
        layoutInfo.uuid: "bb4f0"
        layoutInfo.columnsWide: 28
        layoutInfo.rowsTall: 1
        layoutInfo.xColumns: 1
        layoutInfo.yRows: 1

        text: "Part of the Motor Development Kit (MDK) Family"
        fontSizeMode: Text.Fit
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#7f7f7f"
    } // end_bb4f0

    LayoutRectangle { // start_6a35c
        id: rect_6a35c
        layoutInfo.uuid: "6a35c"
        layoutInfo.columnsWide: 7
        layoutInfo.rowsTall: 15
        layoutInfo.xColumns: 1
        layoutInfo.yRows: 3

        color: "#ffffff"
        border.width: 3
    } // end_6a35c

    LayoutDivider { // start_c0d6c
        id: divider_c0d6c
        layoutInfo.uuid: "c0d6c"
        layoutInfo.columnsWide: 7
        layoutInfo.rowsTall: 2
        layoutInfo.xColumns: 1
        layoutInfo.yRows: 3
    } // end_c0d6c

    LayoutRectangle { // start_bead4
        id: layoutRectangle_bead4
        layoutInfo.uuid: "bead4"
        layoutInfo.columnsWide: 20
        layoutInfo.rowsTall: 15
        layoutInfo.xColumns: 9
        layoutInfo.yRows: 3

        color: "#ffffff"
        border.width: 3
    } // end_bead4

    LayoutText { // start_6d841
        id: layoutText_6d841
        layoutInfo.uuid: "6d841"
        layoutInfo.columnsWide: 5
        layoutInfo.rowsTall: 1
        layoutInfo.xColumns: 2
        layoutInfo.yRows: 3

        text: "Input"
        fontSizeMode: Text.Fit
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#000000"
    } // end_6d841

    LayoutText { // start_aad3b
        id: layoutText_aad3b
        layoutInfo.uuid: "aad3b"
        layoutInfo.columnsWide: 5
        layoutInfo.rowsTall: 1
        layoutInfo.xColumns: 16
        layoutInfo.yRows: 3

        text: "Output"
        fontSizeMode: Text.Fit
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#000000"
    } // end_aad3b

    LayoutDivider { // start_ef0b6
        id: layoutDivider_ef0b6
        layoutInfo.uuid: "ef0b6"
        layoutInfo.columnsWide: 20
        layoutInfo.rowsTall: 2
        layoutInfo.xColumns: 9
        layoutInfo.yRows: 3
    } // end_ef0b6

    LayoutSGCircularGauge { // start_7b02e
        id: b_actual_speed
        layoutInfo.uuid: "7b02e"
        layoutInfo.columnsWide: 10
        layoutInfo.rowsTall: 15
        layoutInfo.xColumns: 10
        layoutInfo.yRows: 3

        unitText: "RPM"
        minimumValue: 0
        maximumValue: 10000
        tickmarkStepSize: 1000
        value: 7000

        function lerpColor (color1, color2, x){
            if (Qt.colorEqual(color1, color2)){
                return color1;
            } else {
                return Qt.hsva(
                    color1.hsvHue * (1 +  x) + color2.hsvHue * x,
                    color1.hsvSaturation * (1 + x) + color2.hsvSaturation * x,
                    color1.hsvValue * (1 + x) + color2.hsvValue * x, 1
                    );
            }
        }

        // TODO: actual_speed_caption

    } // end_7b02e

    LayoutSGCircularGauge { // start_116ab
        id: b_board_temp
        layoutInfo.uuid: "116ab"
        layoutInfo.columnsWide: 5
        layoutInfo.rowsTall: 9
        layoutInfo.xColumns: 23
        layoutInfo.yRows: 7

        unitText: "C"
        minimumValue: 0
        maximumValue: 140
        tickmarkStepSize: 20
        value: 23.0

        function lerpColor (color1, color2, x){
            if (Qt.colorEqual(color1, color2)){
                return color1;
            } else {
                return Qt.hsva(
                    color1.hsvHue * (1 +  x) + color2.hsvHue * x,
                    color1.hsvSaturation * (1 + x) + color2.hsvSaturation * x,
                    color1.hsvValue * (1 + x) + color2.hsvValue * x, 1
                    );
            }
        }

        // TODO: board_temp_caption

    } // end_116ab

    LayoutSGCircularGauge { // start_b06c4
        id: b_input_voltage
        layoutInfo.uuid: "b06c4"
        layoutInfo.columnsWide: 5
        layoutInfo.rowsTall: 9
        layoutInfo.xColumns: 2
        layoutInfo.yRows: 7

        unitText: "V"
        minimumValue: 0
        maximumValue: 100
        tickmarkStepSize: 10
        value: 48

        function lerpColor (color1, color2, x){
            if (Qt.colorEqual(color1, color2)){
                return color1;
            } else {
                return Qt.hsva(
                    color1.hsvHue * (1 +  x) + color2.hsvHue * x,
                    color1.hsvSaturation * (1 + x) + color2.hsvSaturation * x,
                    color1.hsvValue * (1 + x) + color2.hsvValue * x, 1
                    );
            }
        }

        // TODO: input_voltage_caption

    } // end_b06c4

    LayoutContainer { // start_abcde
        id: b_status_log
        layoutInfo.uuid: "abcde"
        layoutInfo.columnsWide: 28
        layoutInfo.rowsTall: 5
        layoutInfo.xColumns: 1
        layoutInfo.yRows: 19
        contentItem: SGStatusLogBox {
            title: "Status Log"
            Component.onCompleted: {
                // for (let i = 0; i < 10; i++){
                //     append("Message " + i)
                // }
                append("Thu, 03 Jun 2021 01:04:05: Motor was started with target speed of 1234 RPM")
                append("Thu, 03 Jun 2021 01:04:05: Motor brake was engaged")
                append("Thu, 03 Jun 2021 01:04:05: Detected short on motor output windings")
                append("Thu, 03 Jun 2021 01:04:05: Over current event occurred")
                append("Thu, 03 Jun 2021 01:04:05: Motor was started with target speed of 1234 RPM")
                append("Thu, 03 Jun 2021 01:04:05: Motor brake was engaged")
                append("Thu, 03 Jun 2021 01:04:05: Detected short on motor output windings")
                append("Thu, 03 Jun 2021 01:04:05: Over current event occurred")
                append("Thu, 03 Jun 2021 01:04:05: Motor was started with target speed of 1234 RPM")
                append("Thu, 03 Jun 2021 01:04:05: Motor brake was engaged")
                append("Thu, 03 Jun 2021 01:04:05: Detected short on motor output windings")
                append("Thu, 03 Jun 2021 01:04:05: Over current event occurred")
            }
        }
    } // end_abcde


    LayoutText { // start_f52c7
        id: b_input_voltage_caption
        layoutInfo.uuid: "f52c7"
        layoutInfo.columnsWide: 5
        layoutInfo.rowsTall: 1
        layoutInfo.xColumns: 2
        layoutInfo.yRows: 15

        text: "Input Voltage (V)"
        fontSizeMode: Text.Fit
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#000000"
    } // end_f52c7

    LayoutText { // start_18cff
        id: b_actual_speed_caption
        layoutInfo.uuid: "18cff"
        layoutInfo.columnsWide: 4
        layoutInfo.rowsTall: 1
        layoutInfo.xColumns: 13
        layoutInfo.yRows: 16

        text: "Actual Speed (RPM)"
        fontSizeMode: Text.Fit
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#000000"
    } // end_18cff

    LayoutText { // start_d490f
        id: b_board_temp_caption
        layoutInfo.uuid: "d490f"
        layoutInfo.columnsWide: 5
        layoutInfo.rowsTall: 1
        layoutInfo.xColumns: 23
        layoutInfo.yRows: 15

        text: "MOSFET Temp (C)"
        fontSizeMode: Text.Fit
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#000000"
    } // end_d490f
} // end_uibase