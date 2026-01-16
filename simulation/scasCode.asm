// SMS CONTROLLED AC SWITCH PROGRAM


// Variables
int powerLed = 12;  // Indicates that the device is powered ON.
int smsLed = 14;    // Indicates that an sms has been received.
int relay = 4;      // To control the relay.
HardwareSerial simModule(1);
String senderNum = "";
String authorizedNum = "+2349055046572";
String receivedSMS = "";
String message = "";

// Setup
void setup(){
  // Set pin modes.
  pinMode(powerLed, OUTPUT);
  pinMode(smsLed, OUTPUT);
  pinMode(relay, OUTPUT);

  // Set initial state of the components.
  digitalWrite(powerLed, HIGH);
  digitalWrite(smsLed, LOW);
  digitalWrite(relay, LOW);

  // Set the monitor in order to see output readings.
  Serial.begin(9600);
  
  // Set the SIM module to start.
  simModule.begin(9600, SERIAL_8N1, 16, 17); 
  delay(3000);

  // Check the sim module if it is active.
  simModule.println("AT");                 
  delay(3000);

  // Set the sim module to text mode.
  simModule.println("AT+CMGF=1");
  delay(3000);

  // Set the sim module to send text directly to the microcontroller.
  simModule.println("AT+CNMI=1,2,0,0,0");
  delay(3000);

} // Close setup.

// Loop
void loop(){
  // Check if sms is available
  if(Serial.available()){

    // Clear old data
    senderNum = "";
    authorizedNum = "+2349055046572";
    receivedSMS = "";
    message = "";

    // Read sim module.
    message = Serial.readStringUntil('\n');

    // Trim message, removing new line character.
    message.trim();
    // Convert to uppercase
    message.toUpperCase();

    // Blink LED to indicate entry of SMS.
    for(int i=0; i<3; i++){
      digitalWrite(smsLed, HIGH);
      delay(500);
      digitalWrite(smsLed, LOW);
      delay(500);
    }
      // Compare message to keywords
      if(message == "ON"){          
        digitalWrite(smsLed, HIGH);
        digitalWrite(relay, HIGH);
      }
      else if(message=="OFF"){     
        digitalWrite(smsLed, LOW);
        digitalWrite(relay, LOW);
      }
    // }

  } // Close check for SMS
  
} // Close loop.
