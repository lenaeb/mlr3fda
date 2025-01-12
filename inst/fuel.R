library(data.table)
library(tf)

task = mlr::fuelsubset.task
dat = task$env$data

ids_nir = rep(1:129, each = 231)

args_nir = rep(1:231, times = 129)


UVVIS = as.tfd_irreg(tfd(dat[["UVVIS"]]))
NIR = as.tfd_irreg(tfd(dat[["NIR"]]))

dat_new = data.table(
  heatan = dat$heatan,
  h20 = dat$h20,
  UVVIS = UVVIS,
  NIR = NIR
)


fuel = dat_new
save(file = "~/mlr/mlr3fda/data/fuel.rda", fuel)

load(file = "~/mlr/mlr3fda/data/fuel.rda")





