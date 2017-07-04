#define macros
EXECUTABLE_NAME = helloworld.exe
DIR_SRC = .
DIR_INCLUDE = .\include
DIR_BIN = .\bin
DIR_BIN_X64 = $(DIR_BIN)\x64
DIR_INTERMEDIATE = .\intermediate
DIR_INTERMEDIATE_X64 = $(DIR_INTERMEDIATE)\x64

SRC_FILES= \
		   $(DIR_SRC)\main.cpp \

{$(DIR_SRC)}.cpp{$(DIR_INTERMEDIATE_X64)}.obj ::
	@echo Compiling...
	cl /c /EHsc /Fo$(DIR_INTERMEDIATE_X64)\ /I$(DIR_INCLUDE) $< 

$(EXECUTABLE_NAME) : $(DIR_INTERMEDIATE_X64)\*.obj
	@echo Linking $(EXECUTABLE_NAME)...
	link /out:$(DIR_BIN_X64)\$(EXECUTABLE_NAME) $(DIR_INTERMEDIATE_X64)\*.obj
	
# build application
helloworld: $(EXECUTABLE_NAME)

#create output directories
create_dirs:
	@if not exist $(DIR_BIN_X64) mkdir $(DIR_BIN_X64)
	@if not exist $(DIR_INTERMEDIATE_X64) mkdir $(DIR_INTERMEDIATE_X64)

# delete output directories
clean:
	@if exist $(DIR_BIN) rmdir /S /Q $(DIR_BIN)
	@if exist $(DIR_INTERMEDIATE) rmdir /S /Q $(DIR_INTERMEDIATE)

# create directories and build application
all: clean create_dirs helloworld
