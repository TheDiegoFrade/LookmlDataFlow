view: lookml_dashboards {
  sql_table_name: LOOKML_DASHBOARDS_TABLE ;;

## Primary Key
  dimension: id {
    primary_key: yes
    hidden: no
    description: "Primary Key"
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "Go to Dashboard"
      url: "https://YOUR_COMPANY_NAME.looker.com/dashboards/{{ id }}"
    }
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
    label: "Dashboard View"
    description: "Lookml Dashboard Views"
    type: string
    sql: ${TABLE}.view ;;
  }

  dimension: tile_text {
    description: "Field Label"
    type: string
    sql: 'Tiles' ;;
  }

  dimension: field {
    label: "Dashboard Field"
    description: "LookML Dashboard Fields"
    type: string
    sql: ${TABLE}.fields ;;
    link: {
      label: "Go to Dashboard"
      url: "https://YOUR_COMPANY_NAME.looker.com/dashboards/{{ id }}"
    }
    link: {
      label: "Go to Field"
      url: "https://YOUR_COMPANY_NAME.looker.com/{{ lookml_fields.link }}"
    }
  }

  dimension: model {
    label: "Dashboard Model"
    description: "LookML Dashboard Models"
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: title {
    label: "Dashboard Title"
    description: "LookML Dashboard Title"
    type: string
    sql: ${TABLE}.title ;;
    link: {
      label: "Go to Dashboard"
      url: "https://YOUR_COMPANY_NAME.looker.com/dashboards/{{ id }}"
    }
  }

  dimension: tile_title {
    label: "Dashboard Tile Title"
    description: "LookML Dashboard Tile Title"
    type: string
    sql: ${TABLE}.tile_title ;;
    link: {
      label: "Go to Dashboard"
      url: "https://YOUR_COMPANY_NAME.looker.com/dashboards/{{ id }}"
    }
  }

  dimension: tile_id {
    label: "Dashboard Tile ID"
    description: "LookML Dashboard Tile ID"
    type: string
    sql: ${TABLE}.tile_id ;;
    link: {
      label: "Go to Dashboard"
      url: "https://YOUR_COMPANY_NAME.looker.com/dashboards/{{ id }}"
    }
  }


  dimension: note {
    label: "Dashboard Tile Note"
    description: "LookML Dashboard Tile Note"
    type: string
    sql: ${TABLE}.note ;;
  }


## Measures
  measure: unique_tiles_count {
    label: "Total Tiles"
    type: count_distinct
    sql: ${tile_id} ;;
    drill_fields: [id,title,tile_title,field,lookml_fields.snowflake_table]
  }

  measure: unique_dashboards_count {
    label: "Total Dashboards"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id,title,tile_title,field,lookml_fields.snowflake_table]
  }

  measure: unique_fields_count {
    type: count_distinct
    sql: ${field} ;;
    drill_fields: [id,title,tile_title,field,lookml_fields.snowflake_table]
  }

  measure: unique_views_count {
    type: count_distinct
    sql: ${view} ;;
    drill_fields: [id,title,tile_title,field,lookml_fields.snowflake_table]
  }

}
