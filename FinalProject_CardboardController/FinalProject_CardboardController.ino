/*
  Button

  Turns on and off a light emitting diode(LED) connected to digital pin 13,
  when pressing a pushbutton attached to pin 2.

  The circuit:
  - LED attached from pin 13 to ground through 220 ohm resistor
  - pushbutton attached to pin 2 from +5V
  - 10K resistor attached to pin 2 from ground

  - Note: on most Arduinos there is already an LED on the board
    attached to pin 13.

  created 2005
  by DojoDave <http://www.0j0.org>
  modified 30 Aug 2011
  by Tom Igoe

  This example code is in the public domain.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/Button
*/

// constants won't change. They're used here to set pin numbers:
const int buttonPin = 2;  // the number of the pushbutton pin
const int ledPin = 3;    // the number of the LED pin
const int buttonPin2 = 4;
const int ledPin2 = 5;
const int buttonPin3 = 6;
const int ledPin3 = 7;
const int SENSOR = A0;

int val = 0;
int val1 = 0;
int val2 = 0;
int val3 = 0;


// variables will change:
int buttonState = 0;  // variable for reading the pushbutton status
int buttonState1 = 0;
int buttonState2 = 0;

void setup() {
  //initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  // initialize the pushbutton pin as an input:
   Serial.begin(115200);
  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(buttonPin2, INPUT_PULLUP);
  pinMode(buttonPin3, INPUT_PULLUP);
}

void loop() {

  

  val1 = !digitalRead(buttonPin); //reversing logic cuz of input pullup
  // read the state of the pushbutton value:
  if (val1 == HIGH) {
    // turn LED on:
    digitalWrite(ledPin, HIGH);
  } else {
    // turn LED off:
    digitalWrite(ledPin, LOW);
  }

 val2 = !digitalRead(buttonPin2); //reversing logic cuz of input pullup
  // read the state of the pushbutton value:
  if (val2 == HIGH) {
    // turn LED on:
    digitalWrite(ledPin2, HIGH);
  } else {
    // turn LED off:
    digitalWrite(ledPin2, LOW);
  }

   val3 = !digitalRead(buttonPin3); //reversing logic cuz of input pullup
  // read the state of the pushbutton value:
  if (val3 == HIGH) {
    // turn LED on:
    digitalWrite(ledPin3, HIGH);
  } else {
    // turn LED off:
    digitalWrite(ledPin3, LOW);
  }

  val = analogRead(SENSOR);
  val = val / 4;

  delay(50);
  
 // Serial.println(buttonState);
  Serial.write(val);
  Serial.write(val1);
  Serial.write(val2);
  Serial.write(val3);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
 
}

