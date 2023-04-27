
;;;; Load necessary libraries
(ql:quickload '(:hunchentoot :restas :postmodern :ironclad :cl-bcrypt :cl-smtp))
(restas:define-module #:restas.hello-world
  (:use #:cl))
(in-package #:restas.hello-world)

;; DATA STRUCTURES
(defstruct product
  description
  category
  photo
  price
  quantity-selector)

(defstruct user
  full-name
  phone-number
  email
  password)

(defstruct item
  product
  quantity)

(defstruct cart
  items)

(defstruct chat
  messages)

;; IN-MEMORY DATABASE
(defvar *users* (make-hash-table :test #'equal))
(defvar *products* (make-hash-table :test #'equal))
(defvar *carts* (make-hash-table :test #'equal))
(defvar *chats* (make-hash-table :test #'equal))

;; Load a bunch of products into the database
(setf (gethash "1" *products*)
      (make-product :description "A nice product"
		    :category "Category 1"
		    :photo "https://www.example.com/photo.jpg"
		    :price 100
		    :quantity-selector 1))
(setf (gethash "2" *products*)
      (make-product :description "Another nice product"
		    :category "Category 2"
		    :photo "https://www.example.com/photo2.jpg"
		    :price 200
		    :quantity-selector 1))
(setf (gethash "3" *products*)
      (make-product :description "A third nice product"
		    :category "Category 1"
		    :photo "https://www.example.com/photo3.jpg"
		    :price 300
		    :quantity-selector 1))

;; Helper function
(defun hash-table-to-string (hash-table)
  (with-output-to-string (s)
    (loop for key being the hash-keys of hash-table
	  using (hash-value value)
	  do (format s "~a: ~a~%" key value))))

;; GET /: Display a menu to enter the system with email and password, and allow new user registration.
(restas:define-route main ("")
  "<h1>Hello world!</h1>")

;; POST /auth/register: Register a new user with their full name, phone number, email, and password.
;; POST /auth/login: Authenticate a user with email and password.

;; POST /cart: Add items to the shopping cart.
;; PUT /cart/:id: Modify an item in the shopping cart by its ID.
;; DELETE /cart/:id: Delete an item from the shopping cart by its ID.
;; GET /cart: List the items in the shopping cart.

;; GET /products: Return the list of all products available for purchase. Format: (:description :category :photo :price :quantity-selector)
(restas:define-route products ("products")
  (hash-table-to-string *products*))
;; GET /products/:category: Return products by the specified category.
;; GET /products/:id: Return a specific product with its description, photo, price, and quantity selector.

;; GET /chat: Display the general chat channel for users.
;; GET /chat/:email: Display a user's individual chat channel.

(restas:start '#:restas.hello-world :port 4242)
