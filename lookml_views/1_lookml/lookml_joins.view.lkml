view: lookml_joins {
  sql_table_name: YOUR_JOINS_TABLE_NAME ;;

## Primary Key
  dimension: id {
    primary_key: yes
    hidden: yes
    description: "Primary Key"
    type: string
    sql: ${TABLE}.row ;;
  }

  ## Foreign keys and IDs


  ## Timestamps

  dimension: created_at {
    description: "Version Control Date"
    type: date
    sql: ${TABLE}.created_at ;;
  }


  ## Flags

  ## Properties
  dimension: view {
    description: "Lookml View"
    type: string
    sql: ${TABLE}.view ;;
  }

  dimension: explore {
    description: "Lookml Explore"
    type: string
    sql: ${TABLE}.explore ;;
  }

  dimension: left_view {
    description: "LookML Left View"
    type: string
    sql: ${TABLE}.left_view ;;
  }

  dimension: left_view_field {
    description: "LookML Left View Field"
    type: string
    sql: ${TABLE}.left_view_field;;
  }

  dimension: joined_view {
    description: "LookML Joined View"
    type: string
    sql: ${TABLE}.joined_view ;;
  }

  dimension: joined_view_field {
    description: "LookML Joined View Field"
    type: string
    sql: ${TABLE}.joined_view_field ;;
  }

  dimension: join_type {
    description: "LookML Join Type"
    type: string
    sql: ${TABLE}.join_type ;;
  }

  dimension: relationship {
    description: "LookML Join Relationship"
    type: string
    sql: ${TABLE}.relationship ;;
  }

  dimension: snowflake_table {
    description: "LookML Snowflake Table (Left)"
    type: string
    sql: ${TABLE}.snowflake_table ;;
  }



## Measures
  measure: total_joins {
    type: count_distinct
    sql: ${id} ;;
  }

}
