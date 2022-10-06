view: d_supplier {
  label: "Suppliers"
  view_label: "DimSupplier"
  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    label: "Actual Balance"
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: s_address {
    label: "Supplier Address"
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    label: "Supplier Name"
    type: string
    sql: ${TABLE}."S_NAME" ;;
  }

  dimension: s_nation {
    label: "Supplier Nation"
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {
    label: "Supplier Phone"
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {
    label: "Supplier Region"
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: SuppCohort {
    label: "Supplier Cohort" #the name given in the task is too long and not user-friendly, so I left it in the description
    description: "Cohort of suppliers according to Account Balance"
    type: tier
    style: integer
    tiers: [1,3001,5001,7001]
    sql: ${d_supplier.s_acctbal} ;;
  }

  measure: count {
    label: "Suppliers Count"
    type: count
    drill_fields: [s_name]
    hidden: no
  }
}
