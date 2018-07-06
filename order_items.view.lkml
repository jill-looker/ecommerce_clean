view: order_items {
  sql_table_name: public.order_items ;;

  dimension: id {
    primary_key: yes
    label: "Order Item ID"
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    description: "The date in which an order was first created by a customer"
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

  dimension_group: delivered {
    description: "The date in which an item was delivered to a customer - some orders may have multiple delivery dates if items arrived in multiple shipments"
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
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: delivery_time {
    description: "The number of days between the order creation date and the order delivery date"
    type: number
    sql: DATEDIFF( day, ${created_raw}, ${delivered_raw}) ;;
  }

  dimension: inventory_item_id {
    hidden: yes
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    description: "The identification number associated with any order that is placed"
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    description: "The date in which an item is returned by a customer - items that are not returned will have a NULL returned date"
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    hidden: yes
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    description: "The date in which an item leaves a distribution center to be shipped to a customer - some orders may have multiple shipment dates if items need to be shipped separately or are shipping from different distribution centers"
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
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    label: "Order Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    description: "A unique identification number for an individual customer"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    label: "Order Item Count"
    type: count
    drill_fields: [detail*]
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
    drill_fields: [detail*]
  }

  measure: order_count_formatted {
    label: "Order Count"
    hidden: yes
    type: count_distinct
    sql: ${order_id} ;;
    drill_fields: [detail*]
    html:
   {% if value > 100 %}
      <font color="darkgreen">{{ rendered_value }}</font>
    {% elsif value > 50 %}
      <font color="goldenrod">{{ rendered_value }}</font>
    {% else %}
      <font color="darkred">{{ rendered_value }}</font>
    {% endif %} ;;

}

  measure: total_sales {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
    drill_fields: [detail*]
    link: {
      label: "Inventory Items Explore"
      url: "explore/ecommerce_neat/order_items"
      icon_url: "http://www.looker.com/favicon.ico"
      }
  }

  measure: average_sales {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      order_id,
      created_date,
      users.first_name,
      users.last_name,
      count,
      total_sales
    ]
  }
}
