# Pipeline

This repository is for testing the pipeline created in the [`aiinsurance`](https://github.com/berserkhmdvhb/aiinsurance) package.


# Usage
Please run the commands mentioned in this README file in a console of an R editor (e.g., Rstudio).
To run the pipeline, adhere to the instructions provided below:

First clone the package's repository, using the following command in a command line:

```
git clone git@github.com:berserkhmdvhb/pipeline.git
```

Then navigate to to the cloned folder and open `pipeline.Rproj` in an R editor to create a project.
Install the packages required for the `aiinsurance` package from the `renv.lock` file. Please either use renv when creating a project, or if you haven't, install the [`renv`](https://rstudio.github.io/renv/articles/renv.html) library, load it, and then use the [`renv.lock`](https://github.com/berserkhmdvhb/aiinsurance/blob/main/renv.lock) file (by copying it to project's directory) to install the requied packages. Please run the following commands in the console:

```r
install.packages("renv")
library(renv)
renv::restore()
```

To run the pipeline, install and load the `targets` library, and the run `tar_make()` to run the pipeline. Please run the following commands in the console

```r
library(targets)
tar_make()
```



After the pipeline is successfully run, there should be now two plots called `plot_glm` and `plot_rf` (as can bee seen in the figure in [Visualize](#Visualize)). Both of the plots display ROC curve, while the former attributes to the logistic regression (implemented by the glmnet), and the latter attributes to random forest classifier. The two plots are very similar, as the models had very similar performance. Two view the two plots, run the following in the console:

```r
targets::tar_read(plot_glm)
targets::tar_read(plot_rf)
```


# Directory Tree 

```bash
├── R
│   ├── functions.R
├── run.R
├── run.sh
├── _targets.R
```

# Visualize 

To visalize the components of the pipeline, run the following:

```
targets::tar_visnetwork()
```

The following figure should be displayed:

![`tar_visnetwork`](https://github.com/berserkhmdvhb/aiinsurance/blob/main/inst/figures/tar_visnetwork.png)


# Pipeline Steps

Evidenced by the visualization, the two datasets used in the pipeline are `insurance_train` and `insurance_test`.
They are datasets processed from the raw `car_insurance_data`, and all the three mentioned datasets are incorporated in the package.
The steps of the pipeline are elaborated on in the following:

- Logistic Regression Part
    1. Access the `insurance_train` with `get_data_train()`, and insurance_test with `get_data_test()`.
    2. Store the `outcome` column (labels) from `insurance_test` for later evaluation in steps vi (and iii from Random Forest Part)
    3. Fit the `insurance_train` into the `glmnet_fit_hmd` function (from the package) so as to apply the logistic regression model on data ,and thn store the fitted object in `model_glm`
    4. Predict the `insurance_test` using the fitted object `model_glm` from step iii, by feeding both `insurance_test` and `model_glm` to the `glmnet_predict_hmd`, and store the prediction results in `predictions_glm`.
    5. Extract prediction probabilities (required for ROC curve) from `predictions_glm` and store them in `pred_proba_glmnet`
    6. Compute ROC metrics be feeding `actual` data (from step ii) and prediction probabilities `pred_proba_glmnet` to the `roc_obj_cal` function, store the result in `roc_obj_glmnet`
    7. Plot the roc curve by feeding `roc_obj_glmnet` to the `plot_roc_curve` function, store the plot in `plot_glm`
- Random Forest Part
    1. Fit the `insurance_train` into the `rf_fit_hmd` function (from the package) so as to apply the random forest model on data ,and thn store the fitted object in `model_rf`
    2. Predict the `insurance_test` using the fitted object `model_random_forest` from step iii, by feeding both `insurance_test` and `model_rf` to the `rf_predict_hmd`, and store the prediction results in `predictions_rf`.
    3. Extract prediction probabilities (required for ROC curve) from `predictions_rf` and store them in `pred_proba_rf`
    4. Compute ROC metrics be feeding `actual` data (from step ii) and prediction probabilities `pred_proba_rf` to the `roc_obj_cal` function, store the result in `roc_obj_rf`
    5. Plot the roc curve by feeding `roc_obj_rf` to the `plot_roc_curve` function, store the plot in `plot_rf`
    
    
