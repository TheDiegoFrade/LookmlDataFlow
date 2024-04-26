- dashboard: lookml_dataflow
  title: LookML DataFlow
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: 3Uia1FrxBlQFO3EmWphmYq
  elements:

- title: Views Detail
  name: Views Detail
  model: YOUR_MODEL
  explore: lookml_fields
  type: looker_grid
  fields: 
    - lookml_fields.view
    - lookml_fields.unique_fields_count
    - lookml_fields.table
  sorts: [lookml_fields.unique_fields_count desc 0]
  limit: 500
  show_view_names: false
  show_row_numbers: true
  transpose: false
  truncate_text: true
  hide_totals: false
  hide_row_totals: false
  size_to_fit: true
  table_theme: white
  limit_displayed_rows: false
  enable_conditional_formatting: false
  header_text_alignment: left
  header_font_size: 12
  rows_font_size: 12
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  x_axis_gridlines: false
  y_axis_gridlines: true
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  trellis: ''
  stacking: ''
  legend_position: center
  point_style: none
  show_value_labels: false
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
  defaults_version: 1
  hidden_fields: []
  y_axes: []
  listen:
    Dashboard ID: lookml_dashboards.id
    Dashboard Title: lookml_dashboards.title
    Field Names: lookml_fields.name
    View: lookml_fields.view
    Tiles Title: lookml_dashboards.tile_title
    Table: lookml_fields.table
    Explore: lookml_fields.explore
    Created At: lookml_fields.created_at
  row: 26
  col: 0
  width: 11
  height: 13


- title: Details
  name: Details
  model: YOUR_MODEL
  explore: lookml_fields
  type: marketplace_viz_multiple_value::multiple_value-marketplace
  fields: 
    - lookml_dashboards.unique_dashboards_count
    - lookml_dashboards.unique_tiles_count
  sorts: [lookml_dashboards.unique_tiles_count desc]
  limit: 500
  column_limit: 50
  hidden_fields: []
  hidden_points_if_no: []
  series_labels: {}
  show_view_names: false
  font_size_main: '15'
  orientation: horizontal
  style_lookml_dashboards.unique_dashboards_count: "#3A4245"
  show_title_lookml_dashboards.unique_dashboards_count: true
  title_placement_lookml_dashboards.unique_dashboards_count: below
  value_format_lookml_dashboards.unique_dashboards_count: ''
  style_lookml_dashboards.unique_tiles_count: "#3A4245"
  show_title_lookml_dashboards.unique_tiles_count: true
  title_placement_lookml_dashboards.unique_tiles_count: below
  value_format_lookml_dashboards.unique_tiles_count: ''
  show_comparison_lookml_dashboards.unique_tiles_count: false
  x_axis_gridlines: false
  y_axis_gridlines: false
  y_axes: 
    - label: ''
      orientation: left
      series: 
        - axisId: lookml_dashboards.unique_dashboards_count
          id: lookml_dashboards.unique_dashboards_count
          name: Total Dashboards
        - axisId: lookml_dashboards.unique_tiles_count
          id: lookml_dashboards.unique_tiles_count
          name: Total Tiles
        - axisId: lookml_fields.unique_views_count
          id: lookml_fields.unique_views_count
          name: Total Views
        - axisId: lookml_fields.unique_tables_count
          id: lookml_fields.unique_tables_count
          name: Total Tables
        - axisId: lookml_fields.unique_fields_count
          id: lookml_fields.unique_fields_count
          name: Total Fields
        - axisId: lookml_fields.unique_dimensions_count
          id: lookml_fields.unique_dimensions_count
          name: Total Dimensions
        - axisId: lookml_fields.unique_measures_count
          id: lookml_fields.unique_measures_count
          name: Total Measures
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  trellis: ''
  stacking: ''
  limit_displayed_rows: false
  legend_position: center
  point_style: none
  series_colors:
    lookml_dashboards.unique_dashboards_count: "#4276BE"
    lookml_dashboards.unique_tiles_count: "#E57947"
  show_value_labels: true
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
  custom_color_enabled: true
  show_single_value_title: true
  show_comparison: false
  comparison_type: value
  comparison_reverse_colors: false
  show_comparison_label: true
  enable_conditional_formatting: false
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  single_value_title: Tables
  defaults_version: 0
  title_hidden: true
  listen:
    Dashboard ID: lookml_dashboards.id
    Dashboard Title: lookml_dashboards.title
    Field Names: lookml_fields.name
    View: lookml_fields.view
    Tiles Title: lookml_dashboards.tile_title
    Table: lookml_fields.table
    Explore: lookml_fields.explore
    Created At: lookml_fields.created_at
  row: 8
  col: 0
  width: 6
  height: 3

