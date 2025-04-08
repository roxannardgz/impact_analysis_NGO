# Impact Analysis of GoodThought NGO Initiatives
<br><br>

### 🎯 Project Goal
To assess the effectiveness of GoodThought NGO's initiatives accross education, healthcare, and sustainable development by analyzing funding distribution, donor behavior, and project performance using SQL.

<br>

### 🔎 Overview
GoodTought is an international NGO focused on driving positive change in the areas of education, healthcare, and sustainable development. This project uses real-world-style data containing detailed records of assignments, donations, and donor information, to uncover how donations aligh with project impact, identify regional performance trends, and evaluate donor engagement. 

One main objective was to translate complex organizational efforts into measurable outcomes, helping stakeholders understand where impact is being made—and where improvement is needed.

<br>

### 🗂️ Data
Data was stored in a PostgreSQL database, simulating operations from 2010 to 2023. It included three interconnected tables:

- **`Assignments`:** Details about each project, including its name, duration (start and end dates), budget, geographical region, and the impact score.
- **`Donations`:** Records of financial contributions, linked to specific donors and assignments, highlighting how financial support is allocated and utilized.
- **`Donors`:** Information on individuals and organizations that fund GoodThought’s projects, including donor types.

Refer to the below ERD diagram for a visual representation of the relationships between these data tables:

<br>

### 🧩 Key Tasks & SQL Challenges
1. Top Funded Assignments by Donor Type. <br>
Queried total donation amounts per assignment and donor type to find the top five projects.

2. Top Impact Assignments per Region. <br>
Filtered assignments that had at least one donation and returned the highest impact score per region.

3. Funding Trends Over Time. <br>
Analyzed yearly donation totals categorized by donor type to track financial engagement over time.

4. Underperforming Assignments. <br>
Flagged projects with lower-than-average impact scores that still received funding.

5. Donor Engagement Analysis. <br>
Ranked donors by total contributions and the number of unique projects supported.

<br>

### 🧠 Skills Demonstrated
- Writing optimized SQL queries (CTEs, joins, grouping, aggregations, partitioning, subqueries).
- Turning raw data into actionable insights.
- Identifying KPIs for social impact evaluation.
