view: f_lineitems {
  label: "Ordered Items"
  view_label: "FactItems"
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  measure: l_availqty {
    view_label: "Available Qty"
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    view_label: "Clerk"
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
    view_label: "Discount"
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: sales {
    view_label: "Sales"
    alias: [l_extendedprice]
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
    hidden: yes
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
    view_label: "Order Priority"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    view_label: "Order Status"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
    hidden: yes
  }

  measure: l_quantity {
    view_label: "Quantity"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
    hidden: yes
  }

  dimension: l_returnflag {
    view_label: "Return flag"
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
    view_label: "Shipping Mode"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    view_label: "Shipping Priority"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
    hidden: yes
  }

  measure: l_supplycost {
    view_label: "Supply Cost"
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  measure: l_tax {
    view_label: "Tax"
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  measure: l_totalprice {
    view_label: "Total Order Sum"
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
    sql: ${sales} ;;
    value_format_name: usd
  }

  measure: AvgSalePrice {
    type: average
    sql: ${sales};;
    value_format_name: usd
  }

  measure: CmlTtlSale {
    type: running_total
    sql: ${TtlSalePrice} ;;
    value_format_name: usd
  }
}
