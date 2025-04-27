variable "first_name" {
  description = "First name for the test order."
  type        = string
  default     = "Demo"
}

variable "last_name" {
  description = "Last name for the test order."
  type        = string
  default     = "Star"
}

variable "email" {
  description = "Email address for the test order (use a fake one)."
  type        = string
  default     = "demo.star@example.com"
  # Optional validation for basic email format if needed
}

variable "phone" {
  description = "Phone number for the test order (use a fake one)."
  type        = string
  default     = "555-867-5309" # Jenny's number :)
}

variable "street_address" {
  description = "Street address to find a nearby test store."
  type        = string
  default     = "123 Main St" # Use an address likely recognized by the test API or a generic one
}

variable "city" {
  description = "City for the address."
  type        = string
  default     = "Anytown"
}

variable "state" {
  description = "State abbreviation (e.g., CA, NY)."
  type        = string
  default     = "CA"
}

variable "zip_code" {
  description = "Zip code for the address."
  type        = string
  default     = "90210"
}

variable "pizza_type_query" {
  description = "What kind of pizza to search for on the menu (e.g., 'Pepperoni Pizza', 'Cheese Pizza')."
  type        = string
  default     = "Pepperoni Pizza" # A common item likely on test menus
}

variable "quantity" {
  description = "How many pizzas to order?"
  type        = number
  default     = 1
  validation {
    condition     = var.quantity > 0
    error_message = "Quantity must be at least 1."
  }
}

variable "order_type" {
  description = "Type of order: Delivery or Carryout."
  type        = string
  default     = "Delivery"
  validation {
    condition     = contains(["Delivery", "Carryout"], var.order_type)
    error_message = "Order type must be either 'Delivery' or 'Carryout'."
  }
}
