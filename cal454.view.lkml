view: cal454 {
  sql_table_name: public.cal454 ;;

  dimension: dow454 {
    type: number
    sql: ${TABLE}.dow454 ;;
  }

  dimension: month454 {
    type: number
    sql: ${TABLE}.month454 ;;
  }

  dimension: quarter454 {
    type: number
    sql: ${TABLE}.quarter454 ;;
  }

  dimension_group: transdate {
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
    sql: ${TABLE}.transdate ;;
  }

  dimension: week454 {
    type: number
    sql: ${TABLE}.week454 ;;
  }

  dimension: year454 {
    type: number
    sql: ${TABLE}.year454 ;;
  }

  measure: test {
    type: sum
    drill_fields: []
    sql:
{% if cal454.transdate_date._is_selected %}
  ${TABLE}.year454
{% elsif cal454.quarter454._is_filtered %}
CASE WHEN ${transdate_date}=cast({% date_end cal454.transdate_date %} as DATE)
THEN ${TABLE}.month454
ELSE NULL END
{% else %}
CASE WHEN EXTRACT(day from DATEADD(day,1,${transdate_date})) = 1
THEN ${TABLE}.week454
ELSE NULL END

{% endif %} ;;
}

}
