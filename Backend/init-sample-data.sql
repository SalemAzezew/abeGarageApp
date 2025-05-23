-- ✅ Insert Customer Identifier FIRST
INSERT INTO customer_identifier (customer_id, customer_email, customer_phone_number, customer_hash)
VALUES (1, 'john@example.com', '1234567890', 'cust-abc123');

-- ✅ Now Insert Customer Info (foreign key depends on line above)
INSERT INTO customer_info (customer_id, customer_first_name, customer_last_name, active_customer_status)
VALUES (1, 'John', 'Doe', 1);


-- ✅ Insert Vehicle
INSERT INTO customer_vehicle_info (
  vehicle_id, customer_id, vehicle_year, vehicle_make, vehicle_model, vehicle_type,
  vehicle_mileage, vehicle_tag, vehicle_serial, vehicle_color
)
VALUES (1, 1, 2020, 'Toyota', 'Camry', 'Sedan', 50000, 'ABC123', 'SN00112233', 'Silver');

-- ✅ Insert Mechanic (Employee)
-- Insert into `employee` first (the parent)
INSERT INTO employee (employee_id, employee_email, active_employee)
VALUES (1, 'mechanic@example.com', 1);

-- Then insert into `employee_info` (the child)
INSERT INTO employee_info (employee_info_id, employee_id, employee_first_name, employee_last_name, employee_phone)
VALUES (1, 1, 'Mekdes', 'Tech', '555-1234');


-- ✅ Insert Order
INSERT INTO orders (order_id, employee_id, customer_id, vehicle_id, active_order, order_hash)
VALUES (1, 1, 1, 1, 1, 'order-xyz123');

-- ✅ Insert Common Services
INSERT INTO common_services (service_id, service_name, service_description)
VALUES 
  (1, 'Oil Change', 'Full synthetic oil change'),
  (2, 'Brake Inspection', 'Inspect and adjust brake system');

-- ✅ Link Services to Order
INSERT INTO order_services (order_service_id, order_id, service_id, service_completed)
VALUES 
  (1, 1, 1, 0),
  (2, 1, 2, 0);

-- ✅ Insert Order Status
INSERT INTO order_status (order_status_id, order_id, order_status)
VALUES (1, 1, 2);  -- status: 2 = In Progress
