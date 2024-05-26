# The Fjelstul English Football Database

The Fjelstul English Football Database is a comprehensive database of football matches played in the Premier League and the English Football League from the inaugural season of the Football League in 1888-89 through the 2023-24 season. The database was created by Joshua C. Fjelstul, Ph.D.

The database contains `5` datasets: `seasons`, `teams`, `matches`, `appearances` (one observation per team per match), and `standings` (end-of-the-season league tables). The `matches` dataset includes `208028` matches.

If you use data from this database in a project, please let me know so I can feature your work!

## Downloading the data

The Fjelstul English Football Database is available via the `R` package `englishfootball`, which you can install from this repository (instructions below). Note that this repository is structured as a repository for an `R` package. You can also download the database directly from this repository in `3` formats: an `.RData` version of the database is available in the `data/` folder, a `.csv` version is available in the `data-csv/` folder, and a relational database version (`SQLite`) is available in the `data-sqlite/` folder.

The `.RData` and `.csv` versions of the database are all identical except for the file format. These versions of the database are not technically relational because some tables already include variables that have been merged in from other tables for convenience (i.e., some data exists in multiple tables). The `SQLite` version includes all of the same variables, but variables from other tables are not already merged in. Dummy variables that are coded `0` or `1` are converted to `FALSE` and `TRUE`. Users can use the primary and foreign keys in the tables to merge in data from other tables. See the `SQL-schema.txt` file in the `data-sqlite/` folder for more details.

## Downloading the codebook

The codebook for the database is available in `.pdf` format in the `codebook/pdf/` folder. The codebook is also available in `.csv` format in the `codebook/csv/` folder. There are `2` files: `datasets.csv`, which describes the contents of each dataset, and `variables.csv`, which describes each variable. 

The codebook for the database is also included in the `R` package: `englishfootball::datasets` and `englishfootball::variables`. The same information is also available as part of the `R` documentation for each dataset. For example, you can see the codebook for the `englishfootball::matches` dataset by running `?englishfootball::matches`.

## The license

The copyright for the original structure and organization of the Fjelstul English Football Database and for all of the documentation and replication code for the database is owned by Joshua C. Fjelstul, Ph.D.

The Fjelstul English Football Database and the `englishfootball` package are both published under a [CC-BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/legalcode). This means that you can distribute, modify, and use all or part of the database for commercial or non-commercial purposes as long as (1) you provide proper attribution and (2) any new works you produce based on this database also carry the CC-BY-SA 4.0 license. 

