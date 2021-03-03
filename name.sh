#!/bin/bash
Nargomenti=$# #prendo tutti gli argomenti passati e li metto in una variabile
for i in $*; do #faccio un for che scorre tutti gli argomenti con un indice i
	if [[ !( -f $i ) ]]; then #controllo se tutti gli argomenti passati non sono file
	echo "Non tutti gli argomenti passati sono file"
	exit 0
	fi
done
if [[ $Nargomenti < 2 ]]; then #controllo che gli argomenti siano maggori di 2
	echo "Devi inserire più argomenti"
	exit 0
fi
Uarg=${@: -1} #prendo tutti gli elementi di una cartella -1 e li metto dentro una variabile
for(( i = Nargomenti; i > 0; i-- )); do #scorro partendo dall'ultimo argomento al primo
	arg=${!i} #assegno ad una variabile il file che sto controllando
	if [ "$arg" != "$Uarg" ]; then #controllo se il file che ho selzionato è ugauale all'ultimo arogmento passato
	cat ${!i} >> ${@: -1} #appendo argomento selizionato al file dell'ultimo parametro 
	echo "Appendo ${!i} in ${@: -1}"
	fi
done
