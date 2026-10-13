#include "bib.hpp"

long long calcularFatorial(int n) {
    if (n <= 1) {
        return 1; // caso base: 0! = 1! = 1
    }
    return static_cast<long long>(n) * calcularFatorial(n - 1);
}
