Compiling requires a working AVR toolchain (one is bundled with Arduino, mine is at `~/Library/Arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin` on Mac)

Uploading requires avrdude (the Arduino bundled copy at `~/Library/Arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/bin` worked better than the Homebrew version for me)

If you aren't using a Mac, the relevant locations are [here](https://support.arduino.cc/hc/en-us/articles/4415103213714-Find-sketches-libraries-board-cores-and-other-files-on-your-computer#board-platforms-and-cores).

To run these commands automatically, you need to install [just](https://github.com/casey/just) and then run e.g. `just upload_asm`. Variables like the correct board definition and port are defined in the `Justfile`.

