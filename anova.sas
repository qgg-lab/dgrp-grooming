data pheno;
    infile 'total.groom.time.csv' dlm = ',' lrecl = 1000000 firstobs = 2;
    input line sex $ time;
run;

proc glm data = pheno;
    class line sex;
    model time = sex line sex*line;
    random line sex*line / test;
run;

proc mixed data = pheno method = reml covtest;
    class line sex;
    model time = sex / solution;
    random line sex*line;
run;

data pheno;
    infile 'total.groom.time.female.csv' dlm = ',' lrecl = 1000000 firstobs = 2;
    input line sex $ time;
run;

proc glm data = pheno;
    class line;
    model time = line;
    random line / test;
run;

proc mixed data = pheno method = reml covtest;
    class line;
    model time = / solution;
    random line ;
run;

data pheno;
    infile 'total.groom.time.male.csv' dlm = ',' lrecl = 1000000 firstobs = 2;
    input line sex $ time;
run;

proc glm data = pheno;
    class line;
    model time = line;
    random line / test;
run;

proc mixed data = pheno method = reml covtest;
    class line;
    model time = / solution;
    random line ;
run;
