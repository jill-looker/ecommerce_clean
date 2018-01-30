view: distribution_centers {
  sql_table_name: public.distribution_centers ;;

  dimension: id {
    primary_key: yes
    label: "Distribution Center ID"
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: distribution_center_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: name {
    label: "Distribution Center Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    label: "Distribution Center Count"
    type: count
    drill_fields: [id, name, products.count]
  }
}
