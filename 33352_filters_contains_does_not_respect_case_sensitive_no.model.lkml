connection: "faa_redshift"
case_sensitive: yes

# include all the views
include: "*.view"
include: "*.dashboard"

# include all the dashboards
# include: "*.dashboard.lkml"

# explore: accidents_ext {
#   join: airports_ext {
#     relationship: one_to_one
#     sql_on: ${accidents_ext.country} = ${airports_ext.county} ;;
#   }
# }

explore: aircraft {
 view_label: "aircraft_view_label"
}

explore: aircraft_models {
  hidden: yes
}

explore: airports {
#   access_filter: {
#     field: airports.city
#     user_attribute: airport
#   }
#
#   access_filter: {
#     field: airports.county
#     user_attribute: airport_2
#   }
join: accidents {
  relationship: one_to_many
  sql_on: ${accidents.airport_code} = ${airports.code} ;;
}

#   sql_always_where: ( ${city} = '{{_user_attributes['airport']}}' OR  ${county} = '{{_user_attributes['airport_2']}}' ) ;;
}

explore: cal454 {}

explore: carriers {}

explore: flights {}

explore: flights_by_day {}

explore: ontime {}

explore: temp2 {}
