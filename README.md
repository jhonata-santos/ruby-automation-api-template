# **PROJECT API - BEXS TECHNICAL CHALLENGE**
Test Automation Project for Rest APIs, developed in order to validate the technical knowledge for Bexs company.

## **TECHNOLOGIES**
- Ruby
- Cucumber 
- HTTParty
- RSPec

## **PRE REQUIREMENTS TO RUN THE PROJECT**
- Have Ruby version 2.7.3 or greater installed;
  - [How to install Ruby on MacOS](https://medium.com/qaninja/instalando-o-ruby-no-macos-435f451b86a8)
  - [How to install Ruby on Windows](https://medium.com/qaninja/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95)
- With Ruby configured, access via terminal the root folder of the cloned project
```sh
 cd project/root/directory
```
- Run the following commands:
```sh
  gem install bundler
  bundle install
```

## **RUN THE SCENARIOS**
There are two ways to run scenarios.
1. With cucumber there is no clearing of temporary files automatically
2. With rake, a detailed execution report is generated, the old evidence files are cleaned and a static analysis of the code is made generating a report.

#### **WITH CUCUMBER**
- Execution Sequential: `cucumber -t <TAG> -p <ENVIRONMENT> -p <REPORT>`
```
cucumber -t @characters.get -p prd -p report_sequential
```

- Execution Parallel: `parallel_cucumber features/ -o '-t <TAG> -p <ENVIRONMENT>' -n <THREADS> --group-by scenarios`
```
parallel_cucumber features/ -o '-t @full_smoke -p prd -p report_parallel' -n 2 --group-by scenarios  
```

#### **WITH RAKE**
- Execution Sequential: `rake 'sequential_tests[ENVIRONMENT, TAG]'`
```
rake 'sequential_tests[PRD, @stories.get] 
```

- Execution Parallel: `rake 'parallel_tests[ENVIRONMENT, THREADS, TAG]'`
```
rake 'parallel_tests[PRD, 3, @full_smoke] 
```

## **REPORTS**
At the end of the execution, a report is generated in the following path: 
- `reports/final_reports` More detailed and customized reports for sequential and parallel runs
- `reports/sequential` Native Cucumber Basic Report for Sequential Runs
- `reports/parallel` Native Cucumber Basic Report for Parallel Runs

## **EXAMPLES REPORTS EXECUTION**

#### **CUCUMBER NATIVE**
![Capturar](https://user-images.githubusercontent.com/26780125/198173897-db4af282-8b2b-46d5-9115-9408da7bb97a.PNG)
![capturar1](https://user-images.githubusercontent.com/26780125/198174042-764f3e81-2c2d-45e5-ac6d-58241912b0c1.PNG)

#### **REPORT BUILDER**
![Capturar2](https://user-images.githubusercontent.com/26780125/198174280-1df22993-baf7-4aa3-bdfa-0862dfed51a7.PNG)
![Capturar3](https://user-images.githubusercontent.com/26780125/198174283-912ec1b2-191a-4dc3-9cad-0290b7a6ff5e.PNG)
![Capturar4](https://user-images.githubusercontent.com/26780125/198174286-72e634ca-70ba-4931-b466-645d6f0b023b.PNG)

## **RUN STATIC ANALYSIS**
The project uses the Rubocop external library to generate reports on the static analysis of the project

```
rake rubocop 
```

![Capturar5](https://user-images.githubusercontent.com/26780125/198419957-65568e9c-264d-4caa-aa4a-3f94205c8cf8.PNG)
