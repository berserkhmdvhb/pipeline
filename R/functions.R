get_data_train <- function(){
  aiinsurance::insurance_train
}

get_data_test <- function(){
  aiinsurance::insurance_test
}

get_data_actual <- function(){
  aiinsurance::insurance_test$outcome
}

get_pred_proba <- function(h)
{
  h$predict_proba
}


roc_obj_cal <- function(actual, pred_proba){
  pROC::roc(actual ~ pred_proba, print.auc=FALSE)
}


plot_roc_curve <- function(roc_obj){
  pROC::ggroc(roc_obj)
}

