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
| All M
