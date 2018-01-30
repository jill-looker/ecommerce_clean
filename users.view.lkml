view: users {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    label: "User ID"
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    group_label: "Addess Information"
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [zip, location]
  }

  dimension: country {
    group_label: "Addess Information"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    drill_fields: [state, city, zip, location]
  }

  dimension_group: created {
    description: "Date in which a user first registered on the website"
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
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

  dimension: location {
    group_label: "Addess Information"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: state {
    group_label: "Addess Information"
    type: string
    sql: ${TABLE}.state ;;
    drill_fields: [city, zip, location]
  }

  dimension: traffic_source {
    description: "The marketing source that brought a user to the website"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    group_label: "Addess Information"
    type: zipcode
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.zip ;;
    drill_fields: [location]
  }

  measure: count {
    label: "User Count"
    type: count
    drill_fields: [first_name, last_name, events.count, order_items.count, order_items.total_sales]
  }
}
