test_that("PipeOpFlatFun works", {
  task = tsk("fuel")
  pop = PipeOpFlatFun$new()
  x = pop$train(list(task))[[1L]]
  expected_features = c(
    "h20",
    paste0("UVVIS_", 1:134),
    paste0("NIR_", 1:231)
  )
  expect_set_equal(x$feature_names, expected_features)

  pop$param_set$values$affect_columns = selector_name("UVVIS")
  x = pop$train(list(task))[[1L]]
  expected_features = c(
    "h20",
    paste0("UVVIS_", 1:134),
    "NIR"
  )
  expect_set_equal(x$feature_names, expected_features)

  pop$param_set$values$affect_columns = selector_name("..xyz")
  x = pop$train(list(task))[[1L]]
  expected_features = c(
    "h20",
    "UVVIS",
    "NIR"
  )
  expect_set_equal(x$feature_names, expected_features)
})
