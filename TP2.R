library(FactoMineR)
library(Factoshiny)
library(readr)

life_expectancy <- read_csv("Life-Expectancy-Data-Averaged.csv")
rownames(life_expectancy) <- life_expectancy$Country
life_expectancy$Country <- NULL


life_expectancy$Economy_status <- as.factor(life_expectancy$Economy_status)
life_expectancy$Year <- as.factor(life_expectancy$Year)
life_expectancy <- life_expectancy[, !(names(life_expectancy) %in% c("Life_expectancy"))]

str(life_expectancy)
res <- Factoshiny(life_expectancy)

############################################################
# 3. Analyse des variables – Interprétation
############################################################

# b. Variables positivement et négativement corrélées
# ---------------------------------------------------
# Variables positivement corrélées entre elles :
#   Schooling, GDP_per_capita, BMI, Alcohol_consumption,
#   Diphtheria, Polio, Hepatitis_B, Measles
# → Ces variables pointent dans la même direction (côté droit du cercle des corrélations).
# → Elles traduisent un bon niveau socio-économique et sanitaire :
#   haut PIB, meilleure scolarisation, bonne couverture vaccinale et santé générale.
#
# Variables négativement corrélées avec les précédentes :
#   Adult_mortality, Infant_deaths, Under_five_deaths, HIV,
#   Thinness_five_nine_years, Thinness_ten_nineteen_years
# → Ces variables sont situées du côté opposé du cercle (côté gauche).
# → Elles reflètent des conditions de santé précaires :
#   forte mortalité, malnutrition et prévalence élevée de maladies.
#
# => L’axe horizontal oppose donc clairement les pays développés aux pays en développement
#    selon leurs conditions de vie et de santé.

# ---------------------------------------------------
# c. Variables qui contribuent le plus à la formation du premier axe
# ---------------------------------------------------
# Les variables les plus fortement liées à l’axe 1 sont :
#   - Côté positif : Schooling, GDP_per_capita, Diphtheria, Polio, Hepatitis_B, BMI
#   - Côté négatif : Adult_mortality, Infant_deaths, Under_five_deaths
# Ces variables contribuent le plus à la construction du premier axe (Dim 1).

# ---------------------------------------------------
# d. Interprétation de l’axe 1
# ---------------------------------------------------
# L’axe 1 explique environ 50.6 % de la variance totale.
# Il représente un gradient de développement socio-économique et sanitaire :
#   - À droite : pays développés → haut PIB, bonne éducation, forte couverture vaccinale, faible mortalité.
#   - À gauche : pays moins développés → forte mortalité, malnutrition, faible revenu.
#
# => Axe 1 = Niveau de développement humain et sanitaire.

# ---------------------------------------------------
# e. Interprétation de l’axe 2
# ---------------------------------------------------
# L’axe 2 explique environ 12.2 % de la variance totale.
# Il oppose principalement :
#   - En haut : Thinness_five_nine_years, Thinness_ten_nineteen_years,
#               Population_mln, HIV
#   - En bas : peu de variables marquées.
#
# Cet axe illustre un gradient démographique et épidémiologique :
#   malnutrition chez les enfants/adolescents, prévalence du VIH et taille de la population.
#
# => Axe 2 = Profil démographique et épidémiologique (malnutrition / VIH / densité de population).

# ---------------------------------------------------
# ynthèse générale
# ---------------------------------------------------
# | Axe | % Variance | Interprétation | Variables principales |
# |-----|-------------|----------------|------------------------|
# |  1  | 50.6 %      | Niveau de développement socio-économique et sanitaire |
# |     |             | GDP_per_capita, Schooling, Vaccinations, Mortality   |
# |  2  | 12.2 %      | Profil démographique et épidémiologique              |
# |     |             | Thinness, HIV, Population                            |
#
# En conclusion :
# L’ACP met en évidence deux dimensions majeures :
#   (1) Un axe de développement humain et sanitaire opposant les pays riches et sains
#       aux pays pauvres et à forte mortalité.
#   (2) Un axe épidémiologique et démographique reflétant la malnutrition et le VIH.
#
# Ensemble, ces deux axes expliquent environ 63 % de la variabilité totale du jeu de données.
############################################################
