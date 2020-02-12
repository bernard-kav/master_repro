explore: accidents {}
view: accidents {
#   extension: required
derived_table: {
  sql:
select * from public.accidents

    ;;
    }


dimension: US_international {
  type: string
  sql: CASE WHEN ${TABLE}.country = 'United States' THEN '{{ _localization['domestic'] }}'
        ELSE '{{ _localization['international'] }}' END ;;
}


filter: date_filter {
  type: date
}

  filter: YTD_date {
    type: date
    default_value: "before today"
    description: "Enter the end date of YTD analysis--use 'before' syntax"
  }

  parameter: date_granularity {
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
  }

  dimension: date_grouping {
    type: date
    sql: date_trunc({% parameter date_granularity %}, ${TABLE}.event_date) ;;
  }

  dimension: accident_coordinates {
    type: location
    sql_latitude: ${TABLE}.latitude::float ;;
    sql_longitude:${TABLE}.longitude::float ;;
  }

  dimension: distnace_from_airport {
    type: distance
    start_location_field: accidents.accident_coordinates
    end_location_field: airports.airport_coordinates
    units: miles
  }


  measure: test_ytd {
    type: sum
    sql: case when date_part(year, ${event_date}) =  date_part(year, {% date_end YTD_date %}) and {% condition YTD_date %} ${event_date} {% endcondition %} then 1 else 0 end ;;

    drill_fields: [event_date]
  }

  dimension: date_comparison {
    type: yesno
    sql: cast(${event_date} as varchar) > cast({% parameter date %} as varchar) ;;
  }

  dimension: 14_day_interval {
    type: yesno
    sql: ${event_date} BETWEEN ${event_date} AND ${event_date} + interval '14 days' ;;
  }



  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
#
#   dimension: tier_test {
#     style: integer
#     tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110 ]
#     sql: ${TABLE}.null_dim ;;
#   }

  dimension_group: current_time {
    type:time
    timeframes: [time, date, raw]
    sql: (SELECT getdate()) ;;
  }


  dimension_group: duration {
    type: duration
    intervals: [second, day, year]
    sql_start: ${event_raw} ;;
    sql_end: ${current_time_raw} ;;
  }

  measure: count {
    type: count
    drill_fields: [duration_year]
  }

  dimension: accident_number {
    description: "accident number"
    type: string
    sql: ${TABLE}.accident_number ;;
    drill_fields: [duration_day]
  }

  dimension: air_carrier {
    type: string
    sql: ${TABLE}.air_carrier ;;
  }

  dimension: aircraft_category {
    type: string
    sql: ${TABLE}.aircraft_category ;;
  }

  dimension: aircraft_damage {
    type: string
    sql: ${TABLE}.aircraft_damage ;;
  }

  dimension: airport_code {
    type: string
    sql: ${TABLE}.airport_code ;;
  }

  dimension: airport_name {
    type: string
    sql: ${TABLE}.airport_name ;;
  }

  measure: airport_list {
    type: list
    list_field: airport_name
  }

  dimension: amateur_built {
    type: string
    sql: ${TABLE}.amateur_built ;;
  }

  dimension: broad_phase_of_flight {
    type: string
    sql: ${TABLE}.broad_phase_of_flight ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: engine_type {
    type: string
    sql: ${TABLE}.engine_type ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week
    ]
    sql: ${TABLE}.event_date ;;
  }

  measure: liquid_sum {
    type: sum
    sql: case when ${event_date} = {% date_end event_date %} then ${id} else null end ;;
  }

  dimension: dimensiont_fill_bug {
    type: yesno
    sql: ${country} = 'Afghanistan';;
  }



  dimension: test_1 {
    type: yesno
    sql: ${event_date} = {% date_end event_date %}  ;;
  }

  dimension: week_start_day_test{
    sql:  TO_CHAR(
        (CASE
            WHEN EXTRACT(DOW FROM ${event_date}) <= 6
            THEN ${event_date} + (6 - EXTRACT(DOW FROM ${event_date})) * INTERVAL '2 days'
            ELSE ${event_date} + ((6 + 7) - EXTRACT(DOW FROM ${event_date})) * INTERVAL '2 days'
        END) + INTERVAL '-6 days', 'YYYY-MM-DD' ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: far_description {
    type: string
    sql: ${TABLE}.far_description ;;
  }

  dimension: injury_severity {
    type: string
    sql: ${TABLE}.injury_severity ;;
  }

  dimension: investigation_type {
    type: string
    sql: ${TABLE}.investigation_type ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
    drill_fields: [duration_date]
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: number_of_engines {
    type: string
    sql: ${TABLE}.number_of_engines ;;
  }

  dimension: number_of_fatalities {
    type: string
    sql: ${TABLE}.number_of_fatalities ;;
  }

  dimension: number_of_minor_injuries {
    type: string
    sql: ${TABLE}.number_of_minor_injuries ;;
  }

  dimension: number_of_serious_injuries {
    type: string
    sql: ${TABLE}.number_of_serious_injuries ;;
  }

  dimension: number_of_uninjured {
    type: string
    sql: ${TABLE}.number_of_uninjured ;;
  }

  dimension_group: publication {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.publication_date ;;
  }

  dimension: purpose_of_flight {
    type: string
    sql: ${TABLE}.purpose_of_flight ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: report_status {
    type: string
    sql: ${TABLE}.report_status ;;
  }

  dimension: schedule {
    type: string
    sql: ${TABLE}.schedule ;;
  }

  dimension: weather_condition {
    type: string
    sql: ${TABLE}.weather_condition ;;
  }

  dimension: partition_by {
    hidden: yes
    sql: (PARTITION BY
      ${nuna_run_id}
      {% if airports.country._is_selected %} , base_cohort_cost_source_summary.hcc_flag_comparison {% endif %}
      {% if airports.country._is_selected %} , cohort_member_summary_a.cohort_flag {% endif %}
      {% if combined_claims.dental_coverage_tier._is_selected %} , ${dental_coverage_tier} {% endif %}
      {% if combined_claims.dental_plan._is_selected %} , ${dental_plan} {% endif %}
      {% if combined_claims.dental_plan_type._is_selected %} , ${dental_plan_type} {% endif %}
      {% if combined_claims.dental_vendor._is_selected %} , ${dental_vendor} {% endif %}
      {% if combined_claims.employee_benefit_status._is_selected %} , ${employee_benefit_status} {% endif %}
      {% if combined_claims.employee_department._is_selected %} , ${employee_department} {% endif %}
      {% if combined_claims.employee_division._is_selected %} , ${employee_division} {% endif %}
      {% if combined_claims.employee_location._is_selected %} , ${employee_location} {% endif %}
      {% if combined_claims.employee_salary_band._is_selected %} , ${employee_salary_band} {% endif %}
      {% if combined_claims.incurred_month._is_selected %} , ${incurred_month} {% endif %}
      {% if combined_claims.incurred_quarter._is_selected %} , ${incurred_quarter} {% endif %}
      {% if combined_claims.incurred_year._is_selected %} , ${incurred_year} {% endif %}
      {% if combined_claims.incurred_or_paid_month._is_selected %} , ${incurred_or_paid_month} {% endif %}
      {% if combined_claims.incurred_or_paid_quarter._is_selected %} , ${incurred_or_paid_quarter} {% endif %}
      {% if combined_claims.incurred_or_paid_year._is_selected %} , ${incurred_or_paid_year} {% endif %}
      {% if combined_claims.is_medical_claims_expected._is_selected %} , ${is_medical_claims_expected} {% endif %}
      {% if combined_claims.is_medical_eligible._is_selected %} , ${is_medical_eligible} {% endif %}
      {% if combined_claims.is_medical_enrolled._is_selected %} , ${is_medical_enrolled} {% endif %}
      {% if combined_claims.jhu_rub_name._is_selected %} , ${TABLE}.jhu_rub_name {% endif %}
      {% if combined_claims.jhu_rub_name_prior_time_range._is_selected %} , ${TABLE}.jhu_rub_name_prior_time_range {% endif %}
      {% if combined_claims.med_12_month_claims_expected_enrollment._is_selected %} , ${med_12_month_claims_expected_enrollment} {% endif %}
      {% if combined_claims.med_24_month_claims_expected_enrollment._is_selected %} , ${med_24_month_claims_expected_enrollment} {% endif %}
      {% if combined_claims.med_12_month_enrollment._is_selected %} , ${med_12_month_enrollment} {% endif %}
      {% if combined_claims.med_24_month_enrollment._is_selected %} , ${med_24_month_enrollment} {% endif %}
      {% if combined_claims.medical_coverage_status._is_selected %} , ${medical_coverage_status} {% endif %}
      {% if combined_claims.medical_coverage_tier._is_selected %} , ${medical_coverage_tier} {% endif %}
      {% if combined_claims.medical_plan._is_selected %} , ${medical_plan} {% endif %}
      {% if combined_claims.medical_plan_type._is_selected %} , ${medical_plan_type} {% endif %}
      {% if combined_claims.medical_vendor._is_selected %} , ${medical_vendor} {% endif %}
      {% if combined_claims.member_age._is_selected %} , ${member_age} {% endif %}
      {% if combined_claims.member_age_group._is_selected %} , ${TABLE}.member_age_group {% endif %}
      {% if combined_claims.member_cbsa._is_selected %} , ${member_cbsa} {% endif %}
      {% if combined_claims.member_cbsa_latitude._is_selected %} , ${member_cbsa_latitude} {% endif %}
      {% if combined_claims.member_cbsa_location._is_selected %} , ${member_cbsa_location} {% endif %}
      {% if combined_claims.member_cbsa_longitude._is_selected %} , ${member_cbsa_longitude} {% endif %}
      {% if combined_claims.member_city._is_selected %} , ${member_city} {% endif %}
      {% if combined_claims.member_hash_id._is_selected %} , ${member_hash_id} {% endif %}
      {% if combined_claims.member_id._is_selected %} , ${member_id} {% endif %}
      {% if combined_claims.member_msa._is_selected %} , ${member_msa} {% endif %}
      {% if combined_claims.member_relationship._is_selected %} , ${TABLE}.member_relationship {% endif %}
      {% if combined_claims.member_sex._is_selected %} , ${member_sex} {% endif %}
      {% if combined_claims.member_state._is_selected %} , ${member_state} {% endif %}
      {% if combined_claims.member_zip_code._is_selected %} , ${member_zip_code} {% endif %}
      {% if combined_claims.member_zip_code_3._is_selected %} , ${member_zip_code_3} {% endif %}
      {% if combined_claims.opioid_addiction_status._is_selected %} , ${TABLE}.opioid_addiction_status {% endif %}
      {% if combined_claims.paid_month._is_selected %} , ${paid_month} {% endif %}
      {% if combined_claims.paid_quarter._is_selected %} , ${paid_quarter} {% endif %}
      {% if combined_claims.paid_year._is_selected %} , ${paid_year} {% endif %}
      {% if combined_claims.pharmacy_coverage_tier._is_selected %} , ${pharmacy_coverage_tier} {% endif %}
      {% if combined_claims.pharmacy_plan._is_selected %} , ${pharmacy_plan} {% endif %}
      {% if combined_claims.pharmacy_plan_type._is_selected %} , ${pharmacy_plan_type} {% endif %}
      {% if combined_claims.pharmacy_vendor._is_selected %} , ${pharmacy_vendor} {% endif %}
      {% if combined_claims.rx_12_month_claims_expected_enrollment._is_selected %} , ${rx_12_month_claims_expected_enrollment} {% endif %}
      {% if combined_claims.rx_24_month_claims_expected_enrollment._is_selected %} , ${rx_24_month_claims_expected_enrollment} {% endif %}
      {% if combined_claims.rx_12_month_enrollment._is_selected %} , ${rx_12_month_enrollment} {% endif %}
      {% if combined_claims.rx_24_month_enrollment._is_selected %} , ${rx_24_month_enrollment} {% endif %}
      {% if combined_claims.subscriber_hash_id._is_selected %} , ${subscriber_hash_id} {% endif %}
      {% if combined_claims.tenure._is_selected %} , ${tenure} {% endif %}
      {% if combined_claims.time_frame_comparison._is_selected %} , ${time_frame_comparison} {% endif %}
      {% if combined_claims.vision_coverage_tier._is_selected %} , ${vision_coverage_tier} {% endif %}
      {% if combined_claims.vision_plan._is_selected %} , ${vision_plan} {% endif %}
      {% if combined_claims.vision_plan_type._is_selected %} , ${vision_plan_type} {% endif %}
      {% if combined_claims.vision_vendor._is_selected %} , ${vision_vendor} {% endif %}
      )
      ;;
  }





  measure: drill_test {
    type: count_distinct

    label: "TEST"
    sql: ${TABLE}.id ;;
    drill_fields: [id, accident_number, country]
  }
}
