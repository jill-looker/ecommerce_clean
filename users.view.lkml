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

  dimension: age_tier {
    type: tier
    tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    style: integer
    sql: ${age} ;;
  }

  dimension: city {
    group_label: "Address Information"
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [zip, location]
  }

  dimension: country {
    group_label: "Address Information"
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
    group_label: "Address Information"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: state {
    group_label: "Address Information"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
    drill_fields: [city, zip, location]
    link: {
      label: "Business Overview By State Dashboard"
      url: "https://trainembed.corp.looker.com/embed/dashboards/1?State={{ value | url_encode }}"
    }
  }

  dimension: traffic_source {
    description: "The marketing source that brought a user to the website"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    group_label: "Address Information"
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