- title: Dashboards Detail
  name: Dashboards Detail
  model: YOUR_MODEL
  explore: lookml_fields
  type: looker_grid
  fields: 
    - lookml_dashboards.id
    - lookml_dashboards.title
    - lookml_fields.unique_fields_count
    - lookml_fields.unique_tables_count
    - lookml_fields.unique_views_count
  filters: {}
  sorts: [lookml_fields.unique_fields_count desc 0]
  limit: 5000
  column_limit: 50
  show_view_names: false
  show_row_numbers: true
  transpose: false
  truncate_text: true
  hide_totals: false
  hide_row_totals: false
  size_to_fit: true
  table_theme: white
  limit_displayed_rows: false
  enable_conditional_formatting: false
  header_text_alignment: left
  header_font_size: 12
  rows_font_size: 12
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  custom_color_enabled: true
  show_single_value_title: true
  show_comparison: false
  comparison_type: value
  comparison_reverse_colors: false
  show_comparison_label: true
  defaults_version: 1
  hidden_fields: []
  y_axes: []
  listen:
    Dashboard ID: lookml_dashboards.id
    Dashboard Title: lookml_dashboards.title
    Field Names: lookml_fields.name
    View: lookml_fields.view
    Tiles Title: lookml_dashboards.tile_title
    Table: lookml_fields.table
    Explore: lookml_fields.explore
    Created At: lookml_fields.created_at
  row: 2
  col: 6
  width: 18
  height: 9


- title: Fields Detail
  name: Fields Detail
  model: YOUR_MODEL
  explore: lookml_fields
  type: looker_grid
  fields: 
    - lookml_fields.name
    - lookml_fields.view
    - lookml_fields.category
    - lookml_fields.description
    - lookml_fields.label
    - lookml_fields.field_type
    - lookml_fields.sql
    - lookml_fields.table
  sorts: [lookml_fields.name]
  limit: 5000
  show_view_names: false
  show_row_numbers: true
  transpose: false
  truncate_text: true
  hide_totals: false
  hide_row_totals: false
  size_to_fit: true
  table_theme: white
  limit_displayed_rows: false
  enable_conditional_formatting: false
  header_text_alignment: left
  header_font_size: 12
  rows_font_size: 12
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  x_axis_gridlines: false
  y_axis_gridlines: true
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  trellis: ''
  stacking: ''
  legend_position: center
  point_style: none
  show_value_labels: false
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
  defaults_version: 1
  hidden_fields: []
  y_axes: []
  listen:
    Dashboard ID: lookml_dashboards.id
    Dashboard Title: lookml_dashboards.title
    Is SQL field transformed: lookml_fields.is_transformed
    Field Names: lookml_fields.name
    View: lookml_fields.view
    Tiles Title: lookml_dashboards.tile_title
    Table: lookml_fields.table
    Explore: lookml_fields.explore
    Created At: lookml_fields.created_at
  row: 13
  col: 0
  width: 24
  height: 11


- title: Joins Detail
  name: Joins Detail
  model: YOUR_MODEL
  explore: lookml_fields
  type: looker_grid
  fields: 
    - lookml_joins.left_view
    - lookml_joins.joined_view
    - lookml_joins.left_view_field
    - lookml_joins.joined_view_field
    - lookml_joins.join_type
    - lookml_joins.relationship
  sorts: [lookml_joins.left_view]
  limit: 500
  show_view_names: false
  show_row_numbers: true
  transpose: false
  truncate_text: true
  hide_totals: false
  hide_row_totals: false
  size_to_fit: true
  table_theme: white
  limit_displayed_rows: false
  enable_conditional_formatting: false
  header_text_alignment: left
  header_font_size: 12
  rows_font_size: 12
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  x_axis_gridlines: false
  y_axis_gridlines: true
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  trellis: ''
  stacking: ''
  legend_position: center
  point_style: none
  show_value_labels: false
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
  defaults_version: 1
  hidden_fields: []
  y_axes: []
  listen:
    Joined View (Only for Joins): lookml_joins.joined_view
    Left View (Only for Joins): lookml_joins.left_view
    Explore: lookml_fields.explore
    Created At: lookml_fields.created_at
  row: 26
  col: 11
  width: 13
  height: 13
