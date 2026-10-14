#include "bib.hpp"

long long calcularFatorial(int n) {
    if (n <= 1) {
        return 1; // caso base: 0! = 1! = 1
    }
    return static_cast<long long>(n) * calcularFatorial(n - 1);
}

bool ehPrimo(int n) {
    if (n <= 1) {
        return false; // numeros <= 1 (e negativos) nao sao primos
    }
    if (n <= 3) {
        return true; // 2 e 3 sao primos
    }
    if (n % 2 == 0) {
        return false;
    }
    // so precisa checar divisores impares ate a raiz quadrada de n
    for (int i = 3; static_cast<long long>(i) * i <= n; i += 2) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}