To provide proper attribution, according to the CC-BY-SA 4.0 license, you must provide the name of the author ("Joshua C. Fjelstul, Ph.D."), a notice that the database is copyrighted ("© 2024 Joshua C. Fjelstul, Ph.D."), a link to the CC-BY-SA 4.0 license (https://creativecommons.org/licenses/by-sa/4.0/legalcode), and a link to this repository (https://www.github.com/jfjelstul/englishfootball). You must also indicate any modifications you have made to the database.

Consistent with the CC-BY-SA 4.0 license, I provide this database as-is and as-available, and make no representations or warranties of any kind concerning the database, whether express, implied, statutory, or other. This includes, without limitation, warranties of title, merchantability, fitness for a particular purpose, non-infringement, absence of latent or other defects, accuracy, or the presence or absence of errors, whether or not known or discoverable. 

## Data source

The data in the Fjelstul English Football Database is coded based on information from Wikipedia. Some of this information is cross-referenced with other sources, including official sources, to confirm the accuracy of the data.

## Data notes

- **Cross-validation.** I collected the data for the `matches` dataset separately from the data for the `standings` dataset (i.e., the `standings` table is not calculated based on the `matches` dataset). This allowed me to cross-reference the `matches` and `standings` datasets to make sure that the sum of all points earned by each team in each season, based on match result data in the `matches` dataset, equals the team's end-of-the-season point total in the `standings` dataset, accounting for (a) point adjustments due to deductions and forfeits and (b) matches that were expunged due to teams resigning from the league or being expelled from the league. I also confirm the `goals_for` and `goals_against` variables in the `appearances` dataset by comparing the sums by season and by team with the `goals_for` and `goals_against` variables in the `standings` dataset.

- **Point adjustments.** The `point_adjustment` variable in the `standings` table indicates all adjustments to end-of-the-season point totals due to deductions and forfeits. There are `62` point deductions and one instance of a team being awarded points because their opponent forfeited (Scunthorpe United in the 1973-74 season). Point deductions range from `1` point to `21` points (Derby Country in the 2021-22 season). 

- **Team names.** Many team names end in `Football Club`, usually abbreviated as `F.C.`, and a few start with `AFC` (Athletic Football Club). I standardize team names throughout the database by removing these abbreviations. Some teams have changed their names over time. For example, Manchester United started out as Newton Heath and Arsenal started out as Woolwich Arsenal. The `matches`, `appearances`, and `standings` datasets always use the name of the team at the time. The `team_name` variable in the `teams` dataset is the current name of the team, and the `former_team_names` variable in the `teams` dataset lists any previous names. The `team_id` variable and its extensions, such as `home_team_id` and `away_team_id`, allow you to track teams across name changes in the `matches`, `appearances`, and `standings` datasets. For example, in the `matches` dataset, `team_name` will be coded `Newton Heath` before the name change and `Manchester United` after the name change, but `team_id` will have the same value for both. 

- **Defunct teams.** Some teams that have been in the English Football League have been relegated and are currently playing in lower divisions. There are also some teams that have become defunct. The `defunct` variable in the `teams` dataset indicates teams that have become defunct and no longer exist. I do not code teams that have since been revived as defunct, regardless of whether they are current members of the English Football League. There are `27` defunct teams that have not been revived. 

- **Phoenix teams.** Sometimes, a team will be dissolved, and then a new team will be created with the same name as a revival of the original team. These are called phoenix teams, and I code them as a continuation of the original team, even though legally, they are a new entity. For example, I code the current Accrington Stanley as a continuation of the Accrington Stanley that was founded in 1891 and was later dissolved. Similarly, Bradford Pack Avenue was dissolved and was then later revived. One unusual case is Wimbledon. Wimbledon F.C. was relocated and became Milton Keynes Dons F.C., which I code as a separate team. Then, a protest club called AFC Wimbledon was founded to replace the original Wimbledon F.C. I code the new Wimbledon as a revival of the original Wimbledon. Accounting for phoenix teams, there have been `144` unique teams in the Premier League and English Football League. 

- **Current members.** There are currently `92` members of the Premier League and the English Football League. The `current` variable in the `teams` dataset indicates which teams are members of the Premier League or the English Football League during the most recent season in the database, which is the 2023-24 season. This variables doesn't reflect relegation from League Two or promotion from the National League following the conclusion of the 2023-24 season.

## Installing the R package

You can install the latest development version of the `englishfootball` package from GitHub:

```
# install.packages("devtools")
devtools::install_github("jfjelstul/englishfootball")
```

## Citating the database

If you use the database in project, please cite the database:

> Fjelstul, Joshua C. "The Fjelstul English Football Database v1.1.0." May 26, 2024. https://www.github.com/jfjelstul/englishfootball.

The `BibTeX` entry for the database is:

```
@Manual{Fjelstul2024,
  author = {Fjelstul, Joshua C.},
  title = {The Fjelstul English Football Database v1.1.0},
  year = {2024}
}
```

If you access the database via the `englishfootball` package, please also cite the package:

> Joshua C. Fjelstul (2024). englishfootball: The Fjelstul English Football Database. R package version 1.1.0.

The `BibTeX` entry for the `R` package is:

```
@Manual{,
  title = {englishfootball: The Fjelstul English Football Database},
  author = {Fjelstul, Joshua C.},
  year = {2024},
  note = {R package version 1.1.0},
}
```

## Reporting problems

If you notice an error in the data or a bug in the `R` package, please report it [here](https://github.com/jfjelstul/englishfootball/issues).
