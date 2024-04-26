# LookerDataFlow
Experience complete transparency in your data journey with Looker Dataflow. Trace transformations from dashboards to source tables, facilitating debugging and understanding dashboard impacts. Simplify troubleshooting and ensure data integrity effortlessly.

Welcome to the Looker Dataflow!

Before running the script there are some things you need to do first. 

1. Add this dimension to all the **non derived tables** views that you use in your explores. The dimension must match with the **sql_table_name**. This way we can know
   where these dimensions and measures pull their data from.
```
   view: view_name {
      sql_table_name: "PUBLIC"."EXAMPLE" ;;

      ##This dimension is for API test use only
        dimension: for_testing {
          hidden: yes
          sql: 'PUBLIC"."EXAMPLE' ;;
        }
```

### Please install Python

### Clone the Repository

### Create a virtual environment
```
python3 -m venv path/to/venv
```

### Activate the virtual environment
```
source path/to/venv/bin/activate
```
### Install packages within the virtual environment
```
python -m pip install pandas
```
### Install the looker SDK:
```
python -m pip install looker_sdk
```
#### Add the needed credentials and url into lookercredentials.ini file in your local environment

#### Remember that these credentials are private and should not be shared to anyone, as they could delete or modify on your behalf.

#### Add all the explores names into explores.txt in the repository file in your local environment

![Screenshot 2024-04-25 at 4 59 17 p m](https://github.com/TheDiegoFrade/LookerDataFlow/assets/40186865/80610f0e-31a2-48d1-8595-8e01ace1ee52)

## Open the LookerDataFlow repository that you just cloned
```
cd LookerDataFlow/
```

### Now you can run the lookerapicleansing.py
```
python lookerapicleansing.py
```
### You will get 3 files as a result, upload them into you datawarehouse tool as independent tables. 
![Screenshot 2024-04-25 at 10 45 14 p m](https://github.com/TheDiegoFrade/LookerDataFlow/assets/40186865/c3ba326a-f983-4a62-a1b4-7b383e012f89)

### Drag and drop the lookml_views file into your Looker Project
![Screenshot 2024-04-25 at 10 57 05 p m](https://github.com/TheDiegoFrade/LookerDataFlow/assets/40186865/f4e6228f-d18b-4a7c-bb06-6a42682dec24)

[Looker documentation link](https://cloud.google.com/looker/docs/creating-project-files#uploading_files)

### Configure your Lookml Model so you include these views and explores, edit as needed.

