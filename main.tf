provider "dominos" {
}

# Construct the address string needed by the data source/resource
locals {
  full_address = "${var.street_address}, ${var.city}, ${var.state} ${var.zip_code}"
  # Format address for the order resource (check provider docs for required structure)
  delivery_address = {
    street = var.street_address
    city   = var.city
    region = var.state # 'region' might be the field name instead of 'state'
    postal_code = var.zip_code
    type   = "House" # Or "Apartment", "Business", etc. Check provider docs.
  }
}

# 1. Find a nearby store using the provided address
data "dominos_store" "nearby" {
  address_line = local.full_address
  type         = var.order_type # Find stores supporting Delivery or Carryout
}

# 2. Find the specific pizza menu item at that store
data "dominos_menu_item" "pizza" {
  store_id = data.dominos_store.nearby.store_id
  name     = var.pizza_type_query # Search using the input query
}

# 3. Place the (test) order
resource "dominos_order" "pizza_order" {
  store_id = data.dominos_store.nearby.store_id

  first_name = var.first_name
  last_name  = var.last_name
  email      = var.email
  phone      = var.phone

  # Address structure might differ based on provider version/schema
  delivery_address = local.delivery_address

  # Order items structure (check provider docs)
  # Usually a list of objects with code and quantity
  order_items = [
    {
      code     = data.dominos_menu_item.pizza.code
      quantity = var.quantity
      # options = {} # Add if customization is needed/possible
    }
    # Add more items here if desired (e.g., drinks, sides)
    # Might need more data sources or hardcoded codes for simplicity
  ]

  service_method = var.order_type # Delivery or Carryout

  # Payment details are typically omitted or mocked for test API
  # Check provider docs if any dummy payment info is needed
}
