view: prev_month_sales {
  label: "Previous Month Sales"
  view_label: ""
  derived_table: {
    sql: select YEAR(DATE_VAL), MONTH(DATE_VAL), sum(L_EXTENDEDPRICE ) as CM_Sales, LAG(sum(L_EXTENDEDPRICE), 1) OVER (Order by YEAR(DATE_VAL), MONTH(DATE_VAL)) as PM_Sales
    from DATA_MART.D_DATES as d LEFT JOIN DATA_MART.F_LINEITEMS as f on d.datekey = L_ORDERDATEKEY group by YEAR(DATE_VAL), MONTH(DATE_VAL)
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: yeardate_val {
    label: "Year"
    type: number
    sql: ${TABLE}."YEAR(DATE_VAL)" ;;
  }

  dimension: monthdate_val {
    label: "Month"
    type: number
    sql: ${TABLE}."MONTH(DATE_VAL)" ;;
  }

  dimension: month_year {
    primary_key: yes
    type:  number
    sql: ${yeardate_val} * 100 + ${monthdate_val};;
    hidden:  yes
  }

  dimension: cm_sales {
    type: number
    sql: ${TABLE}."CM_SALES" ;;
    hidden:  yes
  }

  dimension: pm_sales {
    label: "Previous Month Sales"
    type: number
    sql: ${TABLE}."PM_SALES" ;;
    hidden:  yes
  }

  measure: CURMTH_SLS {
    label: "Current Month Sales"
    type: sum
    sql: ${cm_sales} ;;
    value_format_name: usd
  }

  measure: PREVMTH_SLS {
    label: "Previous Month Sales"
    type: sum
    sql: ${pm_sales} ;;
    value_format_name: usd
  }

  set: detail {
    fields: [yeardate_val, monthdate_val, cm_sales, pm_sales]
  }
}
