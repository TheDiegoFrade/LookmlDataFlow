import looker_sdk
import os
import re
import pandas as pd
from datetime import date
import subprocess
import configparser


# Get the parent directory path
parent_dir = os.path.abspath(os.path.join(os.getcwd(), os.pardir))

looker_api_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api')

# Check if the folder already exists

if not os.path.exists(looker_api_path):
    # If it doesn't exist, create the folder
    os.mkdir(looker_api_path)
    print("looker_api folder created.")
else:
    print("looker_api folder already exists.")


# Construct the path to the lookercredentials.ini file
ini_file_path = os.path.join(parent_dir, 'LookmlDataFlow/lookercredentials.ini')

# Read the credentials from the ini file
config = configparser.ConfigParser()
config.read(ini_file_path)

client_id = config['Lookercredentials']['client_id']
client_secret = config['Lookercredentials']['client_secret']
looker_url = config['Lookercredentials']['base_url']

# PLEASE YOU MUST ADD
# 1. LOOKERURL 
# 2. LOOKERSDK_CLIENT_ID ask your looker admin to provide this
# 3. LOOKERSDK_CLIENT_SECRET ask your looker admin to provide this

#INTO THE lookercredentials.ini file


os.environ["LOOKERSDK_BASE_URL"] = looker_url
os.environ["LOOKERSDK_API_VERSION"] = "4.0"  # 4.0 is the most recent version
os.environ["LOOKERSDK_VERIFY_SSL"] = "true"  # Defaults to true if not set. SSL verification should generally be on unless you have a real good reason not to use it. Valid options: true, y, t, yes, 1.
os.environ["LOOKERSDK_TIMEOUT"] = "120"  # Seconds till request timeout. Standard default is 120.

# User Credentials (set these as environment variables)
# os.environ["LOOKERSDK_CLIENT_ID"] =  "clientidprivate" # No defaults.
# os.environ["LOOKERSDK_CLIENT_SECRET"] = "clientsecretprivate" # No defaults. This should be protected at all costs. Please do not leave it sitting here, even if you don't share this document.

# Accessing credentials from environment variables
os.environ["LOOKERSDK_CLIENT_ID"] =  client_id #No defaults.
os.environ["LOOKERSDK_CLIENT_SECRET"] = client_secret

if client_id is None or client_secret is None:
    print("Error: Client ID or Client Secret not provided.")
    exit(1)

#Initializa SDK Version 4.0
sdk = looker_sdk.init40()
print('Looker SDK 4.0 initialized successfully.')

#Test that the SDK is working by printing your Looker User info

my_user = sdk.me()

print('Hi',my_user["first_name"],' ',my_user["last_name"],' I am the Looker Data Flow')

# Check if the folder already exists
if not os.path.exists('looker_api'):
    # If it doesn't exist, create the folder
    os.mkdir('looker_api')
    print("looker_api folder created.")
else:
    print("looker_api folder already exists.")

# Check if data_looker.txt exists inside the looker_api folder

data_looker_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/data_looker.txt')
if os.path.exists(data_looker_path):
    print("data_looker.txt exists in looker_api folder.")
else:
    # If data_looker.txt doesn't exist, create it
    with open(data_looker_path, 'w') as text_file:
        print("data_looker.txt created in looker_api folder.")

# Regardless of whether data_looker.txt exists, open it for appending or reading
text_file = open(data_looker_path, 'a+')

# Specify the path to your explores.txt file
explore_file_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/explores.txt')

# Read the lines from the file
with open(explore_file_path, 'r') as file:
    explores = [line.strip() for line in file]

# Print the list of explore names
print('The cleansing for the following explores will begin:')
for explore in explores:
    print(explore)

columns = []

