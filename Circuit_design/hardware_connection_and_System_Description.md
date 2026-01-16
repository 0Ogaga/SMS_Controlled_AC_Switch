# Hardware Connections and System Description

**Project:** SMS Controlled AC Switch  
**Controller:** ESP32  
**Communication:** GSM (SIM800L)  
**Load Type:** 220 V AC  

---

## 1. System Overview

The system allows a 220 V AC load to be switched **ON** or **OFF** remotely using SMS commands.  
An ESP32 microcontroller communicates with a GSM module (SIM800L) via UART.  
A relay module provides electrical isolation between the low-voltage control circuitry and the high-voltage AC load.

---

## 2. Power Supply Connections

| Component | Pin | Connected To | Description |
|---------|-----|-------------|------------|
| 5 V DC Supply | +5 V | ESP32 VIN | Primary supply for ESP32 |
| 5 V DC Supply | +5 V | Buck Converter IN | Input to step-down converter |
| Buck Converter | 4 V OUT | SIM800L VCC | GSM module supply |
| All Modules | GND | Common Ground | Shared reference for low-voltage circuit |

---

## 3. ESP32 ↔ GSM Module (SIM800L)

| ESP32 Pin | SIM800L Pin | Additional Circuit | Purpose |
|----------|-------------|-------------------|--------|
| GPIO16 (RX2) | TXD | Direct connection | Receive SMS data |
| GPIO17 (TX2) | RXD | 1 kΩ / 2.2 kΩ voltage divider | Level shifting (3.3 V → ~2.8 V) |
| GND | GND | Direct | Common ground |

**Note:**  
The SIM800L requires a stable **3.8–4.2 V** power supply and high peak current during GSM transmission.

---

## 4. Status Indicator LEDs

| ESP32 Pin | Component | Series Resistor | Function |
|----------|-----------|----------------|----------|
| GPIO12 | Green LED | 220 Ω | Power ON indicator |
| GPIO14 | LED | 220 Ω | SMS reception indicator |

---

## 5. Relay Module Connections

| ESP32 Pin | Relay Module Pin | Function |
|----------|------------------|----------|
| GPIO4 | IN | Relay control signal |
| 5 V | VCC | Relay power |
| GND | GND | Ground reference |

---

## 6. AC Load Connections (High Voltage Side)

| Relay Terminal | Connected To | Description |
|---------------|-------------|------------|
| COM | AC Live (L) | Incoming live wire |
| NO | Load Live | Switched output to load |
| Neutral | Direct to Load | Neutral not switched |

**Safety Notice:**  
The relay provides electrical isolation between the low-voltage control circuit and the 220 V AC mains.  
Only the **live** wire is switched; the **neutral** wire remains directly connected to the load.

---

## 7. Functional Summary

- SMS commands are received by the GSM module.  
- The ESP32 authenticates the sender and processes the command.  
- The relay module switches the AC load accordingly.  
- Status LEDs provide visual feedback for power and SMS reception.

---

## 8. Design Notes

- GSM module power supply must support high current bursts.  
- Relay logic level (active-HIGH or active-LOW) must be verified during simulation.  
- All low-voltage grounds are common.

---
