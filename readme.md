Arduino-Build
============
Build script and Makefile for Arduino.

Mithat Konar (<https://mithatkonar.com>)

Description
----------
This project is a simple wrapper for Arduino's own CLI and a simple Makefile for invoking it to build and debug Arduino projects. 

Why another Makefile-based solutions for building Arduino projects? I came up with this one because a project I was working on didn't produce the expected results with [Arduino-Makefile](https://github.com/sudar/Arduino-Makefile), and I needed a solution fast! Since the approach taken here uses the stock Arduino build infrastructure directly, it should be reasonably reliable, though possibly not as fast nor as efficient as other solutions. It's developed and tested on Linux only. Mileage on Mac and Windows will vary.

Requirements
-----------
You'll need a recent installation of the [Arduino IDE](https://www.arduino.cc/en/Main/Software), `make`, and `bash`. If you want to do serial monitoring, you'll also need `gtk-term`.

Configuration
------------
Copy the `Makefile` into the root of your Arduino project. Open this file in a text editor and change the value of the `BB` variable to point to the `arduino-build.sh` script found in this project.

Copy the sample configuration file `arduino.conf.example` to the root of your project directory and rename it `arduino.conf`. Change the variables in `arduino.conf` as described below (with examples):

### Arduino path
The path to the main Arduino installation directory.

    ARDUINO_PATH=/home/mithat/opt/arduino

### Board parameters
Get your board's parameters  from
`<arduino-user-config>/packages/arduino/hardware/avr/1.6.21/boards.txt`
where `<arduino-user-config>` is the users' Arduino configuration directory,
(e.g., `/home/mithat/.arduino15`). Don't get these from the `boards.txt` file found under `ARDUINO_PATH` (above) because that file will not have the most updated board info.

    BOARD_PACKAGE=arduino
    BOARD_ARCHITECTURE=avr
    BOARD=nano
    BOARD_PARAM="cpu=atmega328old"

### Communication settings
The port where the Arduino is connected will change from board to board and from time to time. To find the port your device is using, you can open a terminal and issue the following command for a list of candidates:

    ls /dev/ACM* ; ls /dev/ttyUSB*

One of the devices listed is likely your Arduino. As an alternative or as a last resort you can open the official Arduino IDE and look at what it shows as the active port.

    PORT=/dev/ttyUSB0
    SPEED=19200

Use
---
You can invoke the following Makefile targets:

* `make` or `make build`: compile and build the project (equivalent to "Verify" in the Arduino IDE).
* `make clean`: nuke all the previous build results. You might want to do this if you find really weird compile and/or build errors.
* `make upload`: upload the sketch to the Arduino. This will rebuild the project if needed.
* `make monitor`: start the serial monitor.
* `make upmon`: upload and start the serial monitor.

The configuration file
--------------------
(The conf file is coming soon.)

You'll need to define the following variables in a file called `arduino.conf` in the root directory of your project (with examples):

### Arduino path
The path to the main Arduino installation directory.

    ARDUINO_PATH=/home/mithat/opt/arduino

### Board parameters
Get your board's parameters  from
`<arduino-user-config>/packages/arduino/hardware/avr/1.6.21/boards.txt`
where `<arduino-user-config>` is the users' Arduino configuration directory,
(e.g., `/home/mithat/.arduino15`). Don't get these from the `boards.txt` file found under `ARDUINO_PATH` (above) because that file will not have the most updated board info.

    BOARD_PACKAGE=arduino
    BOARD_ARCHITECTURE=avr
    BOARD=nano
    BOARD_PARAM="cpu=atmega328old"

### Communication settings
The port where the Arduino is connected will change from board to board and from time to time. To find the port your device is using, you can open a terminal and issue the following command for a list of candidates:

    ls /dev/ACM* ; ls /dev/ttyUSB*

One of the devices listed is likely your Arduino. As an alternative or as a last resort you can open the official Arduino IDE and look at what it shows as the active port.

    PORT=/dev/ttyUSB0
    SPEED=19200

