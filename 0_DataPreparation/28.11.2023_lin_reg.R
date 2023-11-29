library(tibble)
library(dplyr)
#Einladen der Daten
kiwo <- read.csv("https://raw.githubusercontent.com/opencampus-sh/einfuehrung-in-data-science-und-ml/main/kiwo.csv", header = TRUE, sep = ",", dec = ".")
wetter <- read.csv("https://raw.githubusercontent.com/opencampus-sh/einfuehrung-in-data-science-und-ml/main/wetter.csv", header = TRUE, sep = ",", dec = ".")
umsatz <- read.csv("https://raw.githubusercontent.com/opencampus-sh/einfuehrung-in-data-science-und-ml/main/umsatzdaten_gekuerzt.csv", header = TRUE, sep = ",", dec = ".")

#Zusammenführen der Daten
daten_tibble <- wetter %>%
  left_join(umsatz, by = "Datum") %>%
  left_join(kiwo, by = "Datum")
print(daten_tibble)

#Erstellung des linearen Models
linearesmodell <- lm(daten_tibble$Umsatz ~ as.factor(daten_tibble$Warengruppe) + daten_tibble$Wettercode)
summary(linearesmodell)
