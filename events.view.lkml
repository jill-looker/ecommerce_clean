view: events {
  sql_table_name: public.events ;;

  dimension: id {
    primary_key: yes
    label: "Event ID"
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: browser {
    description: "The type of browser that a user logged in from"
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: city {
    group_label: "Event Location"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "Event Location"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    description: "The date in which a particular web event occurred"
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

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
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
    group_label: "Event Location"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: os {
    label: "Operating System"
    description: "The operating system used by a customer entering the website"
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: sequence_number {
    description: "The sequence number of a particular event for a given user - this can be utilized for tracking user navigation patterns within the website"
    type: number
    sql: ${TABLE}.sequence_number ;;
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: state {
    group_label: "Event Location"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    description: "The marketing source that brought a user to the website"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: uri {
    hidden: yes
    type: string
    sql: ${TABLE}.uri ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip {
    group_label: "Event Location"
    type: zipcode
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    label: "Event Count"
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name]
  }
}
