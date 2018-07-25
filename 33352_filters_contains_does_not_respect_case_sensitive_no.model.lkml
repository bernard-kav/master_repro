connection: "faa_redshift"
case_sensitive: yes

# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard.lkml"

explore: accidents_ext {
  join: airports_ext {
    relationship: one_to_one
    sql_on: ${accidents_ext.country} = ${airports_ext.county} ;;
  }
}

explore: aircraft {}

explore: aircraft_models {}

explore: airports {}

explore: cal454 {}

explore: carriers {}

explore: flights {}

explore: flights_by_day {}

explore: ontime {}

explore: temp2 {}