for explore in explores:
  print('Processing: ',str(explore))

  #open text file
  text_file = open(data_looker_path, "w")

  #Write all explore related data into data_looker.txt

  text_file.write(str(sdk.lookml_model_explore('snowflake',str(explore))))

  #close file
  text_file.close()

  #EXPLORE FILE data as a variable called "data"
  with open(data_looker_path, 'r') as file:
      data = file.read().replace('\n', '')

  #Open text file to not affect data_looker.txt
  lookml_model_explore_field_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/lookml_model_explore_field_text.txt')
  lookml_model_explore_field_text = open(lookml_model_explore_field_path, "w")

  #Get all text between the word dimensions= and joins from data

  lookml_model_explore_field_search = str(re.search(r'dimensions=\[(.*?)joins', data))

  #Get beginning of explore set index
  start =  int(str(re.search(r'span=\((.*?),',lookml_model_explore_field_search).group(1)).strip())+12
  #Get end of explore set index
  end =  int(str(re.search(r',(.*?)\),',lookml_model_explore_field_search).group(1)).strip())-6


  #Split data into different rows

  split_data = data[start:end].split('LookmlModelExploreField(align')

  split_series_data = pd.Series(split_data,dtype="string")

  #Define column labels
  labels = ["created_at","category","description","group_label","label",
            "hidden","link","name","primary_key","project",
            "view","sql","field_type","value_format","view_label","explore"]

  #Save all values into lists and then in tuples so we can turn it into a dataframe
  for i in  split_series_data[1:]:
    created_at = [date.today()]
    category = [str(re.search('Category.(.*?):',i).group(0)).strip()[9:-1]]
    description = [str(re.search('description=(.*?),',i).group(1)).strip()[1:-1]]
    group_label= [str(re.search('group_label(.*?),',i).group(1)).strip()[2:-1]]
    label = [str(re.search('label_short=(.*?),',i).group(1)).strip()[1:-1]]
    hidden = [str(re.search('hidden=(.*?),',i).group(1)).strip()]
    explore = [str(re.search('suggest_explore=(.*?),',i).group(1)).strip()[1:-1]]
    if(re.search('lookml_link=\'(.*?)\',',i) is None):
      link = ['No Link Available']
    else:
      link = [str(re.search('lookml_link=\'(.*?)\',',i).group(1)).strip()]

    if(re.search('name=\'(.*?)\',',i) is None):
      name = ['No Name Available']
    else:
      name = [str(re.search('name=\'(.*?)\',',i).group(1)).strip()]

    if(re.search('primary_key=(.*?),',i) is None):
      primary_key = ['No primary_key Available']
    else:
      primary_key = [str(re.search('primary_key=(.*?),',i).group(1)).strip()]


    if(re.search('project_name=\'(.*?)\',',i) is None):
      project = ['No Project Available']
    else:
      project = [str(re.search('project_name=\'(.*?)\',',i).group(1)).strip()]

    if(re.search('scope=\'(.*?)\',',i) is None):
      view = ['No view Available']
    else:
      view = [str(re.search('scope=\'(.*?)\',',i).group(1)).strip()]

    if(re.search('sql=(.*?)sql_case',i) is None):
      sql = ['No SQL Available']
    else:
      sql = [str(re.search('sql=(.*?)sql_case',i).group(1)).strip()[1:-2].replace('\'', '').replace('\\n', '').replace(',', ' ')]

    if(re.search('type=\'(.*?)\',',i) is None):
      field_type = ['No field type Available']
    else:
      field_type = [str(re.search('type=\'(.*?)\',',i).group(1)).strip()]

    if(re.search('value_format=(.*?),',i) is None):
      value_format = ['No value format Available']
    else:
      value_format = [str(re.search('value_format=(.*?),',i).group(1)).strip()]

    if(re.search('view_label=\'(.*?)\',',i) is None):
      view_label = ['No view label Available']
    else:
      view_label = [str(re.search('view_label=\'(.*?)\',',i).group(1)).strip()]

    columns.append(tuple(created_at+category+description+group_label+label+
                          hidden+link+name+primary_key+project+
                        view+sql+field_type+value_format+
                        view_label+explore))

#All lists and tuples into Data frame with columns -> labels

lookml_model_explore_field_df = pd.DataFrame.from_records(columns, columns=labels)

#Lookml Model Explore Views and Snowflake Database

#Get all rows where label = 'For Testing', it is a dimension defined in LookML to obtain the SQL_TABLE_NAME
lookml_model_explore_views_df = lookml_model_explore_field_df.loc[lookml_model_explore_field_df['label'] == "For Testing"][['view','sql']]
#Change column labels
lookml_model_explore_views_df.columns = ['view','snowflake_table']

#Get rid of all dummy dimensions in the dataframe

lookml_model_explore_field_df = lookml_model_explore_field_df[lookml_model_explore_field_df['label'] != "For Testing"]

#Left join to lookml_model_explore_views_df by view to get the "snowflake_table" column
lookml_model_explore_field_df = lookml_model_explore_field_df.merge(lookml_model_explore_views_df, on='view', how='left')

#Clean Group Labels

lookml_model_explore_field_df['group_label'] = lookml_model_explore_field_df['group_label'].replace(['on'],'')

#lookml_model_explore_field_df['explore'] = 'mn_accounts' #INSERT EXPLORE NAME

#Save lookml_model_explore_field_df as csv file
lookml_model_explore_field_csv_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/lookml_model_explore_field_csv.csv')
lookml_model_explore_field_df.to_csv(lookml_model_explore_field_csv_path,index=False)


# Check if the file exists before attempting to remove it
if os.path.exists(lookml_model_explore_field_path):
    os.remove(lookml_model_explore_field_path)
    print("lookml_model_explore_field_text.txt File removed successfully.")
