board := "pro"
flags := "--verbose"
# flags := "--build-property build.extra_flags=-O0 --verbose"
port :=  "/dev/cu.usbserial-130"
# port :=  "/dev/cu.usbserial-1130"
core_path := "~/Library/Caches/arduino/cores/arduino_avr_pro_46fe4eb87ed95e1eb730d64a8a94a969/core.a"
asm := "power_trace"

clean:
    rm -r target/

build_asm:
    if [ ! -d target ]; then mkdir target; fi
    avr-gcc -DF_CPU=8000000UL -mmcu=atmega328p -E {{asm}}.S -o target/{{asm}}.s
    avr-gcc -mmcu=atmega328p -nostdlib -g -c target/{{asm}}.s -o target/{{asm}}.o
    avr-ld target/{{asm}}.o -o target/{{asm}}.elf
    avr-objcopy -O ihex target/{{asm}}.elf target/{{asm}}.hex



upload_asm: build_asm
    avrdude -C avrdude.conf -p atmega328p -c arduino -P {{port}} -b 57600 -D -U flash:w:./build/{{asm}}.hex:i

build:
    arduino-cli compile {{flags}} --fqbn arduino:avr:{{board}} power_trace.ino

upload: build
    arduino-cli upload {{flags}} --fqbn arduino:avr:{{board}} -p {{port}} power_trace.ino

monitor: upload
    arduino-cli monitor --fqbn arduino:avr:{{board}} -p {{port}}
