#include <stdint.h>

void setup() { pinMode(13, OUTPUT); }

void loop() {
  volatile uint32_t mask = 0x00aa00aa;
  while (1) {
    digitalWrite(13, HIGH);

    uint32_t data = 0;
    for (volatile uint32_t i = 0; i < 1000; i++) {
      data |= mask;
    }
    digitalWrite(13, LOW);
    delay(10);
  }
}
