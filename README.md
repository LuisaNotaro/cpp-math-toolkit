# cpp-math-toolkit

Biblioteca de operações matemáticas em C++, usada como projeto de prática de
**Git, Gitflow e TDD (Test-Driven Development)** na disciplina de Engenharia
de Software (UFOP), seguindo o tutorial do TerraLAB:
[Uma introdução ao Git e Gitflow](https://www2.decom.ufop.br/terralab/uma-introducao-ao-git-e-gitflow/).

## 📋 Sobre o projeto

Este repositório implementa, de forma incremental, pequenas funções
matemáticas (fatorial, números primos, etc.), cada uma desenvolvida seguindo
o ciclo:

1. Issue criada no board **sprint backlog**;
2. Issue movida para **doing** e uma branch de feature criada a partir de
   `develop` (ex.: `feat/calcularFatorial`);
3. Teste da funcionalidade escrito **antes** da implementação, em
   `test/main.cpp` (TDD);
4. Assinatura da função declarada em `src/bib.hpp` e implementada em
   `src/bib.cpp`;
5. Quando os testes passam, o código é mesclado em `develop` e a issue é
   movida para **waiting acceptance**;
6. Após aprovação do Product Owner, a issue é movida para **done** e a
   funcionalidade é mesclada em `staging`.

## 🗂️ Estrutura de diretórios

```
cpp-math-toolkit/
├── src/            # código-fonte (.cpp) da aplicação e da biblioteca
├── include/        # headers de terceiros / compartilhados (se houver)
├── bin/            # binários gerados pela compilação (.o, .a, .so, .dll, .exe) — ignorado pelo Git
├── test/           # testes funcionais/regressivos (QA)
├── doc/            # documentação do projeto
├── Makefile        # script de build (ver seção "Como compilar")
└── .gitignore
```

## 🔧 Como compilar

O projeto usa um `Makefile` simples. Todo arquivo `.cpp`/`.hpp` adicionado em
`src/` é automaticamente incluído na compilação — não é preciso editar o
Makefile para adicionar novos arquivos-fonte.

```bash
# compila a aplicação principal -> gera bin/app.exe (+ bin/*.o, bin/libbib.a, bin/libbib.so)
make

# compila e executa os testes de regressão -> gera bin/testeRegressivo.exe
make test

# remove tudo que foi gerado em bin/
make clean
```

## ▶️ Como executar

```bash
make
./bin/app.exe
```

## 🧪 Como rodar os testes

```bash
make test
./bin/testeRegressivo.exe
```

## 🌱 Fluxo de branches (Gitflow)

| Branch    | Papel                                                              |
|-----------|---------------------------------------------------------------------|
| `master`  | Versão estável, em produção                                         |
| `staging` | Funcionalidades aprovadas pelo P.O., aguardando ir para produção     |
| `develop` | Integração das funcionalidades em desenvolvimento                   |
| `feat/*`  | Uma branch por funcionalidade, criada a partir de `develop`          |

## 📌 Status

Projeto em desenvolvimento ativo — acompanhe o board de issues do
repositório para ver o andamento de cada funcionalidade.

## 👤 Autoria

Luisa Ribeiro Notaro — matrícula 22.1.4161 — UFOP
