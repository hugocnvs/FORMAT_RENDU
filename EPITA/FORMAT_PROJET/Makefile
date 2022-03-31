-include Makefile.rules
shell:=/bin/bash

all: libestack

clean:
	$(info ============ Nettoyage des dossiers ============)
	rm -f *.log *.synctex.gz *.aux *.out *.toc *.c~
	cd src/ && rm -f *.log *.aux *.out *.toc *.c~
	cd check/ && rm -f *.log *.aux *.out *.toc *.c~

distclean: clean

	$(info ============ Nettoyage du projet ============)

	rm -f *.so *.a *.o *.txt

	rm -f check/*.a check/*.o  check/*.so  check/*.txt  check/FILE1_RESULTS check/FILE2_RESULTS check/RESULTS_DIFF1 check/RESULTS_DIFF2 check/WAIT_RESULTS
	rm -f src/*.a  src/*.o  src/*.so  src/*.txt  src/FILE1_RESULTS src/FILE2_RESULTS src/utilities_stack_array_stat_prog src/utilities_stack_ll_stat_prog src/utilities_stack_array_shared_prog src/utilities_stack_ll_shared_prog


dist: distclean

	rm -f *.rules
	tar -zcvf hugo.canavese-TP1.tar AUTHORS configure Makefile README src/ check/
	bzip2 -f hugo.canavese-TP1.tar


check: libestack

	$(info ============ Generation des test ============)

	cd check/ && ./check_static.sh
	cd check && cat RESULTATS_STATIC_COMPIALTION.txt

	cd check/ && ./check_dynamic.sh
	cd check/ && cat RESULTATS_SHARED_COMPIALTION.txt

libestack: static shared

static:

	$(info " ============ Compilation STATIQUE ============")

	cd src/
	rm -f src/*.o src/*.a

	cd src/ && gcc -c stack_linked_list.c stack_array.c

	cd src/ && ar cr -o libstack1.a stack_linked_list.o stack_array.o

	cd src/ && ranlib libstack1.a
	cd src/ && cp libstack1.a ../check
	cd src/ && $(CC) utilities_stack_array.c -L. -lstack1 -o utilities_stack_array_stat_prog
	cd src/ && $(CC) utilities_stack_ll.c -L. -lstack1 -o utilities_stack_ll_stat_prog


shared:
	$(info " ============ Compilation DYNAMIQUE ============")
	cd src/ && $(CC) -c -fpic stack_linked_list.c stack_array.c
	cd src/ && $(CC) -fPIC stack_array.o stack_linked_list.o -shared -o libstack2.so
	cd src/ && cp libstack2.so ../check/

	#cd src/ && Usr_PATH= 'pwd'

	#$(Usr_PATH)
	#cd src/ && export LD_LIBRARY_PATH=$(Usr_PATH)

	cd check/ && export LD_LIBRARY_PATH=.:/usr/lib:/usr/local/lib
	cd src/ && $(CC) utilities_stack_array.c -L. -lstack2 -o utilities_stack_array_shared_prog
	cd src/ && $(CC) utilities_stack_ll.c -L. -lstack2 -o utilities_stack_ll_shared_prog

