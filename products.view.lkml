view: products {
  sql_table_name: public.products ;;

  dimension: id {
    primary_key: yes
    label: "Product ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    group_label: "Product Hierarchy"
    type: string
    sql: ${TABLE}.brand ;;
    drill_fields: [name, sku, id]
    link: {
      label: "Google Search"
      url: "https://www.google.com/search?q={{value}}"
    }
  }

  dimension: category {
    group_label: "Product Hierarchy"
    label: "Product Category"
    type: string
    sql: ${TABLE}.category ;;
    drill_fields: [brand, name, sku, id]
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    group_label: "Product Hierarchy"
    type: string
    sql: ${TABLE}.department ;;
    drill_fields: [category, brand, name, sku, id]
  }

  dimension: distribution_center_id {
    hidden: yes
    type: number
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    group_label: "Product Hierarchy"
    label: "Product Name"
    type: string
    sql: ${TABLE}.name ;;
    drill_fields: [sku, id]
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    group_label: "Product Hierarchy"
    label: "SKU"
    type: string
    sql: ${TABLE}.sku ;;
    drill_fields: [name, id]
  }

  measure: count {
    label: "Product Count"
    type: count
    drill_fields: [name, distribution_centers.name, inventory_items.count, order_items.count]
  }
}
