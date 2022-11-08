view: f_lineitems {
  label: "Ordered Items"
  view_label: "FactItems"
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    label: "Available Qty"
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
    group_label: "Facts"
  }

  dimension: l_clerk {
    label: "Clerk"
    type: string
    sql: ${TABLE}."L_CLERK" ;;
    group_label: "Order Details"
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
    label: "Discount"
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
    group_label: "Order Details"
  }

  dimension: l_extendedprice {
    label: "Sales"
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
    group_label: "Facts"
    hidden:  no
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
    label: "Order Number"
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
    group_label: "Order Details"
  }

  dimension: l_orderpriority {
    label: "Order Priority"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
    group_label: "Order Details"
  }

  dimension: l_orderstatus {
    label: "Order Status"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
    group_label: "Order Details"
  }

  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
    hidden: yes
  }

  dimension: l_quantity {
    label: "Quantity"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
    group_label: "Facts"
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
    hidden: yes
  }

  dimension: l_returnflag {
    label: "Return flag"
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
    group_label: "Order Details"
  }

  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
    hidden: yes
  }

  dimension: l_shipinstruct {
    label: "Shipping Instructions"
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
    group_label: "Shipping Details"
  }

  dimension: l_shipmode {
    label: "Shipping Mode"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
    group_label: "Shipping Details"
    drill_fields: [Ship_details*]
  }

  dimension: l_shippriority {
    label: "Shipping Priority"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
    group_label: "Shipping Details"
  }

  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
    hidden: yes
  }

  dimension: l_supplycost {
    label: "Supply Cost"
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
    group_label: "Facts"
  }

  dimension: l_tax {
    label: "Tax"
    type: number
    sql: ${TABLE}."L_TAX" ;;
    group_label: "Facts"
  }

  dimension: l_totalprice {
    label: "Total Order Sum"
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
    group_label: "Facts"
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: TtlSales {
    label: "Total Sales" #this name looks more user-friendly as it's common definition for the amount of money got from the items sold
    description: "Total sales from items sold"
    type: sum
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    group_label: "Sales Measures"
  }

  measure: AvgSalePrice {
    label: "Average Sales" #this name is aligned with manes of other measures from the group Sales measures
    description: "Average sale price of items sold"
    type: average
    sql: ${l_extendedprice};;
    value_format_name: usd
    group_label: "Sales Measures"
  }

  measure: CmlTtlSale {
    label: "Cumulative Total Sales"
    description: "Cumulative total sales from items sold (also known as a running total)"
    type: running_total
    sql: ${TtlSales} ;;
    value_format_name: usd
    group_label: "Sales Measures"
    }

  measure: TtlSalesShpAir {
    label: "Total Sales Shipped By Air"
    description: "Total sales of items shipped by air"
    type: sum
    sql: ${l_extendedprice} ;;
    filters: [l_shipmode: "AIR, REG AIR"]
    value_format_name: usd
    group_label: "Sales Measures"
  }

  measure: TtlRUSales {
    label: "Total Russia Sales"
    description: "Total sales by customers from Russia"
    type: sum
    sql: ${l_extendedprice} ;;
    filters: [d_customer.c_nation: "RUSSIA"]
    value_format_name: usd
    group_label: "Sales Measures"
  }

  measure: TtlCost {
    label: "Total Cost"
    type: sum
    sql: ${l_supplycost} ;;
    value_format_name: usd
    group_label: "Margin & Revenue Measures"
  }

  measure: TtlGrossRev {
    label: "Total Gross Revenue"
    description: "Total price of completed sales"
    type: sum
    sql: ${l_extendedprice} ;;
    filters: [l_orderstatus: "F"]
    value_format_name: usd
    group_label: "Margin & Revenue Measures"
  }

  measure: TtlGrossMargin {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost"
    type: number
    sql: ${TtlGrossRev} - ${TtlCost} ;;
    value_format_name: usd
    group_label: "Margin & Revenue Measures"
  }

  measure: GrossMarginPct {
    label: "Gross Margin Percentage"
    description: "Total Gross Margin Amount / Total Gross Revenue"
    type: number
    sql: ${TtlGrossMargin} / NULLIF(${TtlGrossRev},0) ;;
    value_format_name: percent_2
    group_label: "Margin & Revenue Measures"
  }

  measure: ReturnedItems {
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers"
    type: sum
    sql: ${l_quantity} ;;
    filters: [l_returnflag: "R"]
    group_label: "Item Measures"
  }

  measure: SoldItems {
    label: "Total Number of Items Sold"
    description: "Number of items that were sold"
    type: sum
    sql: ${l_quantity} ;;
    group_label: "Item Measures"
  }

  measure: OrdersCount{
    label: "Count of Orders"
    description: "Number of orders that were sold"
    type: count_distinct
    sql: ${l_orderkey};;
    value_format_name: id
    group_label: "Order Measures"
    }

  measure: ItemRR {
    label: "Item Return Rate"
    description: "Number Of Items Returned / Total Number Of Items Sold"
    type: number
    sql: ${ReturnedItems} / NULLIF(${SoldItems},0) ;;
    value_format_name: percent_2
    group_label: "Item Measures"
  }

  measure: CompleteRate {
    label: "Order Completion Rate"
    description: "Completed Sales / Total Sales"
    type: number
    sql: ${TtlGrossRev} / NULLIF(${TtlSales},0) ;;
    value_format_name: percent_2
    group_label: "Sales Measures"
  }

  measure: TtlCustomers {
    label: "Total Number of Customers"
    description: "Number of unique customers who made a purchase at least once"
    type: count_distinct
    sql: ${l_custkey} ;;
    value_format_name: id
    group_label: "Customer Measures"
  }

  measure: SalesByCus {
    label: "Average Spend per Customer"
    description: "Total Sale Price / Total Number of Customers"
    type: number
    sql: ${TtlSales} / NULLIF(${TtlCustomers},0) ;;
    value_format_name: percent_2
    group_label: "Customer Measures"
  }

  set: Ship_details {
    fields: [d_supplier.SuppCohort, d_supplier.s_region]
  }

}
