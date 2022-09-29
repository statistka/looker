connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: kantsupova_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kantsupova_project_default_datagroup

explore: f_lineitems {
  label: "Items"
  view_label: "OrderedItems"

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
    view_label: "Dates"
    type: left_outer
    sql_on: ${d_dates.datekey} = ${f_lineitems.l_orderdatekey} ;;
    relationship: many_to_many
  }
}
