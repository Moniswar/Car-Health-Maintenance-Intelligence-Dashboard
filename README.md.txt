# 🚗 Car Health & Maintenance Intelligence

An interactive Power BI dashboard designed to monitor vehicle health, maintenance requirements, component failures, downtime, and maintenance costs across different car models.

The project transforms raw vehicle maintenance data into an operational decision-support dashboard that helps identify vehicle health issues and prioritize maintenance actions.

---

## 📌 Project Overview

Vehicle maintenance teams often deal with large amounts of information across different vehicles, components, failures, maintenance activities, and service centers.

The goal of this project is to provide a single interactive dashboard that answers:

> **Which vehicles and components require attention, what is causing failures, and where is maintenance effort being spent?**

The dashboard allows users to explore vehicle health from both a **vehicle-level** and **component-level** perspective.

---

## 🎯 Business Problem

Maintenance teams need to identify:

- Vehicles requiring inspection
- Critical and warning conditions
- Components responsible for failures
- Maintenance costs
- Vehicle downtime
- Preventive vs corrective maintenance
- Patterns across different vehicle models

Without an interactive analytical view, identifying these issues from raw maintenance records can be time-consuming.

This dashboard provides a centralized view of vehicle health and maintenance operations.

---

## 👥 Target Users

The dashboard is designed for:

- Fleet Managers
- Maintenance Managers
- Service Center Managers
- Operations Managers
- Automotive Analysts

---

## 🔍 Key Questions Answered

### Vehicle Health
- How many vehicles are healthy, under maintenance, or require inspection?
- What is the average vehicle health score?
- Which vehicle models show more critical conditions?

### Maintenance
- How much is being spent on maintenance?
- Which components generate the highest maintenance costs?
- What type of maintenance is most common?

### Failures
- Which components experience the most failures?
- What are the major failure types?
- Which vehicle models are more affected?

### Downtime
- Which components contribute most to downtime?
- Which vehicles require longer maintenance periods?

---

## 📊 Dashboard Features

### 1. Vehicle Condition

Provides an overview of:

- Healthy vehicles
- Warning-condition vehicles
- Critical-condition vehicles

Users can interact with the dashboard to analyze specific vehicle models.

---

### 2. Vehicle Model Selection

The dashboard supports interactive selection of:

- City Car
- Compact Car
- Crossover
- Hatchback
- Premium Sedan
- Sedan

Selecting a vehicle model updates the dashboard visuals to focus on that model.

---

### 3. Component Analysis

Users can investigate individual components such as:

- Engine
- Battery
- Tyres
- Brakes
- Suspension
- Transmission
- Cooling System
- Headlights

Component selection allows maintenance teams to investigate specific areas of vehicle health.

---

### 4. Healthy vs Damaged Analysis

The dashboard provides two analytical states:

**HEALTHY**

Focuses on vehicles/components operating in healthy conditions.

**DAMAGED**

Focuses on vehicles requiring attention based on warning and critical conditions.

---

### 5. Maintenance Cost Analysis

Tracks maintenance expenditure across different components and vehicle conditions.

This helps identify where maintenance budgets are being utilized.

---

### 6. Failure Analysis

Analyzes failure patterns across vehicle components and failure types.

This helps identify components that require greater preventive-maintenance attention.

---

### 7. Downtime Analysis

Measures downtime associated with vehicle components and maintenance activities.

This helps identify operational areas contributing to vehicle unavailability.

---

## 📈 Key KPIs

The dashboard includes the following KPIs:

| KPI | Description |
|---|---|
| **Total Cars** | Number of unique vehicles analyzed |
| **Average Health Score** | Average health score across vehicles |
| **Total Maintenance Cost** | Total recorded maintenance expenditure |
| **Total Downtime** | Total maintenance-related downtime |
| **Total Failures** | Number of recorded vehicle failures |

---

## 🛠️ Tools & Technologies

- **Microsoft Excel** – Dataset preparation and initial data handling
- **SQL** – Data querying and analysis
- **Microsoft Power BI** – Data modeling, DAX measures, visualization and dashboard development

### Power BI Features Used

- DAX Measures
- Slicers
- Bookmarks
- Selection Pane
- Visual Groups
- Buttons
- Interactive Filtering
- KPI Cards
- Data Visualization

---

## 🗂️ Data

The dataset contains vehicle-level maintenance records including:

- Car ID
- Car Model
- Model Year
- Car Age
- Mileage
- Fuel Type
- Region
- Component
- Health Score
- Condition
- Failure Type
- Failure Date
- Maintenance Type
- Maintenance Cost
- Downtime Hours
- Service Center
- Car Status

---

## 🧮 Key DAX Measures

### Total Cars

```DAX
Total Cars =
DISTINCTCOUNT(CarData[Car_ID])