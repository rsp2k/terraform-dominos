output "OrderOutput" {
  value = data.dominos_menu_item.item.matches[*]
}
