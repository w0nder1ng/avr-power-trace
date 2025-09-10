from time import sleep, time

import serial
import serial.tools.list_ports
from random import randbytes, randrange
from string import ascii_letters

ports = sorted([port.name for port in serial.tools.list_ports.comports()])
port = None
for p in ports:
    if "usbserial" in p or "usbmodem" in p:
        port = "/dev/" + p
print(port)
SPEED = 9600
ser = serial.Serial(port, SPEED, timeout=5)
correct_password = b"REDACTED"
results = {}
sleep(1)
password_guess = b""
# while True:
#     times = {}
#     for c in ascii_letters:
#         total_time = 0
#         c = c.encode()
#         for _ in range(10):
#             ser.write(password_guess+b"\n")
#             start = time()
#             result = ser.readline()
#             # print(result)
#             end = time()
#             total_time+= end - start
#             # print(f"took {end - start} seconds")
#         times[c] = total_time
#     password_guess += max(times, key=times.get)
#     print("\n".join(map(repr, sorted(times.items(), key=lambda p: p[1]))))
#     print(password_guess)
while True:
    # line = input("Enter password:")
    for line in (b"Raaa", b"aaaa"):
        ser.write(line+  b"\n")
        res = ser.readline()
        sleep(0.1)
        # print(res.decode())
ser.close()
