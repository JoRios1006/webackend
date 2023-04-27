# Project: E-commerce Platform

This project is an e-commerce platform with the following requirements:

## Features

-   Provide necessary routes for listing existing products, entering new products, deleting and modifying product details, and interacting with the shopping cart.
-   Implement a RESTful API with GET, POST, PUT, and DELETE verbs for all necessary actions.
-   Implement an authorized login mechanism based on JWT (JSON Web Token).
-   Store entered products in a database.
-   Allow users to register with email and password, which are encrypted and stored in the database.
-   Implement an active user session with a configurable expiration time.
-   Implement a chat channel based on WebSockets for customer queries.
-   Load configurations from an external file.
-   Send an email for each new user registration and purchase order generated.
-   Display error messages containing the ID and full details when an error is detected.

## Routes

-   `GET /`: Display a menu to enter the system with email and password, and allow new user registration.
-   `POST /auth/register`: Register a new user with their full name, phone number, email, and password.
-   `POST /auth/login`: Authenticate a user with email and password.
-   `GET /cart`: List the items in the shopping cart.
-   `GET /products`: Return the list of all products available for purchase.
-   `GET /products/:category`: Return products by the specified category.
-   `POST /cart`: Add items to the shopping cart.
-   `PUT /cart/:id`: Modify an item in the shopping cart by its ID.
-   `DELETE /cart/:id`: Delete an item from the shopping cart by its ID.
-   `GET /products/:id`: Return a specific product with its description, photo, price, and quantity selector.
-   `GET /chat`: Display the general chat channel for users.
-   `GET /chat/:email`: Display a user's individual chat channel.

## Database Collections

-   `users`: Registered customers.
-   `products`: Complete catalog of products, including photo link, unit price, description, and category.
-   `messages`: User chat (questions and answers), including email, type, date and time, and message body.
-   `cart`: Temporary purchase orders, including email, date and time, items with their quantities, and delivery address.
-   `orders`: Generated orders, including items, descriptions, prices at the time of purchase, order number, date and time, status, and email of the person who made the order.

## Additional Requirements

-   If a product does not exist in MongoDB, return a message indicating the product does not exist.
-   Once an order is completed, send an email to the specified address with the order details.
-   Use an external configuration file with options for development and production, which will be displayed through a Handlebars view. Include configuration parameters such as the server listening port, database URL, notification email, session expiration time, and any other necessary parameters.
-   Implement a general chat channel where users can send messages in the `/chat` route and view their own messages in the `/chat/:email` route. Use WebSockets for communication and the `messages` collection in the database. Implement a Handlebars view to display all messages and allow individual responses, choosing the reply email.
