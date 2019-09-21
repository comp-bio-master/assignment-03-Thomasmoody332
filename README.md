# assignment03_LimpetShellEvolution

## Description of Assignment (Due 09/27/2019)
* Clone the repository for this assignment to your home dir in your terminal. 
* Ensure that the `admesh2tabdelimited.bash` script works by running it on the admesh.out data. This script converts the output of `admesh`, a unix command to extract information from 3D scans stored in `stl` files, into a "tidy" data file.
* Complete the requested updates to the `admesh2tabdelimited.bash` 
* I recommend troubleshooting after each change you make to the script
* You may work in groups but each student must submit their own work.

### Requested Updates
The `admesh2tabdelimited.bash` script is functional, but hard to read and poorly commented.  We can employ variables to improve the readability of the script and reorganize the comments to improve it for future users.

The script can be confusing at first, but it only really does two things.  First, it employs `cat` to join a header with the tidy data and saves that into a file which is stored in the outputFile which is stored in the variable `$TIDYDATAFILE` which is provide as an argument at the command line.
```bash
#this is pseudo code
cat <(header) <(tidy data) > outputFile
```

Second, it extracts data from the `admesh.out` file in columns and joins the columns using `paste` to make the tidy data
```bash
#this is pseudo code
paste <(3D stl file name) <(Min and Max X) <(Min and Max Y) <(Min and Max Z) <(Number of Facets) <(shell volume) <(shell surface area)
```

To be efficient, the intermediary steps are not saved into files and so, the business end of this script is one long pipeline and the escape character `\ ` is used to make it more readable by separating each component by line.
```bash
# this is pseudo code
cat <(header) \
<(tidy data)
```
Expanding the tidy data:
```bash
# this is pseudo code
cat <(header) \
<paste <(3D stl file name) \
<(Min and Max X) \
<(Min and Max Y) \
<(Min and Max Z) \
<(Number of Facets) \
<(shell volume) \
<(shell surface area)
```


1. Rather than making the header inside the arguments for cat, after the variable called TIDYDATAFILE, make a variable called HEADER and set it equal to the code that specifies the header.  Then inside of the cat


### To `push` your changes to your repository on GitHub, and thus submit the assigment, do the following

* change directories to the directory for this assignment
* type the following:
```
git add *
git commit -m "updating my assignment"
git push origin master
```

Note that 
* you can change the `commit` message to whatever you want (the part in quotations, but keep it brief
* you will have to provide your github username and password for the `push` to `origin master`
