# The Fjelstul English Football Database

The Fjelstul English Football Database is a comprehensive database of football matches played in the Premier League and the English Football League from the 1888-89 inaugural season of the Football League through through the 2021-22 season. The database was created by Joshua C. Fjelstul, Ph.D. The database contains `5` datasets: `seasons`, `teams`, `matches`, `appearances` (one observation per team per match), and `standings` (end-of-the-season league tables). The `matches` dataset includes `203956` matches.

## Downloading the codebook

The codebook for the database is available in `.pdf` format in the `codebook/pdf/` folder. The codebook is also available in `.csv` format in the `codebook/csv/` folder. There are `2` files: `datasets.csv`, which describes the contents of each dataset, and `variables.csv`, which describes each variable. 

The codebook for the database is also included in the `R` package: `englishfootball::datasets` and `englishfootball::variables`. The same information is also available as part of the `R` documentation for each dataset. For example, you can see the codebook for the `englishfootball::matches` dataset by running `?englishfootball::matches`.

## The license

The copyright for the original structure and organization of the Fjelstul English Football Database and for all of the documentation and replication code for the database is owned by Joshua C. Fjelstul, Ph.D.

The Fjelstul English Football Database and the `englishfootball` package are both published under a [CC-BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/legalcode). This means that you can distribute, modify, and use all or part of the database for commercial or non-commercial purposes as long as (1) you provide proper attribution and (2) any new works you produce based on this database also carry the CC-BY-SA 4.0 license. 

To provide proper attribution, according to the CC-BY-SA 4.0 license, you must provide the name of the author ("Joshua C. Fjelstul, Ph.D."), a notice that the database is copyrighted ("© 2022 Joshua C. Fjelstul, Ph.D."), a link to the CC-BY-SA 4.0 license (https://creativecommons.org/licenses/by-sa/4.0/legalcode), and a link to this repository (https://www.github.com/jfjelstul/englishfootball). You must also indicate any modifications you have made to the database.

Consistent with the CC-BY-SA 4.0 license, I provide this database as-is and as-available, and make no representations or warranties of any kind concerning the database, whether express, implied, statutory, or other. This includes, without limitation, warranties of title, merchantability, fitness for a particular purpose, non-infringement, absence of latent or other defects, accuracy, or the presence or absence of errors, whether or not known or discoverable. 

## Data notes

- **Cross-validation.** I collected the data for the `matches` dataset separately from the data for the `standings` dataset (i.e., the `standings` table is not calculated based on the `matches` dataset). This allowed me to cross-reference the `matches` and `standings` datasets to make sure that the sum of all points earned by each team in each season, based on match result data in the `matches` dataset, equals the team's end-of-the-season point total in the `standings` dataset, accounting for (a) point adjustments due to deductions and forfeits and (b) matches that were expunged due to teams resigning from the league or being expelled from the league. I also confirm the `goals_for` and `goals_against` variables in the `standings` dataset.

## Installing the R package

You can install the latest development version of the `englishfootball` package from GitHub:

```
# install.packages("devtools")
devtools::install_github("jfjelstul/englishfootball")
```

## Citating the database

If you use the database in a paper or project, please cite the database:

> Fjelstul, Joshua C. "The Fjelstul English Football Database v.1.0." July 8, 2022. https://www.github.com/jfjelstul/worldcup.

The `BibTeX` entry for the database is:

```
@Manual{Fjelstul2022,
  author = {Fjelstul, Joshua C.},
  title = {The Fjelstul English Football Database v.1.0},
  year = {2023}
}
```

If you access the database via the `englishfotoball` package, please also cite the package:

> Joshua C. Fjelstul (2023). worldcup: The Fjelstul English Football Database. R package version 0.1.0.

The `BibTeX` entry for the `R` package is:

```
@Manual{,
  title = {englishfootball: The Fjelstul English Football Database},
  author = {Fjelstul, Joshua C.},
  year = {2023},
  note = {R package version 0.1.0},
}
```

## Reporting problems

If you notice an error in the data or a bug in the `R` package, please report it [here](https://github.com/jfjelstul/englishfotoball/issues).
