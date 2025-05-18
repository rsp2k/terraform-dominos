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
  description = "Street address to find a nearby store."
  type        = string
  default     = "123 Main St"
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

variable "query_string" {
  description = "What kind of pizza to search for on the menu."
  type        = list
  default     = ["Pepperoni", "Olives"]
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

# Construct the address string needed by the data source/resource
locals {
  full_address = "${var.street_address}, ${var.city}, ${var.state} ${var.zip_code}"
  # Format address for the order resource (check provider docs for required structure)
  delivery_address = {
    street = var.street_address
    city   = var.city
    region = var.state
    postal_code = var.zip_code
  }
}
