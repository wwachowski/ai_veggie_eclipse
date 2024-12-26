(deftemplate ui-template
	(slot question (type STRING))
	(multislot options (type STRING))
    (slot result (type STRING)

))

(deffacts startup
   (start)
)

(defrule remove-old-ui
	?f1 <- (clean)
	?f2 <- (ui-template)
	=>
	(retract ?f1)
	(retract ?f2)
)

(defrule Japan
   (start)
   =>
   (assert (ui-template (question "Japan") (options "Yes" "No")))
)

(defrule JapanAnswer
   (JapanYes)
   =>
   (assert (ui-template (result "JapanAnswer")))
)

(defrule MissMeat
   (JapanNo)
   =>
   (assert (ui-template (question "MissMeat") (options "Yes" "No")))
)

(defrule MissMeatAnswer
   (MissMeatYes)
   =>
   (assert (ui-template (result "MissMeatAnswer")))
)

(defrule Summer
   (MissMeatNo)
   =>
   (assert (ui-template (question "Summer") (options "Yes" "No")))
)

(defrule SummerAnswer
   (SummerYes)
   =>
   (assert (ui-template (result "SummerAnswer")))
)

(defrule Thanksgiving
   (SummerNo)
   =>
   (assert (ui-template (question "Thanksgiving") (options "Yes" "No")))
)

(defrule ThanksgivingAnswer
   (ThanksgivingYes)
   =>
   (assert (ui-template (result "ThanksgivingAnswer")))
)

(defrule Pee
   (ThanksgivingNo)
   =>
   (assert (ui-template (question "Pee") (options "Yes" "No")))
)

(defrule PeeAnswer
   (PeeYes)
   =>
   (assert (ui-template (result "PeeAnswer")))
)

(defrule Halloween
   (PeeNo)
   =>
   (assert (ui-template (question "Halloween") (options "Yes" "No")))
)

(defrule HalloweenAnswer
   (HalloweenYes)
   =>
   (assert (ui-template (result "HalloweenAnswer")))
)

(defrule Poor
   (HalloweenNo)
   =>
   (assert (ui-template (question "Poor") (options "Yes" "No")))
)

(defrule PoorAnswer
   (PoorYes)
   =>
   (assert (ui-template (result "PoorAnswer")))
)

(defrule Mexican
   (PoorNo)
   =>
   (assert (ui-template (question "Mexican") (options "Yes" "No")))
)

(defrule MexicanAnswer
   (MexicanYes)
   =>
   (assert (ui-template (result "MexicanAnswer")))
)

(defrule DeepSouth
   (MexicanNo)
   =>
   (assert (ui-template (question "DeepSouth") (options "Yes" "No")))
)

(defrule DeepSouthAnswer
   (DeepSouthYes)
   =>
   (assert (ui-template (result "DeepSouthAnswer")))
)

(defrule Popeye
   (DeepSouthNo)
   =>
   (assert (ui-template (question "Popeye") (options "Yes" "No")))
)

(defrule PopeyeAnswer
   (PopeyeYes)
   =>
   (assert (ui-template (result "PopeyeAnswer")))
)

(defrule Corona
   (PopeyeNo)
   =>
   (assert (ui-template (question "Corona") (options "Yes" "No")))
)

(defrule CoronaAnswer
   (CoronaYes)
   =>
   (assert (ui-template (result "CoronaAnswer")))
)

(defrule Doctor
   (CoronaNo)
   =>
   (assert (ui-template (question "Doctor") (options "Yes" "No")))
)

(defrule DoctorAnswer
   (DoctorYes)
   =>
   (assert (ui-template (result "DoctorAnswer")))
)

(defrule It
   (DoctorNo)
   =>
   (assert (ui-template (question "It") (options "Yes" "No")))
)

(defrule ItAnswer
   (ItYes)
   =>
   (assert (ui-template (result "ItAnswer")))
)

(defrule Chef
   (ItNo)
   =>
   (assert (ui-template (question "Chef") (options "Yes" "No")))
)

(defrule ChefAnswer
   (ChefYes)
   =>
   (assert (ui-template (result "ChefAnswer")))
)

(defrule Dirt
   (ChefNo)
   =>
   (assert (ui-template (question "Dirt") (options "Yes" "No")))
)

(defrule DirtAnswer
   (DirtYes)
   =>
   (assert (ui-template (result "DirtAnswer")))
)

(defrule Mayo
   (DirtNo)
   =>
   (assert (ui-template (question "Mayo") (options "Yes" "No")))
)

(defrule MayoAnswer
   (MayoYes)
   =>
   (assert (ui-template (result "MayoAnswer")))
)

(defrule Regular
   (MayoNo)
   =>
   (assert (ui-template (question "Regular") (options "Yes" "No")))
)

