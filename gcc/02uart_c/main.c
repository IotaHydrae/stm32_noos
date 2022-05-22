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
	return 0;
}
