
# simulate data
ex <- simulData(p=100,n=100,r=0.8,rSN=5)

ex1.Vselect <- VARselect(ex$Y,ex$X,exhaustive.dmax=2)

load(system.file("extdata", "diabetes.rda", package="LINselect"))
attach(diabetes)
ex.diab <- VARselect(y,x2,exhaustive.dmax=5)
detach(diabetes)



