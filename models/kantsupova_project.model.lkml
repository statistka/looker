connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: all_views {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: all_views

explore: f_lineitems {
  label: "Operational Analysis"
  view_label: "Ordered Items"

  case_sensitive: no

  join: d_part{
    view_label: "Parts"
    type: left_outer
    sql_on: ${d_part.p_partkey} = ${f_lineitems.l_partkey} ;;
    relationship: many_to_one
  }
  join: d_customer {
    view_label: "Customers"
    type: left_outer
    sql_on: ${d_customer.c_custkey} = ${f_lineitems.l_custkey} ;;
    relationship: many_to_one
  }
  join: d_supplier{
    view_label: "Suppliers"
    type: left_outer
    sql_on: ${d_supplier.s_suppkey} = ${f_lineitems.l_custkey} ;;
    relationship: many_to_one
  }
  join: d_dates {
    view_label: "Order Dates"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey} = ${d_dates.datekey} ;;
    relationship: many_to_one
  }

  #join: o_dates {
  #  view_label: "Order Dates"
  #  type: left_outer
  #  from: d_dates
  #  sql_on: ${f_lineitems.l_orderdatekey} = ${d_dates.datekey} ;;
  #}

  #join: s_dates {
  #  view_label: "Shipment dates"
  #  type: left_outer
  #  from: d_dates
  #  sql_on: ${f_lineitems.l_shipdatekey} = ${s_dates.datekey};;
  #  relationship: many_to_one
  #  }
}
