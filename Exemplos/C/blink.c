// uVision C51

#include<reg51.h>

sbit led=P1^0; // Led connected to port-1 pin #0

void delay()
{
	int count=0;
	while(count!=50)
  {
   TMOD=0x10;  // 16-bit timer1 selected
   TH1=0xF8;   // Loading high byte in TH
   TL1=0xCC;   // Loaded low byte in TL
   TR1=1;      // Running the timer1
   while(!TF1);  // Checking the timer1 flag register if it is not equal to 1 
   TR1 = 0;      // If TF0=1 stop the timer1
   TF1 = 0;      // Clear the Timer1 Flag bit for next calculation
		
   count++;
  }
}

void main()
{
	P1=0x00;   // Port-1 Declared Output

	while(1)     // Constantly  running while loop.
	{
		led=1;    // LED glows here
		delay();  // Delay for 1 second 
		led=0;    // LED switch off
		delay();  // Delay for 1 second
	}
}  
