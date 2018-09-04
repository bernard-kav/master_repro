- dashboard: working_dash
  title: working dash
  layout: newspaper
  elements:
  - title: test
    name: test
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: accidents
    type: table
    listen:
      dashboard_filter_name: untitled_filter
    fields:
    - accidents.accident_number
    - accidents.airport_code
    sorts:
    - accidents.accident_number
    limit: 500
    query_timezone: America/New_York
    listen:
      Untitled Filter: accidents.id
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Untitled Filter
    title: Untitled Filter
    type: field_filter
    default_value: '10'
    allow_multiple_values: true
    required: false
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: accidents
    listens_to_filters: []
    field: accidents.id
