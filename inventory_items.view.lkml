view: inventory_items {
  sql_table_name: public.inventory_items ;;

  dimension: id {
    primary_key: yes
    label: "Inventory Item ID"
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    label: "Cost"
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    description: "The date in which an item was added into inventory"
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

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: product_distribution_center_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }

  dimension: product_sku {
    label: "Product SKU"
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension_group: sold {
    description: "The date in which a product was sold from inventory as part of an order fulfillment"
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    label: "Inventory Item Count"
    type: count
    drill_fields: [id, product_name, products.id, products.name, order_items.count]
  }

  measure: total_cost {
    description: "Total cost of items (cost of goods sold)"
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
    drill_fields: [id, product_name, products.id, products.name, order_items.count]
  }

set: inventory_fields {
  fields: [
  created_year
  ,created_month
  ,created_week
  ,created_date
  ,created_time
  ,sold_year
  ,sold_month
  ,sold_week
  ,sold_date
  ,sold_time
  ,count
  ,total_cost
  ]
}

set: product_fields {
  fields: [
     product_brand
    ,product_category
    ,product_department
    ,product_distribution_center_id
    ,product_id
    ,product_name
    ,product_sku
    ,product_retail_price
  ]
}

}
