# 🍕 Terraform Dominos Test Order Demo for Demostar.io 🚀

[![Terraform Version](https://img.shields.io/badge/Terraform-%3E%3D%201.0-blueviolet)](https://www.terraform.io)
[![Provider](https://img.shields.io/badge/Provider-Dominos%20(ncr--devops--platform)-orange)](https://registry.terraform.io/providers/ncr-devops-platform/dominos/latest)
[![Demostar Ready](https://img.shields.io/badge/Demostar-Recipe%20Ready-brightgreen)](https://demostar.io)

Simulate ordering a pizza using Terraform and the [Dominos Provider](https://registry.terraform.io/providers/ncr-devops-platform/dominos/latest) configured against their **Test API**. This workspace is designed as a recipe for [Demostar.io](https://demostar.io), allowing users to "order" this Terraform configuration with customizable inputs.

---

## 🚨 IMPORTANT: TEST ENVIRONMENT ONLY 🚨

*   ✅ This configuration **strictly** uses the **Dominos Test API**.
*   ❌ **NO REAL PIZZA** will be ordered.
*   ❌ **NO REAL CHARGES** will be incurred.
*   ❌ **DO NOT USE REAL** personal information (name, email, phone) or payment details. Use fake/test data for all inputs.
*   ⚠️ The Test API's behavior, available stores, and menu items may differ from the real Dominos system and can change without notice.

---

## ✨ What it Demonstrates

This Demostar recipe showcases several Terraform concepts in a fun, relatable way:

*   **Provider Configuration:** Explicitly setting the provider to use a non-production endpoint (`test_api = true`).
*   **Data Sources:** Finding information dynamically (`dominos_store`, `dominos_menu_item`).
*   **Resource Management:** Creating a resource that represents an action (`dominos_order`).
*   **Input Variables:** Parameterizing the order (address, contact info, item choice).
*   **Output Values:** Displaying the results of the Terraform run (order status, store details).
*   **Dependencies:** Implicitly showing how resources depend on data sources.
*   **Local Values:** Constructing derived values (`locals`).

## 🤔 How it Works

When this Terraform configuration is applied (either locally or via Demostar):

1.  **Configure Provider:** Sets up the Dominos provider to point to the **Test API**.
2.  **Find Store:** Uses the provided address (`street_address`, `city`, `state`, `zip_code`) and `order_type` (Delivery/Carryout) to query the Test API for a suitable nearby store ID via the `dominos_store` data source.
3.  **Find Menu Item:** Queries the menu of the found store ID for an item matching the `pizza_type_query` using the `dominos_menu_item` data source to get its product code.
4.  **Place Test Order:** Creates a `dominos_order` resource, sending the store ID, fake customer details, delivery address, and the found pizza product code (with quantity) to the Test API.
5.  **Output Results:** Exports details like the (test) order ID, status, store information, and item details.

## 🚀 Using with Demostar.io

This workspace is designed to be parsed by Demostar into an orderable recipe.

### 📝 Inputs (Customizable Recipe Options)

When ordering this recipe on Demostar, you can customize the following inputs:

| Variable           | Description                                       | Default Value             | Allow User Input | Display | Notes                                      |
| :----------------- | :------------------------------------------------ | :------------------------ | :--------------- | :------ | :----------------------------------------- |
| `first_name`       | First name for the test order.                    | `Demo`                    | Yes              | Yes     | **Use fake data!**                         |
| `last_name`        | Last name for the test order.                     | `Star`                    | Yes              | Yes     | **Use fake data!**                         |
| `email`            | Email address for the test order.                 | `demo.star@example.com`   | Yes              | Yes     | **Use a fake email!**                      |
| `phone`            | Phone number for the test order.                  | `555-867-5309`            | Yes              | Yes     | **Use a fake phone number!**               |
| `street_address`   | Street address to find a nearby test store.       | `123 Main St`             | Yes              | Yes     | Test API might need recognizable formats |
| `city`             | City for the address.                             | `Anytown`                 | Yes              | Yes     |                                            |
| `state`            | State abbreviation (e.g., CA, NY).                | `CA`                      | Yes              | Yes     |                                            |
| `zip_code`         | Zip code for the address.                         | `90210`                   | Yes              | Yes     |                                            |
| `pizza_type_query` | What kind of pizza to search for (e.g., 'Cheese Pizza'). | `Pepperoni Pizza`         | Yes              | Yes     | Must exist on the test store's menu      |
| `quantity`         | How many pizzas to order?                         | `1`                       | Yes              | Yes     | Must be > 0                              |
| `order_type`       | `Delivery` or `Carryout`                          | `Delivery`                | Yes              | Yes     | Affects store search                     |

### ✨ Outputs (Recipe Results)

After the Terraform run completes via Demostar, the following outputs will be displayed:

| Output                   | Description                                                              | Display |
| :----------------------- | :----------------------------------------------------------------------- | :------ |
| `confirmation_message`   | A summary confirmation message of the test order placed.                 | Yes     |
| `order_status`           | The status reported by the Dominos Test API for the order.               | Yes     |
| `order_id`               | The Order ID returned by the Test API (if available).                    | Yes     |
| `estimated_price`        | The estimated price from the Test API (often $0.00 or inaccurate).       | Yes     |
| `store_id_used`          | The ID of the Dominos store selected for the order.                      | Yes     |
| `store_address_used`     | The address of the Dominos store selected.                               | Yes     |
| `item_ordered_name`      | The name of the pizza found and ordered based on your query.             | Yes     |
| `item_ordered_code`      | The product code of the pizza found and ordered.                         | Maybe   |

##  Terraform Concepts Illustrated

*   `provider` block (with configuration arguments)
*   `data "dominos_store"`
*   `data "dominos_menu_item"`
*   `resource "dominos_order"`
*   `variable` blocks (with `type`, `description`, `default`, `validation`)
*   `output` blocks
*   `locals` block
*   Implicit Resource Dependencies
*   String Interpolation

## ⚙️ Local Development / Testing (Optional)

While designed for Demostar, you can run this locally:

1.  Ensure you have Terraform v1.0+ installed.
2.  Clone this repository (or copy the `.tf` files).
3.  Run `terraform init` to download the Dominos provider.
4.  (Optional) Create a `terraform.tfvars` file or use `-var` flags to override default input variables.
5.  Run `terraform plan` to preview the actions.
6.  Run `terraform apply` to execute against the **Test API**.
7.  Run `terraform destroy` when finished.

---

*Disclaimer: This is a demonstration project. The Dominos provider is maintained by the community, and the Dominos Test API is subject to change.*