- name: "<center>Dashboards Deep Dive</center>"
  type: text
  title_text: "<center>Dashboards Deep Dive</center>"
  subtitle_text: ''
  body_text: ''
  row: 0
  col: 6
  width: 18
  height: 2


- title: Tables & Views
  name: Tables & Views
  model: YOUR_MODEL
  explore: lookml_fields
  type: marketplace_viz_multiple_value::multiple_value-marketplace
  fields: 
    - lookml_fields.unique_tables_count
    - lookml_fields.unique_views_count
  sorts: [lookml_fields.unique_views_count]
  limit: 500
  column_limit: 50
  hidden_fields: []
  hidden_points_if_no: []
  series_labels: {}
  show_view_names: false
  font_size_main: '15'
  orientation: horizontal
  dividers: false
  title_placement_lookml_fields.unique_tables_count: below
  title_placement_lookml_fields.unique_views_count: below
  show_comparison_lookml_fields.unique_views_count: false
  x_axis_gridlines: false
  y_axis_gridlines: false
  y_axes: 
    - label: ''
      orientation: left
      series: 
        - axisId: lookml_dashboards.unique_dashboards_count
          id: lookml_dashboards.unique_dashboards_count
          name: Total Dashboards
        - axisId: lookml_dashboards.unique_tiles_count
          id: lookml_dashboards.unique_tiles_count
          name: Total Tiles
        - axisId: lookml_fields.unique_views_count
          id: lookml_fields.unique_views_count
          name: Total Views
        - axisId: lookml_fields.unique_tables_count
          id: lookml_fields.unique_tables_count
          name: Total Tables
        - axisId: lookml_fields.unique_fields_count
          id: lookml_fields.unique_fields_count
          name: Total Fields
        - axisId: lookml_fields.unique_dimensions_count
          id: lookml_fields.unique_dimensions_count
          name: Total Dimensions
        - axisId: lookml_fields.unique_measures_count
          id: lookml_fields.unique_measures_count
          name: Total Measures
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  trellis: ''
  stacking: ''
  limit_displayed_rows: false
  legend_position: center
  font_size: '12'
  point_style: none
  show_value_labels: true
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
  custom_color_enabled: true
  show_single_value_title: true
  show_comparison: false
  comparison_type: value
  comparison_reverse_colors: false
  show_comparison_label: true
  enable_conditional_formatting: false
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  single_value_title: Tables
  defaults_version: 0
  show_row_numbers: true
  transpose: false
  truncate_text: true
  hide_totals: false
  hide_row_totals: false
  size_to_fit: true
  table_theme: white
  header_text_alignment: left
  header_font_size: 12
  rows_font_size: 12
  show_null_points: true
  interpolation: linear
  value_labels: legend
  label_type: labPer
  leftAxisLabelVisible: false
  leftAxisLabel: ''
  rightAxisLabelVisible: false
  rightAxisLabel: ''
  smoothedBars: false
  labelPosition: left
  percentType: total
  percentPosition: inline
  valuePosition: right
  labelColorEnabled: false
  labelColor: "#FFF"
  groupBars: true
  labelSize: 10pt
  showLegend: true
  up_color: false
  down_color: false
  total_color: false
  title_hidden: true
  listen:
    Dashboard ID: lookml_dashboards.id
    Dashboard Title: lookml_dashboards.title
    Field Names: lookml_fields.name
    View: lookml_fields.view
    Tiles Title: lookml_dashboards.tile_title Table: lookml_fields.table
    Explore: lookml_fields.explore
    Created At: lookml_fields.created_at
  row: 2
  col: 0
  width: 6
  height: 3


