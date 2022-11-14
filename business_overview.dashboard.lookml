- dashboard: operational_analysis
  title: Operational Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'This dashboard shows the most critical KPIs for the operational analysis'
  preferred_slug: JagUFnJhM734FiAGB8qXsK
  elements:
  - title: Year-on-Year Gross Margin Trend
    name: Year-on-Year Gross Margin Trend
    model: kantsupova_project
    explore: f_lineitems
    type: looker_column
    fields: [f_lineitems.TtlGrossMargin, d_dates.date_val_year]
    fill_fields: [d_dates.date_val_year]
    sorts: [d_dates.date_val_year desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: f_lineitems.TtlGrossMargin,
            id: 1994 - 1994 - f_lineitems.TtlGrossMargin, name: '1994'}, {axisId: f_lineitems.TtlGrossMargin,
            id: 1995 - 1995 - f_lineitems.TtlGrossMargin, name: '1995'}], showLabels: true,
        showValues: true, valueFormat: "$#.##,,\\M\\", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    label_value_format: "$#.##,,\\M\\"
    series_types: {}
    series_colors: {}
    series_labels:
      f_lineitems.TtlGrossMargin: "$ Gross Margin"
    reference_lines: []
    trend_lines: []
    show_dropoff: true
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    listen: {}
    row: 3
    col: 0
    width: 12
    height: 6
  - title: Sales by Region
    name: Sales by Region
    model: kantsupova_project
    explore: f_lineitems
    type: looker_pie
    fields: [d_customer.c_region, f_lineitems.TtlSales]
    filters:
      d_customer.c_region: "-NULL"
    sorts: [f_lineitems.TtlSales desc 0]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Share of Shipment Method,
        value_format: !!null '', value_format_name: percent_2, calculation_type: percent_of_column_sum,
        table_calculation: share_of_shipment_method, args: [f_lineitems.TtlGrossMargin],
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {args: [f_lineitems.TtlGrossMargin],
        calculation_type: percent_of_column_sum, category: table_calculation, based_on: f_lineitems.TtlGrossMargin,
        label: Percent of Ordered Items Total Gross Margin Amount, source_field: f_lineitems.TtlGrossMargin,
        table_calculation: percent_of_ordered_items_total_gross_margin_amount, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    start_angle: 0
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    series_colors:
      share_of_shuppment_method: "#1f3e5a"
      share_of_shipment_method: "#1f3e5a"
    series_labels:
      f_lineitems.TtlGrossMargin: "$ Gross Margin"
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: f_lineitems.TtlSales,
            id: f_lineitems.TtlSales, name: Total Sales}], showLabels: true, showValues: false,
        valueFormat: '$#.#,,"M"', unpinAxis: false, tickDensity: default, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: f_lineitems.CompleteRate,
            id: f_lineitems.CompleteRate, name: Order Completion Rate}], showLabels: true,
        showValues: false, valueFormat: '$#.#,,"M"', unpinAxis: false, tickDensity: default,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: f_lineitems.TtlGrossMargin
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: true
    legend_position: center
    font_size: '14'
    label_value_format: ''
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 9
    col: 0
    width: 12
    height: 6
  - title: Revenue Source Analysis
    name: Revenue Source Analysis
    model: kantsupova_project
    explore: f_lineitems
    type: looker_column
    fields: [f_lineitems.TtlGrossMargin, f_lineitems.l_shipmode]
    sorts: [f_lineitems.TtlGrossMargin desc 0]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Share of Shipment Method,
        value_format: !!null '', value_format_name: percent_2, calculation_type: percent_of_column_sum,
        table_calculation: share_of_shipment_method, args: [f_lineitems.TtlGrossMargin],
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    y_axes: [{label: '', orientation: right, series: [{axisId: share_of_shipment_method,
            id: share_of_shipment_method, name: Share of Shipment Method}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, type: linear}]
    size_by_field: f_lineitems.TtlGrossMargin
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: true
    font_size: '14'
    label_value_format: ''
    series_types:
      share_of_shuppment_method: scatter
      share_of_shipment_method: scatter
    series_colors:
      share_of_shuppment_method: "#1f3e5a"
      share_of_shipment_method: "#1f3e5a"
    series_labels:
      f_lineitems.TtlGrossMargin: "$ Gross Margin"
    reference_lines: []
    trend_lines: []
    show_dropoff: false
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 0
    col: 12
    width: 11
    height: 15
  - title: Gross Margin % KPI card
    name: Gross Margin % KPI card
    model: kantsupova_project
    explore: f_lineitems
    type: single_value
    fields: [f_lineitems.TtlGrossRev]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Gross Revenue
    value_format: "$#.##,,\\M\\"
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Gross Margin % KPI card (Copy)
    name: Gross Margin % KPI card (Copy)
    model: kantsupova_project
    explore: f_lineitems
    type: single_value
    fields: [f_lineitems.GrossMarginPct]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Gross Margin %
    value_format: ''
    series_types: {}
    defaults_version: 1
    row: 0
    col: 6
    width: 6
    height: 3
