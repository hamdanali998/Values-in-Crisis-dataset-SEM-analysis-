# Values-in-Crisis-dataset-SEM-analysis-



# Mental Health, Personal Values, and Well-Being: A Structural Equation Modeling Analysis

## Overview

This repository contains the R scripts used to examine the relationships between mental health, Schwartz's personal values, and subjective well-being using Structural Equation Modeling (SEM).

The analysis uses data from the **Values in Crisis** international survey and investigates how different value dimensions and mental health are associated with well-being while adjusting for demographic characteristics.

---

## Research Model

The conceptual model includes:

### Latent Predictors

- Mental Health
  - Anxiety
  - Worry
  - Depression
  - Low interest
  - Loneliness

- Self-Transcendence
  - Equality
  - Caring for others
  - Helping society
  - Social good
  - Environmental protection

- Conservation
  - Safety
  - Tradition
  - Loyalty
  - Respect
  - Proper behavior

- Openness to Change
  - Creativity
  - Independence
  - Adventure
  - Novelty

- Self-Enhancement
  - Wealth
  - Success
  - Achievement

### Outcome

Well-being

- Health satisfaction
- Social satisfaction
- Life satisfaction

### Covariates

- Age
- Sex

Correlations were estimated among all latent predictor variables.

---

## Analysis Workflow

The repository follows the following workflow:

1. Data cleaning and preprocessing
2. Variable selection and renaming
3. Missing data assessment
4. Confirmatory Factor Analysis (CFA)
5. Composite Reliability (CR) and Average Variance Extracted (AVE)
6. Variance Inflation Factor (VIF) assessment
7. Structural Equation Modeling (SEM)

---

## Repository Structure

| File | Description |
|------|-------------|
| 01 cleaning script.R | Data cleaning, preprocessing, missing data assessment, and variable preparation |
| 02 CFA script.R | Confirmatory Factor Analysis of latent constructs |
| 03 Composite reliability script.R | Composite Reliability (CR) and Average Variance Extracted (AVE) |
| 04 VIF.R | Multicollinearity assessment using Variance Inflation Factors |
| 05 SEM.R | Structural Equation Model specification and estimation |

---

## Statistical Software

- R
- lavaan
- semTools
- tidyverse
- janitor
- car
- dplyr

---

## SEM Estimation

The structural equation model was estimated using the **WLSMV (Weighted Least Squares Mean and Variance Adjusted)** estimator implemented in the **lavaan** package.

---

## Dataset

**Values in Crisis**

- International cross-sectional survey
- 40,530 respondents
- Multiple participating countries
- Includes measures of mental health, personal values, personality, and well-being

Dataset information:
https://data.aussda.at/dataset.xhtml?persistentId=doi:10.11587/LIHK1L

---


## License

This repository is intended for academic and research purposes.
