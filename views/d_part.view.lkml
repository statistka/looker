view: d_part {
  label: "Parts"
  view_label: "DimPart"
  sql_table_name: "DATA_MART"."D_PART"
    ;;

  dimension: p_brand {
    label: "Brand"
    type: string
    sql: ${TABLE}."P_BRAND" ;;
  }

  dimension: p_mfgr {
    label: "Manufacturer"
    type: string
    sql: ${TABLE}."P_MFGR" ;;
  }

  dimension: p_name {
    label: "Part name"
    type: string
    sql: ${TABLE}."P_NAME" ;;
  }

  dimension: p_partkey {
    type: number
    sql: ${TABLE}."P_PARTKEY" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: p_size {
    label: "Part size"
    type: number
    sql: ${TABLE}."P_SIZE" ;;
  }

  dimension: p_type {
    label: "Part type"
    type: string
    sql: ${TABLE}."P_TYPE" ;;
  }

  measure: count {
    label: "Parts Count"
    type: count
    drill_fields: [p_name]
  }
}
