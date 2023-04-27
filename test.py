import unittest
import requests

class TestRoutes(unittest.TestCase):
    
    BASE_URL = "http://localhost:4242"

    def test_root(self):
        response = requests.get(self.BASE_URL + "/")
        self.assertEqual(response.status_code, 200)

    def test_auth_register(self):
        data = {
            "full_name": "John Doe",
            "phone_number": "1234567890",
            "email": "john@example.com",
            "password": "password123"
        }
        response = requests.post(self.BASE_URL + "/auth/register", json=data)
        self.assertEqual(response.status_code, 201)

    def test_auth_login(self):
        data = {
            "email": "john@example.com",
            "password": "password123"
        }
        response = requests.post(self.BASE_URL + "/auth/login", json=data)
        self.assertEqual(response.status_code, 200)

    def test_cart(self):
        response = requests.get(self.BASE_URL + "/cart")
        self.assertEqual(response.status_code, 200)

    def test_products(self):
        response = requests.get(self.BASE_URL + "/products")
        self.assertEqual(response.status_code, 200)

    def test_products_category(self):
        category = "some_category"
        response = requests.get(self.BASE_URL + f"/products/{category}")
        self.assertEqual(response.status_code, 200)

    def test_add_to_cart(self):
        data = {
            "product_id": "some_product_id",
            "quantity": 2
        }
        response = requests.post(self.BASE_URL + "/cart", json=data)
        self.assertEqual(response.status_code, 201)

    def test_modify_cart_item(self):
        item_id = "some_item_id"
        data = {
            "quantity": 3
        }
        response = requests.put(self.BASE_URL + f"/cart/{item_id}", json=data)
        self.assertEqual(response.status_code, 200)

    def test_delete_cart_item(self):
        item_id = "some_item_id"
        response = requests.delete(self.BASE_URL + f"/cart/{item_id}")
        self.assertEqual(response.status_code, 204)

    def test_get_product_by_id(self):
        product_id = "some_product_id"
        response = requests.get(self.BASE_URL + f"/products/{product_id}")
        self.assertEqual(response.status_code, 200)

    def test_general_chat(self):
        response = requests.get(self.BASE_URL + "/chat")
        self.assertEqual(response.status_code, 200)

    def test_individual_chat(self):
        email = "john@example.com"
        response = requests.get(self.BASE_URL + f"/chat/{email}")
        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()
