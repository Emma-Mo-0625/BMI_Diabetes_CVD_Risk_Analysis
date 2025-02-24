/* Generated Code (IMPORT) */
/* Source File: diabetes_binary_health_indicators_BRFSS2015.csv */
/* Source Path: /home/u64041732/Midterm */
/* Code generated on: 10/9/24, 5:44 PM */

proc import datafile="/home/u64041732/Midterm/diabetes_binary_5050split_health_indicators_BRFSS2015.csv"
    out=diabetes
    dbms=csv
    replace;
    getnames=yes;
run;

proc import datafile="/home/u64041732/Midterm/heart_disease_health_indicators_BRFSS2015.csv"
    out=heartdisease
    dbms=csv
    replace;
    getnames=yes;
run;

/* Sort the diabetes dataset by Age */
proc sort data=diabetes;
    by age;
run;

/* Sort the heartdisease dataset by Age */
proc sort data=heartdisease;
    by age;
run;

/* Now merge the two datasets */
data merged_data;
    merge diabetes heartdisease;
    by age;
run;


proc contents data = diabetes;
run;

proc contents data = heartdisease;
run;


/* Step 1: Assign descriptive labels to each age group */

data categorized_data;
    set merged_data;
    
    /* Categorize BMI */
    if bmi < 18.5 then nbmi = 'Underweight';
    else if bmi <= 24.9 and bmi >= 18.5 then nbmi = 'Healthy';
    else if bmi <= 29.9 and bmi >= 25 then nbmi = 'Overweight';
    else if bmi <= 39.9 and bmi >= 30 then nbmi = 'Obese';
    else if bmi >= 40 then nbmi = 'Severely obese';

run;

/* Step 2: Calculate the percentage of Diabetes and Heart Disease for each BMI category */

proc freq data=categorized_data;
    tables nbmi*Diabetes_binary / nocol nopercent norow;
    tables nbmi*HeartDiseaseorAttack / nocol nopercent norow;
run;

/* Step 3: Use PROC TABULATE to generate a summary table with age ranges */

proc tabulate data=categorized_data;
    class nbmi;
    var Diabetes_binary HeartDiseaseorAttack;
    table nbmi, (Diabetes_binary HeartDiseaseorAttack)*(mean='Percentage') / misstext='0.0%';
run;

/* Specify the path for the RTF file */
ods rtf file="/home/u64041732/Midterm/diabetes_heart_disease_charts.rtf";

/* Pie Chart for Diabetes */
proc gchart data=categorized_data;
    where Diabetes_binary = 1; /* Select individuals with diabetes */
    pie nbmi / coutline=black
               percent=inside
               noheading
               value=arrow;
    title "Percentage of Individuals with Diabetes by BMI Category";
run;
quit;

/* Pie Chart for Heart Disease */
proc gchart data=categorized_data;
    where HeartDiseaseorAttack = 1; /* Select individuals with heart disease */
    pie nbmi / coutline=black
               percent=inside
               noheading
               value=arrow;
    title "Percentage of Individuals with Heart Disease by BMI Category";
run;
quit;

/* Reshape data for plotting */
data plot_data;
    set categorized_data;
    Category = "Diabetes";
    Count = Diabetes_binary;
    output;
    
    Category = "Heart Disease";
    Count = HeartDiseaseorAttack;
    output;
    
    keep nbmi Category Count;
run;

/* Stacked Bar Chart */
proc sgplot data=plot_data;
    vbar Category / response=Count group=nbmi groupdisplay=stack datalabel;
    keylegend / title="BMI Category";
    xaxis label="Condition";
    yaxis label="Count";
    title "Stacked Bar Chart of Diabetes and Heart Disease by BMI Category";
run;

/* Close the RTF output */
ods rtf close;


/* hypothesis testing - Chi-square */

proc freq data=categorized_data;
    tables nbmi*Diabetes_binary / chisq;
run;

proc freq data=categorized_data;
    tables nbmi*HeartDiseaseorAttack / chisq;
run;

/* hypothesis testing - t-test */

proc ttest data=categorized_data;
var BMI;
class Diabetes_binary;
RUN;


proc ttest data=categorized_data;
var BMI;
class heartdiseaseorattack;
RUN;


proc tabulate data=categorized_data;
class age nbmi;
var diabetes_binary heartdiseaseorattack;
table age*nbmi,(diabetes_binary heartdiseaseorattack)*(mean='Percentage')/misstext='0.0%';
run;

/*perform logistic regression because of binary data*/
proc logistic data=categorized_data;
    model Diabetes_binary(event='1') = BMI; /* Replace with actual variable names */
    title "Logistic Regression of Diabetes on BMI";
run;

proc logistic data=categorized_data;
    model Diabetes_binary(event='1') = BMI age; /* Replace with actual variable names */
    title "Logistic Regression of Diabetes with Multiple Predictors";
run;

proc logistic data=categorized_data;
    model heartdiseaseorattack(event='1') = BMI age; /* Replace with actual variable names */
    title "Logistic Regression of Diabetes with Multiple Predictors";
run;
