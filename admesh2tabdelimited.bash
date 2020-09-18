#!/bin/bash

#this program takes output from admesh and makes a tidy table of the data

#to run:

#bash admesh2tabdelimited.bash <admesh output file> <tab-delimited file>

#bash admesh2tabdelimited.bash admesh.out admesh.dat


#These lines grab the information from the admesh output
# grep '^Input file' test.out | sed 's/ //g' | sed 's/Inputfile://g'

# grep '^Min X' test.out |  sed 's/ //g' | sed 's/M[ai][nx]X=//g' | tr "," "\t"
# grep '^Min Y' test.out |  sed 's/ //g' | sed 's/M[ai][nx]Y=//g' | tr "," "\t"
# grep '^Min Z' test.out |  sed 's/ //g' | sed 's/M[ai][nx]Z=//g' | tr "," "\t"

# grep '^Number of facets' test.out |  sed 's/Number of facets  *: *//g' | sed 's/  */\t/g'

# grep 'Volume' test.out |  sed 's/Number of parts *:.*Volume *: *//g'
# grep 'Surface area' test.out |  sed 's/Degenerate facets *:.*Surface area *: *//g'


#this script will convert output from admesh to a tidy tab delimited table
INPUTFILE=$1
TIDYDATAFILE=$2
# create header row and save to variable
 HEADER=$(echo -e FileName'\t'MinX'\t'MaxX'\t'MinY'\t'MaxY'\t'MinZ'\t'MaxZ'\t'FacetsBefore'\t'FacetsAfter'\t'Volume'\t'SurfArea)
# pass the first column of data to the first arugment in paste and create a variable
 FileNames=$(paste -d '\t' <(grep '^Input file' $INPUTFILE | sed 's/ //g' | sed 's/Inputfile://g'))
# filtering and transforming the text from column 2, min and max x
 MinMaxX=$(grep '^Min X' $INPUTFILE |  sed 's/ //g' | sed 's/M[ai][nx]X=//g' | tr "," "\t")
# filtering and transforming the text from column 3, min and max y
 MinMaxY=$(grep '^Min Y' $INPUTFILE | sed 's/ //g' | sed 's/M[ai][nx]Y=//g' | tr "," "\t")
#filtering and transforming the text from column 4, min and max z
 MinMaxZ=$(grep '^Min Z' $INPUTFILE | sed 's/ //g' | sed 's/M[ai][nx]Z=//g' | tr "," "\t")
#filtering and transforming the text from column 5, number of facets
 FACETS=$(grep '^Number of facets' $INPUTFILE | sed 's/Number of facets  *: *//g' | sed 's/  */\t/g')
#filtering and transforming the text from column 6, volume
 VOLUME=$(grep 'Volume' $INPUTFILE | sed 's/Number of parts *:.*Volume *: *//g')
#filtering and transforming the text from column 7, surface area
 SURFACEAREA=$(grep 'Surface area' $INPUTFILE | sed 's/Degenerate facets *:.*Surface area *: *//g')

cat <(echo $HEADER | tr " " "\t") \
<(\
echo $FileNames \
    <(echo $MinMaxX | tr " " "\t") \
    <(echo $MinMaxY | tr " " "\t") \
    <(echo $MinMaxZ | tr " " "\t") \
    <(echo $FACETS | tr " " "\t") \
    <(echo $VOLUME | tr " " "\t") \
    <(echo $SURFACEAREA | tr " " "\t") \
) > $TIDYDATAFILE





