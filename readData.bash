~/software/R-3.2.2/bin/Rscript readData.R "xlsx/21-100 female.xlsx" "female.21-100.csv" > female.21-100.Rout 2>&1 &
~/software/R-3.2.2/bin/Rscript readData.R "xlsx/21-100 male.xlsx" "male.21-100.csv" > male.21-100.Rout 2>&1 &

~/software/R-3.2.2/bin/Rscript readData.R "xlsx/101-287 female.xlsx" "female.101-287.csv" > female.101-287.Rout 2>&1 &
~/software/R-3.2.2/bin/Rscript readData.R "xlsx/101-287 male.xlsx" "male.101-287.csv" > male.101-287.Rout 2>&1 &

~/software/R-3.2.2/bin/Rscript readData.R "xlsx/301-350 female.xlsx" "female.301-350.csv" > female.301-350.Rout 2>&1 &
~/software/R-3.2.2/bin/Rscript readData.R "xlsx/301-350 male.xlsx" "male.301-350.csv" > male.301-350.Rout 2>&1 &

~/software/R-3.2.2/bin/Rscript readData.R "xlsx/352-399 female.xlsx" "female.352-399.csv" > female.352-399.Rout 2>&1 &
~/software/R-3.2.2/bin/Rscript readData.R "xlsx/352-399 male.xlsx" "male.352-399.csv" > male.352-399.Rout 2>&1 &

~/software/R-3.2.2/bin/Rscript readData.R "xlsx/405-596 female.xlsx" "female.405-596.csv" > female.405-596.Rout 2>&1 &
~/software/R-3.2.2/bin/Rscript readData.R "xlsx/405-596 male.xlsx" "male.405-596.csv" > male.405-596.Rout 2>&1 &

~/software/R-3.2.2/bin/Rscript readData.R "xlsx/627-799 female.xlsx" "female.627-799.csv" > female.627-799.Rout 2>&1 &
~/software/R-3.2.2/bin/Rscript readData.R "xlsx/627-799 male.xlsx" "male.627-799.csv" > male.627-799.Rout 2>&1 &

~/software/R-3.2.2/bin/Rscript readData.R "xlsx/801-913 female.xlsx" "female.801-913.csv" > female.801-913.Rout 2>&1 &
~/software/R-3.2.2/bin/Rscript readData.R "xlsx/801-913 male.xlsx" "male.801-913.csv" > male.801-913.Rout 2>&1 &

cat *.csv > all.csv
