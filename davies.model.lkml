connection: "looker-private-demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

# Select the views that should be a part of this model,
# and define the joins that connect them together.

explore: order_items {
  join: orders {
    relationship: many_to_one
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: users {
    relationship: many_to_one
    sql_on: ${users.id} = ${orders.user_id} ;;
  }

  join: inventory_items {
    relationship: one_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
  }
}
