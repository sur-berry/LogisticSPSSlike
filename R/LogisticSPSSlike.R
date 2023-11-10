#' To keep the variable names in accordance with SPSS output when performing logistic regression using R
#'
#' @param fit an object of class inheriting from "glm".
#'
#' @return a data frame contains B, Wald, OR, CI, and P values.
#' @export
#'
#' @examples
#' if (!require("AER")) install.packages("AER")
#' library("AER")
#' data(Affairs)
#' Affairs[Affairs$affairs>1,]$affairs<-1
#' fit<-glm(affairs~.,data=Affairs,family=binomial())
#' formatFit(fit)
#'
LogisticSPSSlike<-function(fit){
  # get p value from the glm object
  p<-summary(fit)$coefficients[,4]
  # get wald value
  wald<-summary(fit)$coefficients[,3]^2
  # get B value
  valueB<-coef(fit)
  # get OR value
  valueOR<-exp(coef(fit))
  confitOR<-exp(confint(fit))
  data.frame(
    B=round(valueB,3),
    Wald=round(wald,3),
    OR_with_CI=paste(round(valueOR,3),"(",
                     round(confitOR[,1],3),"~",round(confitOR[,2],3),")",sep=""),
    P=format.pval(p,digits = 3,eps=0.001)
  )
}
