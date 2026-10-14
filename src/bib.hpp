#ifndef BIB_HPP
#define BIB_HPP

// Biblioteca de funcoes matematicas do projeto.
// Cada funcionalidade nova (desenvolvida via TDD) e declarada aqui.

// Calcula o fatorial de n (n!), para n >= 0.
// fatorial(0) = 1 (caso base)
long long calcularFatorial(int n);

// Verifica se n e um numero primo.
// Por definicao, numeros menores ou iguais a 1 (incluindo negativos) nao sao primos.
bool ehPrimo(int n);

#endif // BIB_HPP
