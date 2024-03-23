void setup() {
  Serial.begin(9600);
  // Establecer la frecuencia de la CPU a 80 MHz para optimización de consumo
  setCpuFrequencyMhz(80);
}

int x = 1;
float y = 1;

void loop() {
  // Imprimir la frecuencia de la CPU
  Serial.print("Frecuencia de la CPU: ");
  Serial.print(getCpuFrequencyMhz());
  Serial.println(" MHz");

  Serial.println("start");
  for (int i = 0; i<0x4fffff; i++)
  {
    x = x * (1+x);
    y = y * (1.2345+y);
  }
  Serial.println("end");
}
