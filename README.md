# Pipeline
This repository is for testing the pipeline created in the [`aiinsurance`](https://github.com/berserkhmdvhb/aiinsurance) package.


Please run the commands in this README file in a console of an R editor (e.g., Rstudio).
As requirement, please either use renv when creating a project, or if you haven't, install the [`renv`](https://rstudio.github.io/renv/articles/renv.html) library, load it, and then use the [`renv.lock`](https://github.com/berserkhmdvhb/aiinsurance/blob/main/renv.lock) file (by copying it to project's directory) to install the requied packages. Please follow the following commands in the console:

```r
install.packages("renv")
library(renv)
renv::restore()
```

To run the pipeline, simply run the following commands in the console

```r
library(targets)
tar_make()
```
