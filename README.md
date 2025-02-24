# Diabetes and Cardiovascular Disease Risk Analysis

## 📌 Project Overview
This project explores the impact of **Body Mass Index (BMI)** on the risk of developing **diabetes** and **cardiovascular diseases (CVDs)** using publicly available health datasets. Given the increasing prevalence of these chronic diseases, our study provides statistical insights into how BMI correlates with disease risk, offering valuable implications for public health interventions.

This project was completed as part of the **Master in Data Science in Health program at UCLA** for the **Biostat 203A Fall 2024** course.

---

## 📊 Datasets Used
We utilized two publicly available datasets from **Kaggle**:

1. **[Diabetes Health Indicators Dataset](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset)**  
   - **File used**: `diabetes_binary_5050split_health_indicators_BRFSS2015.csv`  
   - Contains health indicators relevant to diabetes, including BMI, smoking, physical activity, and blood pressure.

2. **[Heart Disease Health Indicators Dataset](https://www.kaggle.com/datasets/alexteboul/heart-disease-health-indicators-dataset)**  
   - **File used**: `heart_disease_health_indicators_BRFSS2015.csv`  
   - Similar to the diabetes dataset, this includes key factors contributing to cardiovascular disease.

---

## 📂 Project Files
- `Midterm Project.sas` - SAS script used for data processing and analysis.
- `Program0_Start.sas` - Initial SAS program setup.
- `Midterm_Report.pdf` - Full report detailing methodology, statistical analysis, and results.

---

## 🏥 Research Objectives
- Investigate the relationship between **BMI and the prevalence of diabetes and heart disease**.
- Use **descriptive statistics** and **hypothesis testing** to determine the significance of BMI as a risk factor.
- Provide **visual insights** into disease distribution across BMI categories.
- Conduct **logistic regression analysis** to quantify the effect of BMI on disease likelihood.

---

## 🔬 Methodology
### 1️⃣ Data Preparation
- **Data Cleaning**: Removed missing values to ensure robust analysis.
- **BMI Categorization**: Classified individuals as *Underweight*, *Healthy Weight*, *Overweight*, *Obese*, or *Severely Obese*.
- **Sample Size**: 253,680 participants (218,334 with diabetes, 23,893 with heart disease).

### 2️⃣ Statistical Analysis
- **Descriptive Statistics**  
  - **Pie Charts**: Displayed disease prevalence across BMI categories.
  - **Stacked Bar Charts**: Compared diabetes and heart disease cases among BMI groups.
- **Hypothesis Testing**  
  - **Chi-square test**:  
    - **Diabetes**: χ² = 176.3728, **p < 0.0001** (significant association).  
    - **Heart Disease**: χ² = 1011.5781, **p < 0.0001** (significant association).  
  - **t-test**: Rejected the null hypothesis, confirming BMI differences between disease and non-disease groups.
- **Logistic Regression**  
  - **Diabetes**: 3% increase in risk per BMI unit increase.  
  - **Heart Disease**: 3% increase per BMI unit, **32% increase per year of aging**.

---

## 📈 Key Findings
✅ Higher **BMI is strongly associated** with increased risk of **both diabetes and cardiovascular diseases**.  
✅ **Overweight** and **obese** individuals account for the majority of cases.  
✅ **Aging** has a significantly higher impact on **heart disease** than on diabetes.  
✅ Public health strategies should prioritize **BMI management** and **healthy lifestyle interventions**.

---

## 🚀 How to Run the Analysis
1. Install **SAS** (if not already installed).
2. Run `Midterm Project.sas` to process and analyze the datasets.
3. Use `Midterm_Report.pdf` to view detailed results and insights.

---

## 🔮 Future Work
- Incorporate **genetic factors** and **socioeconomic variables** for a more comprehensive risk assessment.
- Explore **machine learning models** to predict disease risk based on multiple health indicators.
- Validate findings with **clinical trial data**.

---

## 📜 References
1. [WHO - Diabetes Statistics & Risk Factors](https://www.who.int/news-room/fact-sheets/detail/diabetes)
2. [WHO - Cardiovascular Diseases Overview](https://www.who.int/health-topics/cardiovascular-diseases#tab=tab_1)
3. Piché, M.-E. et al. *Obesity, Diabetes, and Cardiovascular Disease.* Circulation Research, 2020.

---

## 👨‍💻 Authors
- **Emily Chiang**  
- **Emma Mo**  
- **Shengge Cheng**  
- **Junlian Cao**  

📍 *UCLA | Master in Data Science in Health | Fall 2024*

