#! /usr/bin/bash

DIR=../src/
FILE1=utilities_stack_ll_shared_prog
FILE2=utilities_stack_array_shared_prog

################ Creation du fichier DIFF ########################

echo "5" > WAIT_RESULTS2
echo "3" >> WAIT_RESULTS2
echo -e "2\n" >> WAIT_RESULTS2

echo -e "ELEMENT HEAD : 5\n\n" >> WAIT_RESULTS2

echo -e "LONGUEUR LISTE : 3\n\n" >> WAIT_RESULTS2

echo -e "STATE OF STACK : 0\n\n" >> WAIT_RESULTS2

echo -e "ELEMENT SEARCH IN STACK(2) : 2\n" >> WAIT_RESULTS2


echo "3" >> WAIT_RESULTS2
echo -e  "2\n" >> WAIT_RESULTS2


echo "7" >> WAIT_RESULTS2
echo "3" >> WAIT_RESULTS2
echo -e "2\n" >> WAIT_RESULTS2


echo "2" >> WAIT_RESULTS2
echo "3" >> WAIT_RESULTS2
echo -e "7" >> WAIT_RESULTS2

##################################################################

############# COPIE DES FICHIERS DE COMPILATION ###################

cd $DIR
cp $FILE1 ../check/
cp $FILE2 ../check/
cp libstack2.so ../check/
cd ../check/
export LD_LIBRARY_PATH=.:/usr/lib/:/usr/local/lib
###################################################################

######################## Compilation des codes ####################
echo -e "\n\n########################################################################################\n\n">results3.txt

echo -e "\n\n" >> results3.txt
echo -e "##############################################################################">>results3.txt
echo -e "#				LIB DYNAMIQUE   			      \#" >>results3.txt
echo -e "##############################################################################">>results3.txt


echo -e "\n\nRESULTATS COMPILATION STACK_LL" >> results3.txt

./$FILE1 > FILE3_RESULTS

cat FILE3_RESULTS >> results3.txt

echo -e "\n\n====================================================================\n\n" >> results3.txt

echo -e "RESULTATS COMPILATION STACK_ARRAY" >> results3.txt
./$FILE2 > FILE4_RESULTS
cat FILE4_RESULTS >> results3.txt

echo -e "\n\n=====================================================================\n\n" > results4.txt

####################### REsultats attendus ###########################

echo -e "\n\nRESULTATS ATTENDUS " >> results4.txt

#echo -e "RES 1 :$Wait1 \nRES 2 :$Wait2 \nRES 3 :$Wait3 \nRES 4 :$Wait4 \n" >> results1.txt
cat WAIT_RESULTS2>>results4.txt
echo -e "\n" >> results1.txt

# Diff fichier :

echo -e "RESULTATS DIFF STACK_LL :\n\n" >> results4.txt
diff FILE3_RESULTS WAIT_RESULTS2 >> results4.txt

echo -e "\n\nRESULTATS DIFF STACK_ARRAY :\n\n" >> results4.txt
diff FILE4_RESULTS WAIT_RESULTS2 >> results4.txt

# On génére le fichier final :
cat results3.txt results4.txt > RESULTATS_SHARED_COMPIALTION.txt

rm -f FILE3_RESULTS FILE4_RESULTS results3.txt results4.txt RESULTS_DIFF1 RESULTS_DIFF2 WAIT_RESULTS2 results3.txt results4.txt
rm -f utilities_stack_array_shared_prog utilities_stack_ll_shared_prog results1.txt
