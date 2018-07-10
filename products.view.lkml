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
    description: "Distinguishes between detailed categories such as jeans, suits, leggings, maternity, etc."
    type: string
    sql: ${TABLE}.category ;;
    drill_fields: [brand, name, sku, id]
  }

  dimension: classification {
    group_label: "Product Hierarchy"
    label: "Product Classification"
    description: "Distinguishes between larger categories such as formal, casual, etc."
    sql: CASE WHEN ${category} = 'Jeans' THEN 'Casual'
              WHEN ${category} = 'Accessories' THEN 'Accessories'
              WHEN ${category} = 'Outerwear & Coats' THEN 'Formal'
              WHEN ${category} = 'Fashion Hoodies & Sweatshirts' THEN 'Casual'
              WHEN ${category} = 'Tops & Tees' THEN 'Casual'
              WHEN ${category} = 'Shorts' THEN 'Casual'
              WHEN ${category} = 'Active' THEN 'Activewear'
              WHEN ${category} = 'Pants' THEN 'Formal'
              WHEN ${category} = 'Sweaters' THEN 'Casual'
              WHEN ${category} = 'Blazers & Jackets' THEN 'Formal'
              WHEN ${category} = 'Dresses' THEN 'Formal'
              WHEN ${category} = 'Suits & Sport Coats' THEN 'Formal'
              WHEN ${category} = 'Swim' THEN 'Activewear'
              WHEN ${category} = 'Sleep & Lounge' THEN 'Underwear & Intimates'
              WHEN ${category} = 'Jumpsuits & Rompers' THEN 'Casual'
              WHEN ${category} = 'Skirts' THEN 'Casual'
              WHEN ${category} = 'Suits' THEN 'Formal'
              WHEN ${category} = 'Clothing Sets' THEN 'Casual'
              WHEN ${category} = 'Pants & Capris' THEN 'Casual'
              WHEN ${category} = 'Intimates' THEN 'Underwear & Intimates'
              WHEN ${category} = 'Underwear' THEN 'Underwear & Intimates'
              WHEN ${category} = 'Leggings' THEN 'Casual'
              WHEN ${category} = 'Plus' THEN 'Casual'
              WHEN ${category} = 'Socks' THEN 'Underwear & Intimates'
              WHEN ${category} = 'Maternity' THEN 'Casual'
              WHEN ${category} = 'Socks & Hosiery' THEN 'Underwear & Intimates'
         ELSE 'Other'
    END ;;
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
