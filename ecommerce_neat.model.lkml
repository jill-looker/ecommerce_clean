connection: "events_ecommerce"

# include all the views
include: "*.view"

label: "eCommerce"

explore: distribution_centers {
  hidden: yes
}

explore: events {
  group_label: "Web Traffic"
  label: "Website Events"
  description: "Information about visits to the website, including how visitors found us, their browser and operating system, location, etc."
  view_label: "Website Events"
  join: users {
    view_label: "Customers"
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  group_label: "Sales"
  label: "Inventory"
  description: "Information about product availability in inventory and inventory movement across all distribution centers."
  view_label: "Inventory"
  fields: [ALL_FIELDS*, -inventory_items.product_fields*]
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    view_label: "Inventory"
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  group_label: "Sales"
  label: "Orders and Revenue"
  description: "Information about orders, including the revenue from all items ordered, the customers who purchased them, and distribution center of origin"
  join: users {
    view_label: "Customers"
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    fields: [inventory_items.inventory_fields*]
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    view_label: "Inventory Items"
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  hidden: yes
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

map_layer: regions {
  file: "map.topojson"
}

explore: users {
  hidden: yes
  }