else:
    print("lookml_model_explore_field_text.txt File does not exist.")

#LookmlModelExploreJoins

#open text file

text_file = open(data_looker_path, "w")

columns = []

for explore in explores:

  #open text file
  text_file = open(data_looker_path, "w")

  text_file.write(str(sdk.lookml_model_explore('snowflake',str(explore))))

  #close file
  text_file.close()

  #EXPLORE FILE data as a variable called "data"
  with open(data_looker_path, 'r') as file:
      data = file.read().replace('\n', '')
  
  lookml_joins_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/lookml_model_explore_joins_text.txt')
  
  lookml_model_explore_joins_text = open(lookml_joins_path, "w")
  lookml_model_explore_joins_search = str(re.search(r'joins=\[(.*?)supported_measure_types', data))
  start =  int(str(re.search(r'span=\((.*?),',lookml_model_explore_joins_search).group(1)).strip())+7
  end =  int(str(re.search(r',(.*?)\),',lookml_model_explore_joins_search).group(1)).strip())

  split_data = data[start:end].split('LookmlModelExploreJoins')

  split_series_data = pd.Series(split_data,dtype="string")

  labels = ["created_at","view","left_view","left_view_field","joined_view","joined_view_field","join_type","relationship"]

  for i in split_series_data[1:len(split_series_data)]:
    created_at = [date.today()]
    view = [str(re.search('name=(.*?),',i).group(1)[1:-1])]
    join_type = [str(re.search('type=(.*?)view_label',i).group(1)[1:-3])]
    relationship = [str(re.search('relationship=(.*?)required_joins',i).group(1)[1:-3])]
    dep_fields = str(re.search('dependent_fields=(.*?)fields',i).group(1)[2:-4])
    dep_fields = list(dep_fields.split("\', \'"))
    odd = dep_fields[1::2]
    even = dep_fields[0::2]
    zipped = list(zip(odd,even))
    for num in range(len(zipped)):
        created_at = created_at
        view = view
        left_view_field = [str(zipped[num][1])]
        left_view = [re.search(r'(.*?)\.',str(left_view_field)).group(1)[2:]]
        joined_view_field = [str(zipped[num][0])]
        joined_view = [re.search(r'(.*?)\.',str(joined_view_field)).group(1)[2:]]
        join_type = join_type
        relationship = relationship
        columns.append(tuple(created_at+view+left_view + left_view_field + joined_view +
                              joined_view_field + join_type + relationship))

#Dataframe

lookml_model_explore_joins_df = pd.DataFrame.from_records(columns, columns=labels)

#Left join by view to get the "snowflake_table" column
lookml_model_explore_joins_df = lookml_model_explore_joins_df.merge(lookml_model_explore_views_df, on='view', how='left')

#Eliminate recursive
lookml_model_explore_joins_df = lookml_model_explore_joins_df.loc[(lookml_model_explore_joins_df['left_view'] != lookml_model_explore_joins_df['joined_view'])]

#
lookml_model_explore_joins_for_sankey_df = lookml_model_explore_joins_df[['left_view','joined_view']]
lookml_model_explore_joins_for_sankey_df = lookml_model_explore_joins_for_sankey_df.drop_duplicates()

lookml_model_explore_joins_csv_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/lookml_model_explore_joins_csv.csv')
#to csv
lookml_model_explore_joins_df.to_csv(lookml_model_explore_joins_csv_path,index=False)

#DASHBOARD FILE

#Dashboards Text

dashboard_text_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/data_looker_dashboards.txt')

text_file = open(dashboard_text_path, "w")

#write string to file
text_file.write(str(sdk.all_dashboards()))

#close file
text_file.close()

#DASHBOARDS FILE data as a variable called "data_dashboards"
with open(dashboard_text_path, 'r') as file:
    data_dashboards = file.read().replace('\n', '')

#LookML Dashboards splitted Text

split_dashboards_data = data_dashboards.split('DashboardBase')

split_dashboard_series_data = pd.Series(split_dashboards_data,dtype="string")

#Dashboards DataFrame

columns = []

labels = ["id","title"]

for i in split_dashboard_series_data[1:]:
  id = [str(re.search(r', id(.*?)\', model',i).group(1)[2:])]
  title = [str(re.search('title(.*?)user_id',i).group(1)[2:-3])]
  columns.append(tuple(id + title))

#Dataframe

lookml_dashboards_df = pd.DataFrame.from_records(columns, columns=labels)

# Create an empty list to store the indices of rows to be removed
rows_to_remove = []

# Iterate over each row of the DataFrame
for index, row in lookml_dashboards_df.iterrows():
    try:
        # Attempt to convert the 'id' column to an integer
        _ = int(row['id'])
    except ValueError:
        # If the conversion fails, add the index of the row to the list
        rows_to_remove.append(index)

