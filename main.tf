provider "dominos" {
  first_name    = var.first_name
  last_name     = var.last_name
  email_address = var.email
  phone_number  = var.phone

  credit_card = {
    number      = 123456789101112
    cvv         = 1314
    date        = "15/16"
    postal_code = "18192"
  }
}

data "dominos_address" "addr" {
  street      = var.street
  city        = var.city
  region      = var.state
  postal_code = var.postal_code
}

data "dominos_store" "store" {
  address_url_object = data.dominos_address.addr.url_object
}

data "dominos_menu_item" "item" {
  store_id     = data.dominos_store.store.store_id
  query_string = var.query_string
}

resource "dominos_order" "order" {
  api_object = data.dominos_address.addr.api_object
  item_codes = data.dominos_menu_item.item.matches[*].code
  store_id   = data.dominos_store.store.store_id
}
