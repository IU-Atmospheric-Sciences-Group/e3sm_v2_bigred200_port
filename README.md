# Change log

  * 2022-06-30: Created the directory and this `README.md` file.  - Travis A. O'Brien <obrienta@iu.edu>

# Overview

This directory contains files that should aid in other users porting E3SMv2 to
BigRed200.  It consists of 3 parts:

  1. a `.cime` directory that should be copied to the user's `$HOME`; this
defines the configuration of BigRed200.  Note that the files within may need to
be updated after a system upgrade.

  2. a `e3sm_v2.patch` file for defining the PE layout of BigRed200.  There's probably a way of doing this in the `.cime` directory without modifying the E3SM source, but I haven't yet figured out how.

  3. a `SAMPLE_BUILD.bash` script that contains all the instructions for successfully creating, building, and running a case with E3SM. I've tried a few different compsets with success, but I haven't gone through the formal port validation procedure.


