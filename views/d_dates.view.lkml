view: d_dates {
  label: "Dates"
  view_label: "DimDate"
  sql_table_name: "DATA_MART"."D_DATES"
    ;;

  dimension_group: date_val {
    label: "Calendar dates"
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
    label: "Month Num"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    label: "Quarter"
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    label: "Year"
    type: number
    sql: ${TABLE}."YEAR" ;;
    order_by_field: date_val_year
  }

  dimension: month_year {
    label: "Month-Year"
    type: string
    sql: ${month_name} || '-' || ${year} ;;
    order_by_field: monthyear
  }

  dimension: monthyear {
    type: number
    sql: ${year} * 100 + ${month_num} ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [month_name]
    hidden: yes
  }
}
