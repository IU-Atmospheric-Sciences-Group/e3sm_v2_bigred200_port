#!/bin/bash

# echo commands and exit on any command failure
set -e
set -x

# set build options
E3SM_SRC=/N/slate/obrienta/E3SMv2
res=ne30pg2_ne30pg2
compset=F-EAM-AQP1
CASE=aqp1.${res}.${compset}

# remove any existing case directory or scratch directory
rm -rf $CASE
rm -rf $SCRATCH/cime_scratch/$CASE

# create the case
${E3SM_SRC}/cime/scripts/create_newcase \
  -case $CASE \
  -res $res \
  -compset $compset \
  -v \
  --handle-preexisting-dirs u \
  -pecount S

# copy this script into the case directory for later reference
cp $0 $CASE

# move into the case directory
cd $CASE

# set number of threads (this is a significant speedup; 
# more than 8x for some reason)
./xmlchange --file env_mach_pes.xml --id NTHRDS --val 8

# build and submit the case
./case.setup
./case.build
./case.submit
