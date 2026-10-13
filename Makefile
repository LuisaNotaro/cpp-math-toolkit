## =============================================================================
## Makefile SIMPLES do projeto mathops-cpp
##
## Baseado no modelo classico apresentado no video-tutorial indicado no
## roteiro (compilador + flags + fontes + objetos + alvo, regra padrao %.o: %.c)
## e no exemplo da documentacao da Red Hat (example-building-a-c-program-using
## -a-makefile), adaptado de C para C++ e estendido para:
##   - compilar QUALQUER .cpp adicionado a src/, sem precisar editar este
##     arquivo (via $(wildcard ...));
##   - gerar todos os binarios (.o, .a, .so, .dll, .exe) dentro de bin/.
## =============================================================================

CXX      = g++
CXXFLAGS = -Wall -std=c++11 -I$(INCLUDE_DIR)

SRC_DIR     = src
INCLUDE_DIR = include
BIN_DIR     = bin

# Todos os .cpp de src/
APP_SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
# "Biblioteca" = tudo em src/ exceto main.cpp (usado para gerar .a / .so / .dll)
LIB_SOURCES = $(filter-out $(SRC_DIR)/main.cpp, $(APP_SOURCES))

APP_OBJECTS = $(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%.o,$(APP_SOURCES))

TARGET     = $(BIN_DIR)/app.exe
STATIC_LIB = $(BIN_DIR)/libbib.a

# .so no Linux/Mac, .dll no Windows (detectado automaticamente)
ifeq ($(OS),Windows_NT)
    SHARED_LIB = $(BIN_DIR)/libbib.dll
else
    SHARED_LIB = $(BIN_DIR)/libbib.so
endif

.PHONY: all clean

# As bibliotecas (.a / .so / .dll) só fazem sentido quando já existe pelo
# menos um arquivo em src/ além de main.cpp (ex.: src/bib.cpp).
ifeq ($(strip $(LIB_SOURCES)),)
all: $(BIN_DIR) $(TARGET)
else
all: $(BIN_DIR) $(TARGET) $(STATIC_LIB) $(SHARED_LIB)
endif

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Executavel final: todos os objetos de src/ (main.o + objetos da biblioteca)
$(TARGET): $(APP_OBJECTS)
	$(CXX) $(APP_OBJECTS) -o $@

# Biblioteca estatica com as funcoes de src/ (exceto main)
$(STATIC_LIB): $(filter $(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%.o,$(LIB_SOURCES)),$(APP_OBJECTS))
	ar rcs $@ $^

# Biblioteca dinamica com as funcoes de src/ (exceto main)
$(SHARED_LIB): $(LIB_SOURCES)
	$(CXX) $(CXXFLAGS) -fPIC -shared $(LIB_SOURCES) -o $@

# Regra padrao: compila qualquer src/<nome>.cpp em bin/<nome>.o
# (equivalente ao "%.o: %.c" do tutorial, so que para .cpp)
$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(BIN_DIR)/*.o $(BIN_DIR)/*.a $(BIN_DIR)/*.so $(BIN_DIR)/*.dll $(BIN_DIR)/*.exe
