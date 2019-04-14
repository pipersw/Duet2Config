; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2 on Mon Apr 08 2019 13:38:58 GMT+0200 (heure d’été d’Europe centrale)

; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

; Network
M550 P"AM8"                       ; Set machine name
M552 S1                                  ; Enable network
;*** Access point is configured manually via M587
M586 P0 S1                               ; Enable HTTP
M586 P1 S0                               ; Disable FTP
M586 P2 S0                               ; Disable Telnet

; Drives
M569 P0 S1 F3                            ; Drive 0 goes forwards (X) Toff:8
M569 P1 S1 F3                            ; Drive 1 goes forwards (Y) Toff:7
M569 P2 S0 F3                            ; Drive 2 goes backwards (Z) Toff:3
M569 P3 S1 F7                            ; Drive 3 goes forwards (E0) Toff:7

; for Bed levelling using multiple independent Z motor drivers
;M569 P4 S0 F3                           ; Drive 4 goes backwards (Z) Toff:3

;M584 X0 Y1 Z2:4 E3                      ; two Z motors connected to driver outputs Z and E1
;M671 X-74:294 Y105:105 S1.0             ; leadscrews at left and right of X axis, 1mm compensation max

; Using the manual bed levelling assistant using single Z motor driver 
;M671 X5:215:5:215 Y5:5:215:215 P0.5      ; adjusting screws at front left (5,5), front right (215,5), rear left (5,215), rear right (215,215), thread pitch 0.5mm

M350 X16 Y16 Z16 E16 I1                  ; Configure microstepping with interpolation
M92 X100 Y100 Z400 E102.68               ; Set steps per mm
M566 X600.00 Y600.00 Z18.00 E300.00      ; Set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z180.00 E6000.00  ; Set maximum speeds (mm/min)
M201 X1500.00 Y1500.00 Z100.00 E10000.00 ; Set accelerations (mm/s^2)
M906 X500.00 Y500.00 Z500.00 E800.00 I30 ; Set motor currents (mA) and motor idle factor in per cent
M84 S30                                  ; Set idle timeout

; Axis Limits
M208 X-32 Y0 Z0 S1                     ; Set axis minima
M208 X220 Y215 Z240 S0                   ; Set axis maxima

; Endstops
M574 X1 Y1 S0                            ; Set active low and disabled endstops

; Z-Probe
M574 Z1 S2                               ; Set endstops controlled by probe
M307 H3 A-1 C-1 D-1                      ; Disable heater 3 on PWM channel for BLTouch
M558 P9 H5 F120 T6000                    ; Set Z probe type to bltouch and the dive height + speeds
G31 P25 X-26 Y35 Z1.79                   ; Set Z probe trigger value, offset and trigger height
M557 X5:190 Y85:205 S20                 ; Define mesh grid

; Heaters
M307 H0 B0 A179.2 C465.7 D1.0 V12.5 S0.6     ; Disable bang-bang mode for the bed heater and set PWM limit
M307 H1 B0 A315.9 C236.5 D3.0 V12.4 S0.5     ; Disable bang-bang mode for the nozzle heater and set PWM limit
M305 P0 T100000 B4725 C7.060000e-8 R4700     ; Set thermistor + ADC parameters for heater 0
M143 H0 S130                                 ; Set temperature limit for heater 0 to 130C
M305 P1 T100000 B4725 C7.060000e-8 R4700     ; Set thermistor + ADC parameters for heater 1
M143 H1 S275                             ; Set temperature limit for heater 1 to 275C

; Fans
M106 P0 S0 I0 F500 H-1                   ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1 I0 F500 H1 T45                ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Tools
M563 P0 D0 H1                            ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S0                             ; Set initial tool 0 active and standby temperatures to 0C

; Automatic saving after power loss is not enabled

; Custom settings
M305 P101 S"DuetDriversTemp"             ; temperature warning and overheat flags on the TMC2660 on Duet
;M305 P102 S"DuexDriversTemp"            ; temperature warning and overheat flags on the TMC2660 on Duex
M912 P0 S2.0                              ; calibrate CPU temperature

; Miscellaneous
T0                                       ; Select first tool

M501                                     ; Read stored parameters from EEPROM