(defrule RegularAnswer
   (RegularYes)
   =>
   (assert (ui-template (result "RegularAnswer")))
)

(defrule Hawaii
   (RegularNo)
   =>
   (assert (ui-template (question "Hawaii") (options "Yes" "No")))
)

(defrule HawaiiAnswer
   (HawaiiYes)
   =>
   (assert (ui-template (result "HawaiiAnswer")))
)

(defrule Simspon
   (HawaiiNo)
   =>
   (assert (ui-template (question "Simspon") (options "Yes" "No")))
)

(defrule SimsponAnswer
   (SimsponYes)
   =>
   (assert (ui-template (result "SimsponAnswer")))
)

(defrule Couple
   (SimsponNo)
   =>
   (assert (ui-template (question "Couple") (options "Yes" "No")))
)

(defrule CoupleAnswer
   (CoupleYes)
   =>
   (assert (ui-template (result "CoupleAnswer")))
)

(defrule MomCooking
   (CoupleNo)
   =>
   (assert (ui-template (question "MomCooking") (options "Yes" "No")))
)

(defrule Mom
   (MomCookingYes)
   =>
   (assert (ui-template (question "Mom") (options "Yes" "No")))
)

(defrule MomAnswer
   (MomYes)
   =>
   (assert (ui-template (result "MomAnswer")))
)

(defrule MomNoAnswer
   (MomNo)
   =>
   (assert (ui-template (result "MomNoAnswer")))
)

(defrule Smoothie
   (MomCookingNo)
   =>
   (assert (ui-template (question "Smoothie") (options "Yes" "No")))
)

(defrule SmoothieAnswer
   (SmoothieYes)
   =>
   (assert (ui-template (result "SmoothieAnswer")))
)

(defrule Juicer
   (SmoothieNo)
   =>
   (assert (ui-template (question "Juicer") (options "Yes" "No")))
)

(defrule JuicerAnswer
   (JuicerYes)
   =>
   (assert (ui-template (result "JuicerAnswer")))
)

(defrule Hype
   (JuicerNo)
   =>
   (assert (ui-template (question "Hype") (options "Yes" "No")))
)

(defrule HypeAnswer
   (HypeYes)
   =>
   (assert (ui-template (result "HypeAnswer")))
)

(defrule EndOfLife
   (HypeNo)
   =>
   (assert (ui-template (question "EndOfLife") (options "Yes" "No")))
)

(defrule EndOfLifeAnswer
   (EndOfLifeYes)
   =>
   (assert (ui-template (result "EndOfLifeAnswer")))
)

(defrule FoodNetwork
   (EndOfLifeNo)
   =>
   (assert (ui-template (question "FoodNetwork") (options "Yes" "No")))
)

(defrule FoodNetworkAnswer
   (FoodNetworkYes)
   =>
   (assert (ui-template (result "FoodNetworkAnswer")))
)

(defrule Snack
   (FoodNetworkNo)
   =>
   (assert (ui-template (question "Snack") (options "Yes" "No")))
)

(defrule SnackAnswer
   (SnackYes)
   =>
   (assert (ui-template (result "SnackAnswer")))
)

(defrule Date
   (SnackNo)
   =>
   (assert (ui-template (question "Date") (options "Yes" "No")))
)

(defrule DateAnswer
   (DateYes)
   =>
   (assert (ui-template (result "DateAnswer")))
)

(defrule What
   (DateNo)
   =>
   (assert (ui-template (question "What") (options "Yes" "No")))
)

(defrule WhatAnswer
   (WhatYes)
   =>
   (assert (ui-template (result "WhatAnswer")))
)

(defrule BestFruit
   (WhatNo)
   =>
   (assert (ui-template (question "BestFruit") (options "Yes" "No")))
)

(defrule BestFruitAnswer
   (BestFruitYes)
   =>
   (assert (ui-template (result "BestFruitAnswer")))
)

(defrule BestVegetable
   (BestFruitNo)
   =>
   (assert (ui-template (question "BestVegetable") (options "Yes" "No")))
)

(defrule BestVegetableAnswer
   (BestVegetableYes)
   =>
   (assert (ui-template (result "BestVegetableAnswer")))
)

(defrule Youth
   (BestVegetableNo)
   =>
   (assert (ui-template (question "Youth") (options "Yes" "No")))
)

(defrule YouthAnswer
   (YouthYes)
   =>
   (assert (ui-template (result "YouthAnswer")))
)

(defrule Pasta
   (YouthNo)
   =>
   (assert (ui-template (question "Pasta") (options "Yes" "No")))
)

(defrule PastaAnswer
   (PastaYes)
   =>
   (assert (ui-template (result "PastaAnswer")))
)

(defrule PastaNoAnswer
   (PastaNo)
   =>
   (assert (ui-template (result "PastaNoAnswer")))
)




