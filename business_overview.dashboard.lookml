# - dashboard: business_overview
#   title: Business Overview
#   layout: newspaper
#   elements:
#   - title: Orders in the Past 90 Days
#     name: Orders in the Past 90 Days
#     model: ecommerce_neat
#     explore: order_items
#     type: single_value
#     fields: [order_items.order_count]
#     filters: {}
#     sorts: [order_items.order_count desc]
#     limit: 10
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     single_value_title: Orders
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     listen:
#       Order Date: order_items.created_date
#       User State: users.state
#     row: 0
#     col: 0
#     width: 8
#     height: 3
#   - title: Average Sale Price
#     name: Average Sale Price
#     model: ecommerce_neat
#     explore: order_items
#     type: single_value
#     fields: [order_items.average_sales]
#     filters: {}
#     limit: 10
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     single_value_title: Average Sale Price
#     listen:
#       Order Date: order_items.created_date
#       User State: users.state
#     row: 0
#     col: 8
#     width: 8
#     height: 3
#   - title: Average Spend per Customer
#     name: Average Spend per Customer
#     model: ecommerce_neat
#     explore: order_items
#     type: single_value
#     fields: [users.count, order_items.order_count, order_items.total_sales]
#     filters: {}
#     limit: 10
#     dynamic_fields: [{table_calculation: average_spend_per_customer, label: Average
#           Spend per Customer, expression: "${order_items.total_sales}/${users.count}",
#         value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     single_value_title: Average Spend per Customer
#     hidden_fields: [order_items.total_sales, order_items.order_count, users.count]
#     listen:
#       Order Date: order_items.created_date
#       User State: users.state
#     row: 0
#     col: 16
#     width: 8
#     height: 3
#   - title: Brand Sales
#     name: Brand Sales
#     model: ecommerce_neat
#     explore: order_items
#     type: table
#     fields: [products.brand, order_items.order_count, order_items.average_sales, order_items.total_sales]
#     filters: {}
#     sorts: [order_items.order_count desc]
#     limit: 500
#     column_limit: 50
#     show_view_names: false
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: transparent
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     show_value_labels: false
#     font_size: 12
#     value_labels: legend
#     label_type: labPer
#     stacking: ''
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     show_null_points: true
#     point_style: none
#     interpolation: linear
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     ordering: none
#     show_null_labels: false
#     series_types: {}
#     series_labels:
#       order_items.order_count: Total Number of Orders
#       products.brand: Brand
#       order_items.average_sales: Average Order Value
#     conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
#         font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
#             "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
#         fields: !!null ''}]
#     listen:
#       Order Date: order_items.created_date
#       User State: users.state
#     row: 9
#     col: 12
#     width: 12
#     height: 8
#   - title: Revenue by Marketing Channel
#     name: Revenue by Marketing Channel
#     model: ecommerce_neat
#     explore: order_items
#     type: looker_column
#     fields: [order_items.total_sales, users.traffic_source]
#     filters: {}
#     sorts: [order_items.total_sales desc]
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     show_value_labels: true
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     font_size: '12'
#     series_types: {}
#     colors: ['palette: Mixed Dark']
#     series_colors: {}
#     hide_legend: false
#     reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
#         margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
#         color: "#000000"}]
#     listen:
#       Order Date: order_items.created_date
#       User State: users.state
#     row: 3
#     col: 0
#     width: 12
#     height: 6
#   - title: Customers by Source and Gender
#     name: Customers by Source and Gender
#     model: ecommerce_neat
#     explore: order_items
#     type: looker_donut_multiples
#     fields: [users.traffic_source, users.gender, users.count]
#     pivots: [users.traffic_source]
#     filters: {}
#     sorts: [users.gender, users.count desc 0, users.traffic_source]
#     limit: 500
#     column_limit: 50
#     show_value_labels: true
#     font_size: 16
#     stacking: ''
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     show_null_points: true
#     point_style: none
#     interpolation: linear
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     value_labels: legend
#     label_type: labPer
#     ordering: none
#     show_null_labels: false
#     colors: ['palette: Looker Classic']
#     hide_legend: false
#     series_colors: {}
#     series_types: {}
#     reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
#         margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
#         color: "#000000"}]
#     listen:
#       Order Date: order_items.created_date
#       User State: users.state
#     row: 3
#     col: 12
#     width: 12
#     height: 6
#   - title: Users by State
#     name: Users by State
#     model: ecommerce_neat
#     explore: order_items
#     type: looker_geo_choropleth
#     fields: [users.count, users.state]
#     filters:
#       users.country: USA
#     sorts: [users.count desc]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     map: usa
#     map_projection: ''
#     show_view_names: true
#     quantize_colors: false
#     colors: []
#     listen:
#       User State: users.state
#     row: 9
#     col: 0
#     width: 12
#     height: 8
#   filters:
#   - name: Order Date
#     title: Order Date
#     type: field_filter
#     default_value: 90 days
#     allow_multiple_values: true
#     required: false
#     model: ecommerce_neat
#     explore: order_items
#     listens_to_filters: []
#     field: order_items.created_date
#   - name: User State
#     title: User State
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     model: ecommerce_neat
#     explore: order_items
#     listens_to_filters: []
#     field: users.state