# Remove rows with indices stored in rows_to_remove list
lookml_dashboards_df.drop(index=rows_to_remove, inplace=True)

print(lookml_dashboards_df)

dashboards_ids = lookml_dashboards_df.id

columns = []

labels = ["created_at","id","view","tile_id","title_title","fields","model","note"]

#Change dashboard id data frame for the list of dashboards you want the info
for id in dashboards_ids[890:]:
   text = str(sdk.dashboard_dashboard_elements(dashboard_id=str(id)))
   split_text = text.split('DashboardElement')
   split_text_series = pd.Series(split_text,dtype="string")
   id = [id]
   created_at = [date.today()]
   #split_text_series[1:] the first element is always null on this specific list
   for element in split_text_series[1:]:
     tile_type = re.search('type(.*?)vis',element)
     valid = re.search('view=(.*?), can',element)
     id = id
     #If the tile_type is text instead of vis it will throw an error
     if tile_type == None:
        pass
     if valid == None:
        pass
     else:
        view = [str(re.search('view=(.*?), can',element).group(1)[1:-1])]
        tile_id = [str(re.search(' id=(.*?)look',element).group(1)[1:-3])]
        tile_title = [str(re.search(' title=(.*?)title_hidden',element).group(1)[1:-3])]
        fields = [str(re.search('fields=(.*?), pivots',element).group(1)[1:-1]).split(",")]
        model = [str(re.search('view=(.*?), can',element).group(1)[1:-1])]
        note = [str(re.search('note_text=(.*?), note_text_as_html',element).group(1)[1:-1])]
        columns.append(tuple(created_at+id+view+tile_id+tile_title+fields+model+note))

#Dataframe

lookml_dashboards_dataframe = pd.DataFrame.from_records(columns, columns=labels)

#Clean Large titles
for i in lookml_dashboards_dataframe.index:
    if len(lookml_dashboards_dataframe.at[i, 'title_title'])>500:
        lookml_dashboards_dataframe.at[i, 'title_title'] = lookml_dashboards_dataframe.at[i, 'title_title'].split('\'')[0]
    else:
        lookml_dashboards_dataframe.at[i, 'title_title'] = lookml_dashboards_dataframe.at[i, 'title_title']

lookml_dashboards_csv_path = os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/lookml_dashboards_csv.csv')
lookml_dashboards_dataframe.to_csv(lookml_dashboards_csv_path,index=False)

#Last edit to Dashboards CSV

clean_dashboards_dataframe = lookml_dashboards_dataframe.explode('fields')
clean_dashboards_dataframe['fields'] = clean_dashboards_dataframe['fields'].str.replace('\'','')
clean_dashboards_dataframe = clean_dashboards_dataframe.replace(',','', regex=True)

clean_dashboards_dataframe['id'] = clean_dashboards_dataframe['id'].astype(str)


#Left join by view to get the "snowflake_table" column
clean_dashboards_dataframe = clean_dashboards_dataframe.merge(lookml_dashboards_df, on='id', how='left')
clean_dashboards_dataframe = clean_dashboards_dataframe.replace(',','', regex=True)
clean_dashboards_dataframe = clean_dashboards_dataframe.iloc[:, [0,1,2,3,4,5,6,8,7]]

clean_dashboards_dataframe.to_csv(os.path.join(parent_dir, 'LookmlDataFlow/LookerDataFlow/looker_api/lookml_dashboards.csv'), index=False)

# Check if the file exists before attempting to remove it
if os.path.exists(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/data_looker_dashboards.txt')):
    os.remove(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/data_looker_dashboards.txt'))
    print("data_looker_dashboards.txt File removed successfully.")
else:
    print("data_looker_dashboards.txt File does not exist.")

if os.path.exists(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/data_looker.txt')):
    os.remove(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/data_looker.txt'))
    print("data_looker.txt File removed successfully.")
else:
    print("data_looker.txt File does not exist.")

if os.path.exists(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/lookml_dashboards_csv.csv')):
    os.remove(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/lookml_dashboards_csv.csv'))
    print("lookml_dashboards_csv.csv File removed successfully.")
else:
    print("lookml_dashboards_csv.csv File does not exist.")

if os.path.exists(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/lookml_model_explore_joins_text.txt')):
    os.remove(os.path.join(parent_dir,'LookmlDataFlow/LookerDataFlow/looker_api/lookml_model_explore_joins_text.txt'))
    print("lookml_model_explore_joins_text.txt File removed successfully.")
else:
    print("lookml_model_explore_joins_text.txt File does not exist.")

print('Dataflow Cleansing Complete')



