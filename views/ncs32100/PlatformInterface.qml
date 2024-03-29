/*
 * Copyright (c) 2018-2021 onsemi.
 *
 * All rights reserved. This software and/or documentation is licensed by onsemi under
 * limited terms and conditions. The terms and conditions pertaining to the software and/or
 * documentation are available at http://www.onsemi.com/site/pdf/ONSEMI_T&C.pdf (“onsemi Standard
 * Terms and Conditions of Sale, Section 8 Software”).
 */
import QtQuick 2.12
import QtQuick.Controls 2.12
import tech.strata.common 1.0
import QtQml 2.12


/******************************************************************
  * File auto-generated by PlatformInterfaceGenerator on 2021-01-08 12:50:03.217 UTC-08:00
******************************************************************/

PlatformInterfaceBase {
    id: platformInterface
    apiVersion: 2

    property alias notifications: notifications
    property alias commands: commands
    property var commands_inprocess: false

    /******************************************************************
      * NOTIFICATIONS
    ******************************************************************/

    QtObject {
        id: notifications

        // @notification: get_data
        // @property accel: double
        // @property pos: double
        // @property turns: int
        // @property vel: double
        property QtObject get_data: QtObject {
            property double pos: 0
            property int turns: 0
            property double vel: 0.0
            property double accel: 0.0
            property double time: 0.0

            signal notificationFinished()
        }

        // @notification: get_errors
        // @property low_bat: int
        // @property no_power: int
        // @property overflow: int
        // @property overspeed: int
        // @property sensor_error: int
        property QtObject get_errors: QtObject {
            property int low_bat: 0
            property int no_power: 0
            property int overflow: 0
            property int overspeed: 0
            property int sensor_error: 0
            property int over_temp: 0
            property int batt_alarm: 0

            signal notificationFinished()
        }

        // @notification: get_temperature
        // @property temperature: double
        property QtObject get_temperature: QtObject {
            property double temperature: 0.0

            signal notificationFinished()
        }

        // @notification: get_battv
        // @property battv: double
        property QtObject get_battv: QtObject {
            property double battv: 0.0

            signal notificationFinished()
        }

        property QtObject get_firmware_version: QtObject {
            property int version: 0

            signal notificationFinished()
        }

        // @notification: reset_position
        // @property position: int
        property QtObject reset_position: QtObject {
            property int position: 0

            signal notificationFinished()
        }

        // @notification: reset_turns
        // @property turns: int
        property QtObject reset_turns: QtObject {
            property int turns: 0

            signal notificationFinished()
        }

        property QtObject get_lowbattv: QtObject {
            property double lowbatt_threshold: 0.0

            signal notificationFinished()
        }

        property QtObject get_maxtemp: QtObject {
            property int maxtemp_threshold: 0

            signal notificationFinished()
        }

        property QtObject set_low_batt: QtObject {
            property double battv_threshold: 0.0

            signal notificationFinished()
        }

        property QtObject set_over_temp: QtObject {
            property int temp_threshold: 0

            signal notificationFinished()
        }


        // @notification: reset_errors
        // @property low_bat: int
        // @property no_power: int
        // @property overflow: int
        // @property overspeed: int
        // @property sensor_error: int

        //update reset_errors to include
        property QtObject reset_errors: QtObject {
            property int low_bat: 0
            property int no_power: 0
            property int overflow: 0
            property int overspeed: 0
            property int sensor_error: 0
            property int over_temp: 0
            property int batt_alarm: 0

            signal notificationFinished()
        }

        // @notification: set_batt_alarmv
        // @property alarmv: double
        property QtObject set_batt_alarmv: QtObject {
            property double alarmv: 0.0

            signal notificationFinished()
        }

        property QtObject set_velocity_resolution: QtObject {
            property int velocity_resolution: 0

            signal notificationFinished()
        }
        property QtObject set_acceleration_resolution: QtObject {
            property int acceleration_resolution: 0

            signal notificationFinished()
        }
    }

    /******************************************************************
      * COMMANDS
    ******************************************************************/

    QtObject {
        id: commands
        // @command get_errors
        property var get_errors: ({
                                      "cmd": "get_errors",
                                      update: function () {
                                          this.send(this)
                                      },
                                      send: function () { platformInterface.send(this) }
                                  })

        // @command get_data
        property var get_data: ({
                                    "cmd": "get_data",
                                    update: function () {
                                        this.send(this)
                                    },
                                    send: function () { platformInterface.send(this) }
                                })

        // @command get_temperature
        property var get_temperature: ({
                                           "cmd": "get_temperature",
                                           update: function () {
                                               this.send(this)
                                           },
                                           send: function () { platformInterface.send(this) }
                                       })

        // @command get_battv
        property var get_battv_value: ({
                                           "cmd": "get_battv",
                                           update: function () {
                                               this.send(this)
                                           },
                                           send: function () { platformInterface.send(this) }
                                       })

        property var get_lowbattv: ({
                                        "cmd": "get_lowbattv",
                                        update: function () {
                                            this.send(this)
                                        },
                                        send: function () { platformInterface.send(this) }
                                    })


        property var get_maxtemp: ({
                                       "cmd": "get_maxtemp",
                                       update: function () {
                                           this.send(this)
                                       },
                                       send: function () { platformInterface.send(this) }
                                   })

        property var get_firmware_version: ({
                                                "cmd": "get_firmware_version",
                                                update: function () {
                                                    this.send(this)
                                                },
                                                send: function () { platformInterface.send(this) }
                                            })


        // @command reset_position
        property var reset_position: ({
                                          "cmd": "reset_position",
                                          update: function () {
                                              this.send(this)
                                          },
                                          send: function () { platformInterface.send(this) }
                                      })

        // @command reset_turns
        property var reset_turns: ({
                                       "cmd": "reset_turns",
                                       update: function () {
                                           this.send(this)
                                       },
                                       send: function () { platformInterface.send(this) }
                                   })

        // @command reset_errors
        property var reset_errors: ({
                                        "cmd": "reset_errors",
                                        update: function () {
                                            this.send(this)
                                        },
                                        send: function () { platformInterface.send(this) }
                                    })

        // @command set_batt_alarmv
        // @property alarmv: double
        property var set_batt_alarmv: ({
                                           "cmd": "set_batt_alarmv",
                                           "payload": {
                                               "alarmv": 0.0
                                           },
                                           update: function (alarmv) {
                                               this.set(alarmv)
                                               this.send(this)
                                           },
                                           set: function (alarmv) {
                                               this.payload.alarmv = alarmv
                                           },
                                           send: function () { platformInterface.send(this) }
                                       })


        // is this used for Low Battery \nThreshold (V)  ??
        // @command set_batt_alarmv
        // @property alarmv: double
        property var set_low_batt: ({
                                        "cmd": "set_low_batt",
                                        "payload": {
                                            "battv_threshold": 0.0
                                        },
                                        update: function (battv_threshold) {
                                            this.set(battv_threshold)
                                            this.send(this)
                                        },
                                        set: function (battv_threshold) {
                                            this.payload.battv_threshold = battv_threshold
                                        },
                                        send: function () { platformInterface.send(this) }
                                    })

        property var set_over_temp: ({
                                         "cmd": "set_over_temp",
                                         "payload": {
                                             "temp_threshold": 0
                                         },
                                         update: function (temp_threshold) {
                                             this.set(temp_threshold)
                                             this.send(this)
                                         },
                                         set: function (temp_threshold) {
                                             this.payload.temp_threshold = temp_threshold
                                         },
                                         send: function () { platformInterface.send(this) }
                                     })

        property var set_velocity_resolution: ({
                                                   "cmd": "set_velocity_resolution",
                                                   "payload": {
                                                       "velocity_resolution":18
                                                   },
                                                   update: function (velocity_resolution) {
                                                       this.set(velocity_resolution)
                                                       this.send(this)
                                                   },
                                                   set: function (velocity_resolution) {
                                                       this.payload.velocity_resolution = velocity_resolution
                                                   },
                                                   send: function () { platformInterface.send(this) }
                                               })

//        property var set_acceleration_resolution: ({
//                                                       "cmd": "set_acceleration_resolution",
//                                                       "payload": {
//                                                           "acceleration_resolution":18
//                                                       },
//                                                       update: function (acceleration_resolution) {
//                                                           this.set(acceleration_resolution)
//                                                           this.send(this)
//                                                       },
//                                                       set: function (acceleration_resolution) {
//                                                           this.payload.acceleration_resolution = acceleration_resolution
//                                                       },
//                                                       send: function () { platformInterface.send(this) }
//                                                   })



    }
}
