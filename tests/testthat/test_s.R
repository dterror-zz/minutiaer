

test_that("s interpolation works for single interpolated variables", {
  name <- "John Doe"  
  expect_that(s("Hi, ${name}"), equals("Hi, John Doe"))
})

test_that("s interpolation works for multiple interpolated variables", {
  name <- "John Doe"
  greeting <- "'sup"
  expect_that(s("${greeting}, ${name}"), equals("'sup, John Doe"))
})

test_that("s interpolation fails for undefined variables", {
  name <- "John Doe"
  expect_error(s("${greeting}, ${name}"), "Error : object 'greeting' not found")
})