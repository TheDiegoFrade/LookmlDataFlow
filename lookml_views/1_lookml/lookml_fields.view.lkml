view: lookml_fields {
  sql_table_name: YOUR_LOOKML_FIELDS_TABLE ;;

## Primary Key
  dimension: id {
    primary_key: yes
    hidden: yes
    description: "Primary Key"
    type: string
    sql: concat(${TABLE}.CREATED_AT,'-',${TABLE}.name) ;;
  }

  ## Foreign keys and IDs


 ## Timestamps

  dimension: created_at {
    description: "Version Control Date"
    type: date
    sql: ${TABLE}.created_at ;;
  }

  ## Flags

  dimension: is_hidden {
    description: "is LookML Field Hidden"
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension: field_text {
    description: "Field Label"
    type: string
    sql: 'Fields' ;;
  }

  dimension: view_text {
    description: "Field Label"
    type: string
    sql: 'Views' ;;
  }

  dimension: is_primary_key {
    description: "is LookML Field Primary Key"
    type: yesno
    sql: ${TABLE}.primary_key ;;
  }

  ## Properties

  dimension: view {
    description: "Lookml Field View"
    type: string
    sql: ${TABLE}.view ;;
  }

  dimension: view_label {
    description: "Lookml Field View Label"
    type: string
    sql: ${TABLE}.view_label ;;
  }

  dimension: explore {
    description: "Lookml Explore"
    type: string
    sql: ${TABLE}.explore ;;
  }

  dimension: project {
    description: "Lookml Field Project"
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: category {
    description: "LookML Field Category"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: description {
    description: "LookML Field Description"
    type: string
    sql: ${TABLE}.description;;
  }

  dimension: group_label {
    description: "LookML Field Group Label"
    type: string
    sql: ${TABLE}.group_label ;;
  }

  dimension: label {
    description: "LookML Field Label"
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: link {
    description: "LookML Field Link"
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: name {
    description: "LookML Field Name"
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Go to Field"
      url: "https://YOUR_COMPANY.looker.com/{{ lookml_fields.link }}"
    }
  }

  dimension: field_type {
    description: "LookML Field Type"
    type: string
    sql: ${TABLE}.field_type ;;
  }

  dimension: value_format {
    description: "LookML Field Value Format"
    type: string
    sql: ${TABLE}.value_format ;;
  }

  dimension: sql {
    description: "LookML Field SQL Code"
    type: string
    sql: case when ${TABLE}.sql = 'on' then null else ${TABLE}.sql end;;
    #link: {
    #  label: "Go to Field"
    #  url: "https://YOUR_COMPANY.looker.com/{{ lookml_fields.link }}"
    #}
  }

  dimension: is_transformed {
    description: "Is SQL Code transforming in Looker"
    type: yesno
    sql: case when left(${sql},3) = '${T' then false
              when regexp_count(${sql}, '\\$', 1) = 1 then false
              else
                  true
         end
        ;;
  }

  dimension: test {
    type: string
    sql: regexp_count(${sql}, '\\$', 1) ;;
  }

  dimension: sql_left {
    type: string
    sql: left(${sql},2) ;;
  }

  dimension: sql_right {
    type: string
    sql: right(${sql},1) ;;
  }



  dimension: table {
    description: "LookML Field Table"
    type: string
    sql: ${TABLE}.table ;;
  }

  dimension: table_text {
    description: "Table"
    type: string
    sql: 'YOUR_DWH_TOOL' ;;
  }

  ## Measures

  measure: unique_fields_count {
    label: "Total Fields"
    type: count_distinct
    sql: ${name} ;;
    drill_fields: [id,name,view,category,description,label,field_type,sql,table]
  }

  measure: unique_dimensions_count {
    label: "Total Dimensions"
    type: count_distinct
    sql: ${name} ;;
    drill_fields: [id,name,view,category,description,label,field_type,sql,table]
    filters: [category: "dimension"]
  }

  measure: unique_measures_count {
    label: "Total Measures"
    type: count_distinct
    sql: ${name} ;;
    drill_fields: [id,name,view,category,description,label,field_type,sql,table]
    filters: [category: "measure"]
  }

  measure: unique_views_count {
    label: "Total Views"
    type: count_distinct
    sql: ${view} ;;
    drill_fields: [id,name,view,category,description,label,field_type,sql,table]
  }

  measure: unique_tables_count {
    label: "Total Tables"
    type: count_distinct
    sql: ${table} ;;
    drill_fields: [id,name,view,category,description,label,field_type,sql,table]
  }

  measure: counter {
    type: count
  }
}