- title: Fields
  name: Fields
  model: YOUR_MODEL
  explore: lookml_fields
  type: marketplace_viz_multiple_value::multiple_value-marketplace
  fields: 
    - lookml_fields.unique_fields_count
    - lookml_fields.unique_dimensions_count
    - lookml_fields.unique_measures_count
  limit: 500
  column_limit: 50
  hidden_fields: []
  hidden_points_if_no: []
  series_labels: {}
  show_view_names: false
  font_size_main: '15'
  orientation: horizontal
  style_lookml_fields.unique_fields_count: "#3A4245"
  show_title_lookml_fields.unique_fields_count: true
  title_placement_lookml_fields.unique_fields_count: below
  value_format_lookml_fields.unique_fields_count: ''
  style_lookml_fields.unique_dimensions_count: "#3A4245"
  show_title_lookml_fields.unique_dimensions_count: true
  title_placement_lookml_fields.unique_dimensions_count: below
  value_format_lookml_fields.unique_dimensions_count: ''
  show_comparison_lookml_fields.unique_dimensions_count: false
  style_lookml_fields.unique_measures_count: "#3A4245"
  show_title_lookml_fields.unique_measures_count: true
  title_placement_lookml_fields.unique_measures_count: below
  value_format_lookml_fields.unique_measures_count: ''
  show_comparison_lookml_fields.unique_measures_count: false
  x_axis_gridlines: false
  y_axis_gridlines: false
  y_axes: 
    - label: ''
      orientation: left
      series: 
        - axisId: lookml_dashboards.unique_dashboards_count
          id: lookml_dashboards.unique_dashboards_count
          name: Total Dashboards
        - axisId: lookml_dashboards.unique_tiles_count
          id: lookml_dashboards.unique_tiles_count
          name: Total Tiles
        - axisId: lookml_fields.unique_views_count
          id: lookml_fields.unique_views_count
          name: Total Views
        - axisId: lookml_fields.unique_tables_count
          id: lookml_fields.unique_tables_count
          name: Total Tables
        - axisId: lookml_fields.unique_fields_count
          id: lookml_fields.unique_fields_count
          name: Total Fields
        - axisId: lookml_fields.unique_dimensions_count
          id: lookml_fields.unique_dimensions_count
          name: Total Dimensions
        - axisId: lookml_fields.unique_measures_count
          id: lookml_fields.unique_measures_count
          name: Total Measures
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  trellis: ''
  stacking: ''
  limit_displayed_rows: false
  legend_position: center
  point_style: none
  series_colors: 
    lookml_fields.unique_fields_count: "#592EC2"
    lookml_fields.unique_dimensions_count: "#72D16D"
    lookml_fields.unique_measures_count: "#FFD95F"
  show_value_labels: true
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
  custom_color_enabled: true
  show_single_value_title: true
  show_comparison: false
  comparison_type: value
  comparison_reverse_colors: false
  show_comparison_label: true
  enable_conditional_formatting: false
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  single_value_title: Tables defaults_version: 0
  title_hidden: true
  listen:
    Dashboard ID: lookml_dashboards.id
    Dashboard Title: lookml_dashboards.title
    Field Names: lookml_fields.name
    View: lookml_fields.view
    Tiles Title: lookml_dashboards.tile_title
    Table: lookml_fields.table
    Explore: lookml_fields.explore
    Created At: lookml_fields.created_at
  row: 5
  col: 0
  width: 6
  height: 3
- name: "<center> Fields Deep Dive</center>"
  type: text
  title_text: "<center> Fields Deep Dive</center>"
  subtitle_text: ''
  body_text: ''
  row: 11
  col: 0
  width: 24
  height: 2
- name: "<center> Summary </center>"
  type: text
  title_text: "<center> Summary </center>"
  subtitle_text: ''
  body_text: ''
  row: 0
  col: 0
  width: 6
  height: 2
- name: "<center> Views & Joins Deep Dive</center>"
  type: text
  title_text: "<center> Views & Joins Deep Dive</center>"
  subtitle_text: ''
  body_text: ''
  row: 24
  col: 0
  width: 24
  height: 2
filters:
  - name: Created At
    title: Created At
    type: field_filter
    default_value: 2024/02/08
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_fields.created_at
  - name: Explore
    title: Explore
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type

: advanced
      display: popover
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_fields.explore
  - name: Table title: Table
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_fields.table
  - name: Dashboard ID
    title: Dashboard ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_dashboards.id
  - name: Dashboard Title
    title: Dashboard Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_dashboards.title
  - name: Tiles Title
    title: Tiles Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_dashboards.tile_title
  - name: Is SQL field transformed
    title: Is SQL field transformed
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_fields.is_transformed
  - name: Field Names
    title: Field Names
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_fields.name
  - name: View
    title: View
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_fields.view
  - name: Left View (Only for Joins)
    title: Left View (Only for Joins)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_joins.left_view
  - name: Joined View (Only for Joins)
    title: Joined View (Only for Joins)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: YOUR_MODEL
    explore: lookml_fields
    listens_to_filters: []
    field: lookml_joins.joined_view

