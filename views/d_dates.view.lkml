view: d_dates {
  label: "Dates"
  view_label: "DimDate"
  sql_table_name: "DATA_MART"."D_DATES"
    ;;

  dimension_group: date_val {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
  }

  dimension: datekey {
    type: number
    sql: ${TABLE}."DATEKEY" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: day_of_week {
    label: "Weekday"
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    label: "Weekday name"
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
    order_by_field: day_of_week
  }

  dimension: month_name {
    label: "Month name"
    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
    order_by_field: month_num
  }

  dimension: month_num {
    label: "MonthNum"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [month_name]
    hidden: yes
  }
}
