view: aircraft {
 sql_table_name:
  public.aircraft ;;



  filter: city_filter {
    suggest_dimension: city
  }

  dimension: city_country_mapping {
#     type: yesno
#     sql: ${country} = (select country from public.aircraft where city = {% parameter city_filter %} limit 1) ;;
    sql: (select country from public.aircraft where city = {% parameter city_filter %} limit 1) ;;

  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }



dimension: test_text {
  type: string
  label: " "
  sql: (select 'TOMS Capital Investment Management LP ("TCIM") was launched in June 2018. TCIM is managed by Chief Investment Officer Benjamin Pass, who formerly was a Portfolio Manager at GLG Partners and has been working with Noam Gottesman for over 12 years. Mr. Gottesman founded GLG Partners in 1995.

TCIM invests in public equities and seeks to generate meaningful absolute risk adjusted returns.\n \n

In June 2018, TCIM launched TCIM Fund LP (the "Domestic Fund"), TCIM Offshore FUnd Ltd. (the "Offshore Fund") and TCIM Master Fund Ltd., collectively "TCIM Funds".

TCIM also manages the TOMS Capital Public Markets Strategy (the "Strategy"). The Strategy has been led by Mr. Pass since inception in 2013 and operated within TOMS Capital LLC, the family office of Mr. Gottesman (the "Family Office"), from June 2013 to May 2018.

Since June 2018, the Strategy has been managed as a separately managed account by TCIM.' as test) ;;
  html: <p align="left"> {{value}} </p> ;;
}


 dimension_group: air_worth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.air_worth_date ;;
  }

  dimension: aircraft_engine_code {
    type: string
    sql: ${TABLE}.aircraft_engine_code ;;
    label: "test_locale_label"
  }

  dimension: aircraft_engine_type_id {
    type: number
    sql: ${TABLE}.aircraft_engine_type_id ;;
  }

  dimension: aircraft_model_code {
    type: string
    sql: ${TABLE}.aircraft_model_code ;;
  }

  dimension: aircraft_serial {
    type: string
    sql: ${TABLE}.aircraft_serial ;;
  }

  dimension: aircraft_type_id {
    type: number
    sql: ${TABLE}.aircraft_type_id ;;
  }

  dimension_group: cert_issue {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.cert_issue_date ;;
  }

  dimension: certification {
    type: string
    sql: ${TABLE}.certification ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
#     html: {{ "<div>content of note field here </div>" | strip_html }} ;;
  }

  dimension: country {
    description: "TEST"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: fract_owner {
    type: string
    sql: ${TABLE}.fract_owner ;;
  }

  dimension_group: last_action {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_action_date ;;
  }

  dimension: mode_s_code {
    type: string
    sql: ${TABLE}.mode_s_code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: registrant_type_id {
    type: number
    sql: ${TABLE}.registrant_type_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    skip_drill_filter: yes
  }

  dimension: status_code {
    type: string
    sql: ${TABLE}.status_code ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension: year_built {
    type: number
    sql: ${TABLE}.year_built ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;

  }

measure: drill_test {
  type: list
  list_field: state
  drill_fields: []

}
#   measure: count {
#     type: count
#     drill_fields: [name]
#
#   }
}

explore: test {}
view: test {
  derived_table: {
    sql:
select
'TOMS Capital Investment Management LP (TCIM) was launched in June 2018. TCIM is managed by Chief Investment Officer Benjamin Pass, who formerly was a Portfolio Manager at GLG Partners and has been working with Noam Gottesman for over 12 years. Mr. Gottesman founded GLG Partners in 1995.

TCIM invests in public equities and seeks to generate meaningful absolute risk adjusted returns.

In June 2018, TCIM launched TCIM Fund LP (the Domestic Fund), TCIM Offshore FUnd Ltd. (the Offshore Fund) and TCIM Master Fund Ltd., collectively TCIM Funds.

TCIM also manages the TOMS Capital Public Markets Strategy (the Strategy). The Strategy has been led by Mr. Pass since inception in 2013 and operated within TOMS Capital LLC, the family office of Mr. Gottesman (the Family Office), from June 2013 to May 2018.

Since June 2018, the Strategy has been managed as a separately managed account by TCIM.' as text  ;;
  }

  dimension: text {}
}
