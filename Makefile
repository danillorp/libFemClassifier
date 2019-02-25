LIB=./lib
INCLUDE=./include
INC_OPENCV=/usr/include
SRC=./src
OBJ=./obj

CC=gcc 

FLAGS=  -g -O0
CFLAGS=''


all: libFEMClassifier

libFEMClassifier: $(LIB)/libFEMClassifier.a
	echo "libFEMClassifier.a built..."

$(LIB)/libFEMClassifier.a: \
$(OBJ)/FEMDataset.o \
$(OBJ)/FEMSample.o \
$(OBJ)/FEMUtils.o \
$(OBJ)/FEMimages.o \
$(OBJ)/FEMClassify.o \
$(OBJ)/FEMBasis.o \

	ar csr $(LIB)/libFEMClassifier.a \
$(OBJ)/FEMDataset.o \
$(OBJ)/FEMSample.o \
$(OBJ)/FEMUtils.o \
$(OBJ)/FEMimages.o \
$(OBJ)/FEMClassify.o \
$(OBJ)/FEMBasis.o \

$(OBJ)/FEMDataset.o: $(SRC)/FEMDataset.c
	$(CC) $(FLAGS) -I $(INCLUDE) -I /usr/local/include -c $(SRC)/FEMDataset.c \
	-L /usr/local/lib -lgsl -lgslcblas -o $(OBJ)/FEMDataset.o

$(OBJ)/FEMSample.o: $(SRC)/FEMSample.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/FEMSample.c \
	-o $(OBJ)/FEMSample.o

$(OBJ)/FEMUtils.o: $(SRC)/FEMUtils.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/FEMUtils.c \
	-o $(OBJ)/FEMUtils.o
	
$(OBJ)/FEMimages.o: $(SRC)/FEMimages.c
	$(CC) $(FLAGS)  -I $(INCLUDE) -I $(INC_OPENCV) `pkg-config --cflags opencv` -c $(SRC)/FEMimages.c  `pkg-config --libs opencv` \
	-o $(OBJ)/FEMimages.o -L /usr/local/lib -lgsl -lgslcblas
	
$(OBJ)/FEMClassify.o: $(SRC)/FEMClassify.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/FEMClassify.c \
	-o $(OBJ)/FEMClassify.o
	
$(OBJ)/FEMBasis.o: $(SRC)/FEMBasis.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/FEMBasis.c \
	-o $(OBJ)/FEMBasis.o	
	
clean:
	rm -f $(LIB)/lib*.a; rm -f $(OBJ)/*.o
