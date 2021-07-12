# Strata Platform Control Views
This repository contains control views for each platform.

## Requirements

### Windows
  * Git Bash >= 2.28.0
  * CMake >= 3.19
  * Qt5 5.12.xx
  * Visual Studio Build Tools 2017
### MacOS
  * Xcode and Command Line Tools
  * Git >= 2.28.0
  * Qt5 5.12.xx
  * CMake >= 3.19

## Qt5 installation

Download and install Qt5 version 5.12.xx

The following Qt5 components are required:

### Windows
* MSVC 2017 64-bit

### MacOS
* macOS

## Build and Integration Instructions
* To build views you may use `./bootstrap-views.sh`
* To integrate the views with `Strata Developer Studio` build, you may clone this repository under `components` directory of Strata Host Core repository and start the build process of `Strata Developer studio`.

## Contributions
You may contribute in various ways such as reporting a bug, open a PR, or share your thoughts.

For pull requests, please follow the steps below:
  * Keep it simple.
  * Keep it consistence with the design.
  * Must be loadable to Strata Developer Studio with no errors nor warnings.

TBD - if there is any other input from legal team.

## License
TBD - legal team