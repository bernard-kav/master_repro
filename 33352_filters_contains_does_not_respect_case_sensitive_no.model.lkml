connection: "faa_redshift"
case_sensitive: yes

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: accidents {}

explore: aircraft {}

explore: aircraft_models {}

explore: airports {}

explore: cal454 {}

explore: carriers {}

explore: flights {}

explore: flights_by_day {}

explore: ontime {}

explore: temp2 {}
