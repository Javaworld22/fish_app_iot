from machine import UART, Pin, I2C, ADC
import time, utime
import dht
from DIYables_MicroPython_LCD_I2C import LCD_I2C
#import RPi.GPIO as GPIO
import sys
print(sys.version)




I2C_ADDR = 0X27
LCD_ROWS = 4
LCD_COLS = 20
RED_LED = 10    # Change to your actual GPIO pin
GREEN_LED = 11  # Change to your actual GPIO pin
GAS_WARNING = 25
GAS_DANGER  = 50


red_led = Pin(RED_LED, Pin.OUT)    # Change pin numbers as needed
green_led = Pin(GREEN_LED, Pin.OUT)


def led_red():
    red_led.value(1)
    green_led.value(0)

def led_green():
    red_led.value(1)
    green_led.value(0)

def led_off():
    red_led.value(1)
    green_led.value(1)


# Wi-Fi credentials
SSID = "project"
password = "1234567890"
api_key = 'WHS25VSSTD7D7VDWTK'
# location ='Oporto'
field = 'field1'
quant = 26
url = f'/update?api_key=WHS25VSSTD7D7VDWTK&{field}={quant}'
host = 'api.thingspeak.com'
data = {'temp': 26}

# Configure UART for communication with ESP8285
esp_uart = UART(0, 115200)


i2c = I2C(1, sda=Pin(14), scl=Pin(15), freq=400000)
lcd = LCD_I2C(i2c, I2C_ADDR, LCD_ROWS, LCD_COLS)

# measures Temp and Pressure
sensor1 = dht.DHT11(Pin(13))

# Connect to ADC
adc_pin = ADC(26)

def esp_init():
    esp_uart.write('+++')   # Exit transparent mode if in it
    time.sleep(1)
    if esp_uart.any() > 0:
        esp_uart.read()
    if not esp_sendCMD("AT", "OK"):
        print("ESP8285 not responding")
        return False
    if not esp_sendCMD("AT+CWMODE=1", "OK"):
        print("Failed to set WiFi mode")
        return False
    if not esp_sendCMD(f'AT+CWJAP="{SSID}","{password}"', "OK", 20000):
        print("Failed to connect to WiFi")
        return False
    if not esp_sendCMD("AT+CIPMODE=0", "OK"):  # Ensure normal mode is set
        print("Failed to set normal mode")
        return False
    return True


# Function to send AT commands
def esp_sendCMD(cmd, ack, timeout=5000):
    esp_uart.write(cmd + '\r\n')
    i_t = utime.ticks_ms()
    while (utime.ticks_ms() - i_t) < timeout:
        s_get = esp_uart.read()
        if s_get:
            s_get = s_get.decode()
            print(s_get)
            if s_get.find(ack) >= 0:
                return True
    return False
    
    
def buzzer_beep(times=3, on_ms=200, off_ms=200):
    for _ in range(times):
        buzzer.value(1)
        time.sleep_ms(on_ms)
        buzzer.value(0)
        time.sleep_ms(off_ms)
        
def buzzer_off():
    buzzer.value(0)


# Function to send HTTP GET request
def send_post_request(host, url, data):
    # Close any previous connections
    esp_sendCMD("AT+CIPCLOSE", "OK")

    if not esp_sendCMD(f'AT+CIPSTART="TCP","{host}",80', "OK", 10000):
        print("Failed to start TCP connection")
        return False

    http_request = (
        "GET {} HTTP/1.1\r\n"
        "Host: {}\r\n"
        "Content-Type: text/plain\r\n"
        "Content-Length: {}\r\n"
        "\r\n"
        "{}\r\n"
    ).format(url, host, len(data), data)
    

    if not esp_sendCMD(f'AT+CIPSEND={len(http_request)}', ">"):
        print("Failed to initiate sending data")
        return False

    esp_uart.write(http_request)
    print("HTTP GET request sent")
    return True

if esp_init():
        print("ESP8285 initialized and connected to WiFi")
else:
    print("Failed to initialize ESP8285")

led_red()                        
lcd.backlight_on()
lcd.clear()
lcd.set_cursor(0, 0)
lcd.print("Tech Wiz")
lcd.set_cursor(0, 1)
lcd.print("Smart Villa")
time.sleep(3)

lcd.clear()
led_green()                      
lcd.set_cursor(0, 0)
lcd.print("Iot Project")
lcd.set_cursor(0, 1)
lcd.print("03-06-2026")
time.sleep(2)

lcd.clear()
led_off()    
while True:
    
    try:
        sensor1.measure()
        temp = sensor1.temperature()
        humidity = sensor1.humidity()
        analogue_reading = adc_pin.read_u16()
        ppm = 100 * (analogue_reading / (65536 - 15000))
        
        if ppm >= GAS_DANGER:
            led_red()
            buzzer_beep(times=10, on_ms=100, off_ms=100)  # rapid alarm
            lcd.set_cursor(0, 2)
            lcd.print("!! GAS DANGER !!")
        elif ppm >= GAS_WARNING:
            led_red()
            buzzer_beep(times=3, on_ms=300, off_ms=300)   # slow warning beep
            lcd.set_cursor(0, 2)
            lcd.print("  Gas Warning   ")
        else:
            led_green()
            buzzer_off()
            lcd.set_cursor(0, 2)
            lcd.print("  Air Normal    ")
        
        print("Temperature in celcuis: %3.1f C" %temp)
        print("Humidity: %3.1f %%" %humidity)
        print("Gasses: %d ppm" %f_air)
        lcd.set_cursor(0, 0);            
        lcd.print("Temp (C): %3.1f C" %temp);
        lcd.set_cursor(0, 1);            
        lcd.print("Humidity: %3.1f %%" %humidity);
        time.sleep(2)
        lcd.clear()
        lcd.set_cursor(0, 0);
        
        lcd.print("Gasses: %d ppm" %f_air);  
        time.sleep(2)
    except OSError as e:
        print("Failed to read Sensor")
    
