# Termômetro Digital com PIC16F877A 

Esse projeto tem como objetivo construir através de um microcontrolador PIC 16F877A um Termômetro Digital, com as seguintes características:

1. Componentes LM35 e/ou Termistor como sensor de temperatura e dois Displays de 7 Segmentos para informar a temperatura em graus Célsius;

2. O projeto possui uma indicação visual com LEDs coloridos para informar níveis de temperatura, conforme a amostragem abaixo:
  2.1. Abaixo de 25°C, LED azul acende;
  2.2. Entre 25°C até 28°C, LED verde acende;
  2.3. Entre 29 e 31°C, LED amarelo acende;
  2.4. Maior que 31°C, LED vermelho acende e um buzzer emitirá um som com frequência de 1kHz.

3. O projeto possui uma interrupção externa RB0/INT para ligar/desligar o buzzer.

Foi utilizado o PROTEUS como simulador de circuitos com os seguintes componentes:
1. Microcontrolador PIC16F877A;
2. Sensor de temperatura LM35;
3. Capacitores de 22pF e 1uF;
4. Crystal na frequência de 8MHz;
5. Resistores de 10Ω, 330Ω, 1kΩ e 10kΩ;
6. Portas lógicas NOT;
7. LEDs nas cores azul, verde, amarelo e vermelho;
8. Buzzer;
9. Dois Displays de 7 Segmentos;
10. Botões;
11. Osciloscópio.

Você consegue montar fisicamente seguindo as mesmas conexões :) Aproveite!


# Digital Thermometer with PIC16F877A

This project aims to build, through a PIC 16F877A microcontroller, a Digital Thermometer, with the following characteristics:

1. LM35 and/or Thermistor components as a temperature sensor and two 7-segment displays to inform the temperature in degrees Celsius;

2. The project has a visual indication with colored LEDs to inform temperature levels, as shown below:
   2.1. Below 25°C, blue LED lights up;
   2.2. Between 25°C to 28°C, green LED lights up;
   2.3. Between 29 and 31°C, yellow LED lights up;
   2.4. Higher than 31°C, red LED lights up and a buzzer will emit a sound with a frequency of 1kHz.

3. The project has an external interrupt RB0/INT to turn the buzzer on/off.

PROTEUS was used as a circuit simulator with the following components:
1. PIC16F877A microcontroller;
2. LM35 temperature sensor;
3. Capacitors of 22pF and 1uF;
4. Crystal at 8MHz frequency;
5. 10Ω, 330Ω, 1kΩ and 10kΩ resistors;
6. NOT logic gates;
7. Blue, green, yellow and red LEDs;
8. Buzzer;
9. Two 7-Segment Displays;
10. Buttons;
11. Oscilloscope.

You can physically mount it following the same connections :) Enjoy!
