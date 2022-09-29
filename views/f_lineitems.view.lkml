view: f_lineitems {
  label: "Ordered Items"
  view_label: "FactItems"
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  measure: l_availqty {
    label: "Available Qty"
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
    hidden: yes
  }

  dimension: l_custkey {
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
    hidden: yes
  }

  dimension: l_discount {
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
    hidden: yes
  }

  dimension: l_orderkey {
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
    hidden: yes
  }

  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
    hidden: yes
  }

  measure: l_quantity {
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
    hidden: yes
  }

  dimension: l_returnflag {
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
    hidden: yes
  }

  dimension: l_shipinstruct {
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  measure: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  measure: l_tax {
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  measure: l_totalprice {
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: TtlSalePrice {
    type: sum
    sql: ${l_extendedprice} ;;
    value_format_name: usd
  }

  measure: AvgSalePrice {
    type: average
    sql: ${l_extendedprice};;
    value_format_name: usd
  }

  measure: CmlTtlSale {
    type: running_total
    sql: ${TtlSalePrice} ;;
    value_format_name: usd
  }
}
