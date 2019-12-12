- dashboard: testing_vis_vs_table_on_a_dashboard
  title: Testing vis vs table on a dashboard
  layout: newspaper
  elements:
  - name: Testing vis vs table
    title: Testing vis vs table
    model: thelook_bugs
    explore: orders
    type: looker_area
    fields:
    - orders.created_month
    - users.created_month
    - orders.count
    pivots:
    - users.created_month
    filters:
      orders.created_month: 12 months ago for 12 months
      users.created_month: 12 months ago for 12 months
    sorts:
    - orders.created_month
    limit: 500
    y_axis_labels:
    - Number of orders
    x_axis_label: Order Month
    legend_align: right
    colors:
    - "#FF0000"
    - "#DE0000"
    - "#C90000"
    - "#9C0202"
    - "#800101"
    - "#6B0000"
    - "#4D006B"
    - "#0D0080"
    - "#080054"
    - "#040029"
    - "#000000"
    stacking: normal
    hide_points: true
    note_state: collapsed
    note_display: above
    row: 0
    col: 0
    width: 24
    height: 7
