- dashboard: lookml_dashboard_custom_field_test
  title: LookML Dashboard Custom Field Test
  layout: newspaper
  elements:
  - title: Top Ten Airlines w/ Accidents & Percent Fatalities
    name: Top Ten Airlines w/ Accidents & Percent Fatalities
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: accidents_ext
    type: looker_area
    garbo: garbo
    fields:
    - count_of_accidents_with_fatalities

    - garbo
    - accidents_ext.count
    - accidents_ext.air_carrier
    filters:
      accidents_ext.air_carrier: "-EMPTY,-%unknown%,-%Unknown%"
    sorts:
    - accidents_ext.count desc
    limit: 10
    dynamic_fields:
    - measure: count_of_accidents_with_fatalities
      based_on: accidents_ext.number_of_fatalities
      type: count_distinct
      label: Count of Accidents with Fatalities
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: percent_of_fatal_crashes
      label: Percent of Fatal Crashes
      expression: "${count_of_accidents_with_fatalities}/${accidents_ext.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: Etc/GMT+2
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Top Ten Make & Model Accidents & Percent of Fatalities
    name: Top Ten Make & Model Accidents & Percent of Fatalities
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: accidents_ext
    type: looker_area
    fields:
    - count_of_accidents_with_fatalities
    - accidents_ext.count
    - accidents_ext.make
    - accidents_ext.model
    sorts:
    - accidents_ext.count desc
    limit: 10
    dynamic_fields:
    - measure: count_of_accidents_with_fatalities
      based_on: accidents_ext.number_of_fatalities
      type: count_distinct
      label: Count of Accidents with Fatalities
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: percent_of_fatal_crashes
      label: Percent of Fatal Crashes
      expression: "${count_of_accidents_with_fatalities}/${accidents_ext.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: Etc/GMT+2
    series_types: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Count of Accidents
    name: Count of Accidents
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: accidents_ext
    type: single_value
    fields:
    - accidents_ext.count
    sorts:
    - accidents_ext.count desc
    limit: 10
    dynamic_fields:
    - measure: count_of_accidents_with_fatalities
      based_on: accidents_ext.number_of_fatalities
      type: count_distinct
      label: Count of Accidents with Fatalities
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: percent_of_fatal_crashes
      label: Percent of Fatal Crashes
      expression: "${count_of_accidents_with_fatalities}/${accidents_ext.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    query_timezone: Etc/GMT+2
    series_types: {}
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Top Five Countries with Accidents
    name: Top Five Countries with Accidents
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: accidents_ext
    type: looker_pie
    fields:
    - accidents_ext.count
    - accidents_ext.country
    sorts:
    - accidents_ext.count desc
    limit: 5
    dynamic_fields:
    - measure: count_of_accidents_with_fatalities
      based_on: accidents_ext.number_of_fatalities
      type: count_distinct
      label: Count of Accidents with Fatalities
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: percent_of_fatal_crashes
      label: Percent of Fatal Crashes
      expression: "${count_of_accidents_with_fatalities}/${accidents_ext.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    query_timezone: Etc/GMT+2
    value_labels: legend
    label_type: labVal
    series_types: {}
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Percent of Fatal Crashes Amateur Built Aircraft vs Professional
    name: Percent of Fatal Crashes Amateur Built Aircraft vs Professional
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: accidents_ext
    type: looker_donut_multiples
    fields:
    - accidents_ext.count
    - accidents_ext.amateur_built
    - count_of_accidents_with_fatalities
    filters:
      accidents_ext.amateur_built: Yes,No
    sorts:
    - accidents_ext.count desc
    limit: 5
    dynamic_fields:
    - measure: count_of_accidents_with_fatalities
      based_on: accidents_ext.number_of_fatalities
      type: count_distinct
      label: Count of Accidents with Fatalities
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: percent_of_fatal_crashes
      label: Percent of Fatal Crashes
      expression: "${count_of_accidents_with_fatalities}/${accidents_ext.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      is_disabled: false
    query_timezone: Etc/GMT+2
    show_value_labels: true
    font_size: 12
    series_labels:
      accidents_ext.count: Accidents
    value_labels: legend
    label_type: labVal
    series_types: {}
    row: 6
    col: 8
    width: 8
    height: 6
