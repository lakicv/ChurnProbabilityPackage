
context("Max greater than Min")

test_that("The maximum churnprob is alway greater than the minimum churnprob", {
  CustomerId <- c(15565701, 15565706, 15565714, 15565779, 15565796, 15565806, 15565878, 15565879, 15565891, 15565996)
  Tenure <- c(9, 1, 1, 6, 10, 9, 3, 9, 8, 8)
  Balance <- c(161993.89, 0.00, 64430.06, 57809.32, 96048.55, 0.00, 0.00, 0.00, 0.00, 0.00)
  NumOfProducts <- c(1, 1, 2, 1, 1, 2, 2, 2, 2, 2)
  HasCrCard <- c(0, 1, 0, 1, 1, 0, 1, 1, 1, 1)
  IsActiveMember <- c(0,1,1,0,0,0,1,1,0,1)
  Exited <- c(0,1,0,0,0,0,0,0,0,0)
  Surname <- c("Ferri", "Akobundu", "Cattaneo", "Kent", "Docherty", "Toosey", "Bates", "Riley", "Dipietro", "Arnold")
  CreditScore <- c(698, 612, 601, 627, 745, 532, 631, 845, 709, 653)
  Gender <- c("Female", "Male", "Male", "Female", "Male", "Male", "Male", "Female", "Male", "Male")
  Age <- c(39, 35, 47, 30, 48, 38, 29, 28, 39, 44)
  EstimatedSalary <- c(90212.38, 83256.26, 96517.97, 188258.49, 74510.65, 30583.95, 197963.46, 56185.98, 56214.09, 154639.72)
  zip_state <- c("MA", "NH", "CT", "MA", "NH", "RI", "CT", "NJ", "CT", "NJ")
  zip_city <- c("North Reading", "Durham", "Stamford", "Boston", "Brookline", "North Kingstown", "Ridgefield", "Madison", "Cheshire", "Bayonne")
  zip_latitude <- c(42.58344, 43.12808, 41.04800, 42.35653, 42.74259, 41.58970, 41.29791, 40.75875, 41.50705, 40.66655)
  zip_longitude <- c(-71.09820, -70.96035, -73.53688, -71.05365, -71.66605, -71.45400, -73.49178, -74.41609, -72.90489, -74.11768)

  test_data <- data.table(CustomerId, Tenure, Balance, NumOfProducts, HasCrCard, IsActiveMember, Exited, Surname, CreditScore, Gender, Age, EstimatedSalary, zip_state, zip_city, zip_latitude, zip_longitude)

  test_data[, Exited:=as.factor(Exited)]
  test_data[, Gender:=as.factor(Gender)]

  print("test")
  print(str(test_data))
  print("test")

  expect_gte(GetMaxChurnProb(test_data), GetMinChurnProb(test_data))
})
