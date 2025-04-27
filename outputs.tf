output "order_status" {
  description = "The status reported by the Dominos Test API for the order."
  value       = dominos_order.pizza_order.status # Check provider docs for the exact attribute name
}

output "order_id" {
  description = "The Order ID returned by the Test API (if available)."
  value       = dominos_order.pizza_order.id # Or order_id, etc.
}

output "store_id_used" {
  description = "The ID of the Dominos store selected for the order."
  value       = data.dominos_store.nearby.store_id
}

output "store_address_used" {
  description = "The address of the Dominos store selected."
  value       = data.dominos_store.nearby.address_line # Or similar attribute
}

output "item_ordered_code" {
  description = "The product code of the pizza found and ordered."
  value       = data.dominos_menu_item.pizza.code
}

output "item_ordered_name" {
  description = "The name of the pizza found and ordered."
  value       = data.dominos_menu_item.pizza.name
}

output "estimated_price" {
  description = "The estimated price returned by the Test API (may be $0.00 or inaccurate)."
  # Check provider docs for price attribute on dominos_order resource
  value = dominos_order.pizza_order.amounts.customer # Example path, check docs
}

output "confirmation_message" {
  description = "A summary confirmation message."
  value       = "Test order placed for ${var.quantity} x '${data.dominos_menu_item.pizza.name}' from store ${data.dominos_store.nearby.store_id}. Status: ${dominos_order.pizza_order.status}."
}

output "full_order_details" {
  description = "The full order object returned by the provider."
  value       = dominos_order.pizza_order
  sensitive   = true # May contain PII even if fake
}
