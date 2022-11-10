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
    link: {
      label: "Supplier's website"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
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
    tiers: [0,301,3001,5001,7001]
    style: integer
    sql: ${s_acctbal} ;;
    value_format: "$#,##0"
  }

  measure: count {
    label: "Suppliers Count"
    type: count
    drill_fields: [s_name]
    hidden: no
  }

  set: Part_details {
    fields: [d_part.p_name, d_part.p_brand, d_part.p_mfgr]
  }
}
