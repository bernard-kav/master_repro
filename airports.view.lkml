view: airports {
  sql_table_name: public.airports ;;


parameter: number_list {
  type: unquoted
#   allowed_value: {
#     label: "10"
#     value: "10"
#   }
#   allowed_value: {
#     label: "20"
#     value: "20"
#   }
}

dimension: new {
  sql: ${id} ;;
}

parameter: test {
  type: number
}

dimension: test_param {
  type: number
  sql: {% parameter test %} ;;
}

dimension: city_af {
  type: string
  sql: {{_access_filters[airports.city]}} ;;
}

dimension: county_af {
  type: string
  sql:  {{_access_filters[airports.county]}} ;;
}


 dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: min_test {
    type: min
    sql: ${id} ;;
  }

  dimension: param_list_test {
    type: yesno
    sql: ${id} IN ({% parameter number_list %}) ;;
  }

  dimension: act_date {
    type: string
    sql: ${TABLE}.act_date ;;
  }

  dimension: aero_cht {
    type: string
    sql: ${TABLE}.aero_cht ;;
  }

  dimension: c_ldg_rts {
    type: string
    sql: ${TABLE}.c_ldg_rts ;;
  }

  dimension: cbd_dir {
    type: string
    sql: ${TABLE}.cbd_dir ;;
  }

  dimension: cbd_dist {
    type: number
    sql: ${TABLE}.cbd_dist ;;
  }

  dimension: cert {
    type: string
    sql: ${TABLE}.cert ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cntl_twr {
    type: string
    sql: ${TABLE}.cntl_twr ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: cust_intl {
    type: string
    sql: ${TABLE}.cust_intl ;;
  }

  dimension: elevation {
    type: number
    sql: ${TABLE}.elevation ;;
  }

  dimension: faa_dist {
    type: string
    sql: ${TABLE}.faa_dist ;;
  }

  dimension: faa_region {
    type: string
    sql: ${TABLE}.faa_region ;;
  }

  dimension: fac_type {
    type: string
    sql: ${TABLE}.fac_type ;;
  }

  dimension: fac_use {
    type: string
    sql: ${TABLE}.fac_use ;;
  }

  dimension: fed_agree {
    type: string
    sql: ${TABLE}.fed_agree ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: joint_use {
    type: string
    sql: ${TABLE}.joint_use ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: major {
    type: string
    sql: ${TABLE}.major ;;
  }

  dimension: mil_rts {
    type: string
    sql: ${TABLE}.mil_rts ;;
  }

  dimension: own_type {
    type: string
    sql: ${TABLE}.own_type ;;
  }

  dimension: site_number {
    type: string
    sql: ${TABLE}.site_number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: [id, full_name]
    html: {{rendered_value}} || {{accidents.airport_code._rendered_value}} ;;
  }

  measure: test_filter {
    type: sum
    filters: {
      field: count
      value: ">10"
    }
  }


}
