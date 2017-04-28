bin.test<-function(x,...){
  # Total column
  tot<-NULL
  for (i in 1:length(x[,1])){
    subtot<-x[i,2]+x[i,3]
    tot<-append(tot,subtot)
  }
  x<-cbind(x,tot)
  names(x)[4]="row total"
  
  # Preserve 4 columns
  x<-x[,c(1:4)]
  
  # Vector of probabilities
  nrows<-length(x[,1])
  i<-1;p=NULL
  for(i in 1:nrows){
    p0<-p
    p<-c(p0,((x[i,2])+1)/((x[i,4])+2))
    i<-i+1
  }
  # Vector of observations
  i<-1;n=NULL
  for(i in 1:nrows){
    n0<-n
    n<-c(n0,x[i,4])
    i<-i+1
  }
  # Vector of 1-p (q's)
  q<-(1-p)

  # Comparison possibilities
  nrowvector<-c(1:nrows)
  combs<-t(combn(nrowvector,2))

  # Test statistics 1 - standard error vector
  i<-1;se<-NULL
  for(i in 1:(length(combs[,1]))){
    se0<-se
    se<-c(se0,(sqrt(((p[combs[i,1]]*q[combs[i,1]])/(n[combs[i,1]]+2))+((p[combs[i,2]]*q[combs[i,2]])/(n[combs[i,2]]+2)))))
    i<-i+1
  }
  # Test statistics 2
  i<-1;mc<-NULL
  for(i in 1:(length(combs[,1]))){
    mc0<-mc
    mc<-c(mc0,(abs((p[combs[i,1]])-(p[combs[i,2]]))/se[i])*sqrt(2))
    i<-i+1

  }
  # Critical values
  Qt0<-qtukey(0.95,nrows,Inf)
  Qt<-c(rep(Qt0,length(combs[,1])))

  # P-values vector
  i<-1;pval<-NULL
  for(i in 1:(length(combs[,1]))){
    pval0<-pval
    pval<-c(pval0,(1-ptukey(mc[i],nrows,Inf)))
    i<-i+1
  }
  # Results 1
  result1<-round(matrix(c(combs[,1],combs[,2],mc,Qt,pval),ncol=5),4)
  result1<-as.data.frame(result1)
  names(result1)<-c("Comp.1","Comp.2","Test.stat","Crit.value","p-value")

  # p Confidence Intervals
  ##Vektor X
  i<-1;X<-NULL
  for(i in 1:nrows){
    X0<-X
    X<-c(X0,x[i,2])
    i<-i+1
  }
  ##Lower bound
  i<-1;lower<-NULL
  for(i in 1:nrows){
    lower0<-lower
    lower<-c(lower0,1-qbeta(0.975,n[i]-X[i]+1,X[i]))
    i<-i+1
  }
  ##Upper bound
  i<-1;upper<-NULL
  for (i in 1:nrows){
    upper0<-upper
    upper<-c(upper0,qbeta(0.975,X[i]+1,n[i]-X[i]))
    i<-i+1
  }
  #Probability vector (no correction)
  i<-1;pdecor<-NULL
  for(i in 1:nrows){
    pdecor0<-pdecor
    pdecor<-c(pdecor0,X[i]/n[i])
    i<-i+1
  }
  # Results 2
  nms<-c(names(x))
  result2<-round(matrix(c(1:nrows,pdecor,lower,upper),ncol=4),5)
  result2<-as.data.frame(result2)
  names(result2)<-c("Table row","p","lower","upper")


  # Error bars
  lw<-(pdecor-lower)
  up<-(upper-pdecor)
  erbar<-round(matrix(c(1:nrows,lw,up),ncol=3),3)
  erbar<-as.data.frame(erbar)
  names(erbar)<-c("Table row","Lower","Upper")


  res=list(mc=result1,CI=result2,errbars=erbar,obs_variable=nms[2])

  class(res)<-"bintest"

  res
  
}
