-- 1. Create the items table
CREATE TABLE IF NOT EXISTS items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    quantity INT DEFAULT 0
);

-- 2. Create the orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT NOT NULL,
    order_quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

CREATE TRIGGER update_item_quantity_after_order
AFTER INSERTON ON orders
FOR EACH ROW
BEGIN
	UPDATE items
	SET quantity = quantity - NEW.order_quantity
	WHERE item_id = NEW.item_id;
END //


DELIMITER ;
