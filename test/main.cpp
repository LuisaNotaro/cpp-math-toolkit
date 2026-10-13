// =============================================================================
// test/main.cpp - testes funcionais/regressivos do projeto (TDD)
//
// Este arquivo e compilado separadamente da aplicacao principal (ver alvo
// "test" do Makefile), gerando bin/testeRegressivo.exe. Cada funcionalidade
// e testada ANTES de ser implementada (TDD): primeiro o teste e escrito
// aqui (e falha, pois a funcao ainda nao existe/nao esta correta), depois a
// assinatura e declarada em src/bib.hpp e implementada em src/bib.cpp, ate
// o teste passar.
//
// Nao usamos nenhum framework externo (Google Test, etc.) para manter o
// projeto simples - so <cassert> da biblioteca padrao, no mesmo espirito do
// testUnitario.cpp visto na Lista 08.
// =============================================================================

#include <cassert>
#include <iostream>

#include "../src/bib.hpp"

// ---------------------------------------------------------------------------
// Cenarios de teste: calcularFatorial
// ---------------------------------------------------------------------------
void testCalcularFatorial() {
    assert(calcularFatorial(0) == 1);   // caso base: 0! = 1
    assert(calcularFatorial(1) == 1);   // caso base: 1! = 1
    assert(calcularFatorial(5) == 120); // 5! = 120
    assert(calcularFatorial(10) == 3628800); // 10! = 3628800

    std::cout << "[OK] testCalcularFatorial" << std::endl;
}

int main() {
    testCalcularFatorial();

    std::cout << "Todos os testes passaram com sucesso!" << std::endl;
    return 0;
}
