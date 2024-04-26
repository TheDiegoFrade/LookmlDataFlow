include: "./*/*"


############### LOOKML ###############

explore: lookml_fields {
  hidden: no
  label: "LookML Fields"
  description: ""
  group_label: "LookML Modeling Tool"
  join: lookml_dashboards {
    view_label: "LookML Dashboards"
    type: left_outer
    relationship: one_to_many
    sql_on: ${lookml_fields.name} = ${lookml_dashboards.field}
         ;;
  }

  join: lookml_joins {
    view_label: "LookML Joins"
    type: left_outer
    relationship: many_to_many
    sql_on: ${lookml_fields.view} = ${lookml_joins.left_view} ;;
  }
}
