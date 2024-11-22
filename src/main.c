// #include <stdint.h>

// volatile uint32_t *UART0 = (uint32_t *)0x10000000; // UART base address

// void uart_putc(char c)
// {
//     *UART0 = c;
// }

// void uart_puts(const char *str)
// {
//     while (*str)
//     {
//         uart_putc(*str++);
//     }
// }

int _start()
{
    while (1);
    return 0;
}