#define RCC_BASE	0x40021000
#define RCC_APB2ENR	0x18

/* GPIO defines */
#define GPIOB_BASE	0x40010C00
#define GPIOx_CRL	0x00
#define GPIOx_BSRR	0x10

/* defined in head.S, n as r0*/
extern void delay(unsigned int n);

/* pr is stored in .bss */
volatile unsigned int *pr;

void SystemInit(void)
{
	return;
}

int main(int argc, char **argv)
{


	/* enable the clock of GPIOB */
	pr = (volatile unsigned int *)(RCC_BASE + RCC_APB2ENR);
	*pr |= 0x08;

	/* Set GPIO to output,push-pull,2MHz */
	pr = (volatile unsigned int *)(GPIOB_BASE + GPIOx_CRL);
	*pr |= 0x00100000;
	
	/* Load GPIOB Bit set/reset register `BSRR` */
	pr = (volatile unsigned int *)(GPIOB_BASE + GPIOx_BSRR);

	while(1) {
		*pr |= 0x00200000;
		delay(0x0000f000);
		*pr |= 0x00000020;
		delay(0x0000f000);
	}

	return 0;
}
