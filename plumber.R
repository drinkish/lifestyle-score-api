# plumber.R
library(plumber)

# Helper: convert Lifestyle Score → age delta
score_to_delta <- c(`0` = 6, `1` = 3, `2` = 1, `3` = -1, `4` = -3, `5` = -5)

#* Health-check
#* @get /ping
function(){ list(msg = "pong") }

#* Lifestyle-Age calculator
#* @param age:int Chronological age (years)
#* @param bmi:double Body-mass index
#* @param smoking:int 1 = never-smoked, 0 = current/former
#* @param activity:int Minutes of moderate+ activity per week
#* @param alcohol:int UK units per week
#* @param diet:int 1 = passes Eatwell screener / healthy preset
#* @post /lifestyle_age
#* @serializer json
function(age, bmi, smoking, activity, alcohol, diet){

  # Explicit type conversion for robustness and debugging
  age <- as.integer(age)
  bmi <- as.numeric(bmi)
  smoking <- as.integer(smoking)
  activity <- as.integer(activity)
  alcohol <- as.integer(alcohol)
  diet <- as.integer(diet)


  score <- (smoking == 1) +
           (bmi >= 18.5 & bmi <= 24.9) +
           (activity >= 150) +
           (alcohol <= 14) +
           (diet == 1)
  

  char_score <- as.character(score)


  delta <- score_to_delta[char_score]


  # If delta is NA, it might cause issues in arithmetic or JSON serialization
  # For now, the error is "non-numeric argument", let's see if above fixes it.
  # If delta becomes NA, age + NA will be NA. If the serializer has issues with NA, that's another step.

  list(
    lifestyle_age = age + delta,
    delta         = unname(delta),
    score         = score
  )
}