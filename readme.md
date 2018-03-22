Arduino-Build
============
Build script and Makefile for [Arduino](https://www.arduino.cc).

Mithat Konar (<https://mithatkonar.com>)

Description
----------
This project is a simple wrapper script for [Arduino's CLI](https://github.com/arduino/Arduino/blob/master/build/shared/manpage.adoc) for building and debugging Arduino projects and a simple Makefile to invoke it.

Why another Makefile-based solution for building Arduino projects? I came up with this because my (formerly?) favorite Makefile solution wasn't producing the expected results on a particular project I was working on, and I needed a solution fast! The approach taken here uses the stock Arduino build infrastructure directly, so it should be reasonably reliable -- though possibly not as fast nor as efficient as other solutions. It's developed and tested on Linux only. Mileage on Mac and Windows will vary. I make no claims that this isn't reinventing a wheel, and possibly not very well at that.

License
------
This project's code is published under the [GNU Lesser General Pulic License v3](https://www.gnu.org/licenses/lgpl-3.0.en.html). Documentation is published under the [GNU Free Documentation License](https://www.gnu.org/licenses/fdl.html).

Requirements
-----------
Currently, only Linux is supported. You'll need a recently installed and updated [Arduino IDE](https://www.arduino.cc/en/Main/Software), `make`, and `bash`. If you want to do serial monitoring, you'll also need `gtk-term`.

Caveats
-------
In time, the following should get addressed, but here are some known issues:

* This package hasn't been thoroughly tested across a range of Arduino devices.
* The way the configuration file is brought into the main script currently lacks security checking. Any executable bash code that appears in the config file will be executed when the `arduino-script` is executed. Until this is addressed, use this only in an environment that you have direct and exclusive control of.

Setup
------------
* Copy two files to the root of your Arduino project: `Makefile` and `arduino.conf.example`.
* Open the `Makefile` you copied in a text editor and change the value of the `BB` variable to point to the `arduino-build` script found in this project.
* Rename the `arduino.conf.example` you copied to `arduino.conf`. Then change the variables in `arduino.conf` as described below (with examples):

### arduino.conf variables
#### Arduino path

    ARDUINO_PATH=/home/username/opt/arduino

The path to the main Arduino installation directory.

#### Board parameters

    BOARD_PACKAGE=arduino
    BOARD_ARCHITECTURE=avr
    BOARD=nano
    BOARD_PARAM="cpu=atmega328old"

Get these values  from `<arduino-user-config>/packages/` where `<arduino-user-config>` is the users' Arduino configuration directory,
(e.g., `/home/username/.arduino15`). **Don't get these from the `hardware` directory found under `ARDUINO_PATH` because that will not have the most updated board info.**

Adapted from the [Arduino man page]((https://github.com/arduino/Arduino/blob/master/build/shared/manpage.adoc)):

* `BOARD_PACKAGE` is the identifier of the vendor (the first level folders inside the `packages` directory). Default Arduino boards use `arduino`.
* `BOARD_ARCHITECTURE` is the architecture of the board (the first subdirectory under `../packages/$BOARD_PACKAGE/hardware`). Default arduino boards use `avr` for all AVR-based boards (like Uno, Mega or Leonardo) or `sam` for 32bit SAM-based boards (like Arduino Due).
* `BOARD` is the actual board to use, as defined in `boards.txt` found in `../packages/$BOARD_PACKAGE/hardware/$BOARD_ARCHITECTURE/<version-num>`. For example, `uno` for the Arduino Uno, `diecimila` for the Arduino Duemilanove or Diecimila, or `mega` for the Arduino Mega.
* `BOARD_PARAM` is a comma-separated list of boards specific parameters that are normally shown under submenus of the "Tools" menu. For example `cpu=atmega168` to Select the mega168 variant of the Arduino Nano board. You can also get these from the `boards.txt` file. They can be tricky to get right!

#### Communication settings
    PORT=/dev/ttyUSB0
    SPEED=9600

The `PORT` where the Arduino is connected will change from board to board and from time to time. To find the port your device is using, you can open a terminal and issue the following command for a list of candidates:

```bash
ls /dev/ACM* ; ls /dev/ttyUSB*
```

One of the devices listed is likely your Arduino. As an alternative or as a last resort you can open the official Arduino IDE and look at what it shows as the active port.

`SPEED` is the baud rate you want Serial communication to happen at.

Use
-----
You can invoke the following Makefile targets:

* `make` or `make build`: compile and build the project (equivalent to "Verify" in the Arduino IDE).
* `make clean`: nuke all the previous build results. You might want to do this if you find really weird compile and/or build errors.
* `make upload`: upload the sketch to the Arduino. This will rebuild the project if needed.
* `make monitor`: start the serial monitor.
* `make upmon`: upload and start the serial monitor.

You can also invoke the `arduino-build` script directly as

```bash
/path/to/arduino-build <option>
```

where `<option>` is one of:

* `build`: compile and build the project (equivalent to "Verify" in the Arduino IDE).
* `clean`: nuke all the previous build results. You might want to do this if you find really weird compile and/or build errors.
* `upload`: upload the sketch to the Arduino. This will rebuild the project if needed.
* `monitor`: start the serial monitor.

Note that there is no `upmon` option.

Copyright © 2018 [Mithat Konar](https://mithatkonar.com)
