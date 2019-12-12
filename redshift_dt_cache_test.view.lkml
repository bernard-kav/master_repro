view: redshift_dt_cache_test {
  derived_table: {
    sql: SELECT * FROM pg_catalog.pg_database LIMIT 10
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: datname {
    type: string
    sql: ${TABLE}.datname ;;
  }

  dimension: datdba {
    type: number
    sql: ${TABLE}.datdba ;;
  }

  dimension: encoding {
    type: number
    sql: ${TABLE}.encoding ;;
  }

  dimension: datistemplate {
    type: string
    sql: ${TABLE}.datistemplate ;;
  }

  dimension: datallowconn {
    type: string
    sql: ${TABLE}.datallowconn ;;
  }

  dimension: datlastsysoid {
    type: string
    sql: ${TABLE}.datlastsysoid ;;
  }

  dimension: datvacuumxid {
    type: string
    sql: ${TABLE}.datvacuumxid ;;
  }

  dimension: datfrozenxid {
    type: string
    sql: ${TABLE}.datfrozenxid ;;
  }

  dimension: dattablespace {
    type: string
    sql: ${TABLE}.dattablespace ;;
  }

  dimension: datconfig {
    type: string
    sql: ${TABLE}.datconfig ;;
  }

  dimension: datacl {
    type: string
    sql: ${TABLE}.datacl ;;
  }

  set: detail {
    fields: [
      datname,
      datdba,
      encoding,
      datistemplate,
      datallowconn,
      datlastsysoid,
      datvacuumxid,
      datfrozenxid,
      dattablespace,
      datconfig,
      datacl
    ]
  }
}
