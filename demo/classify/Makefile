all: fem_classifyOut opf2fem


fem_classifyOut:
	gcc -g -I ../../include -o fem_classifyOut fem_classifyOut.c -L ../../lib/ -lFEMClassifier -lm	

opf2fem:
	gcc -g -I ../../include -o opf2fem opf2fem.c -L ../../lib/ -lFEMClassifier -lm

clean:
	rm fem_classifyOut; rm opf2fem
