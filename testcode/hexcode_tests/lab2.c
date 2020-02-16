#include <stdio.h>

int add1(int a);

int main () {
    printf("Hello, World %d!\n", add1(2));
    return 0;
}

int add1(int a) {
    return a + 1;
}