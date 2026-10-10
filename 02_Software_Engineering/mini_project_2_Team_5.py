cName = input("Enter your name: ")

while len(cName) <1 or len(cName) > 50 or cName.isspace() or cName.isalpha() ==False:
    print("Invalid name. Please enter a valid name (1-50 characters and must contain letters).")
    cName = input("Enter your name: ") 

cAddress = input("Enter your address: ")

while len(cAddress) <1 or len(cAddress) > 50 or cAddress.isspace() or cAddress.isalnum() ==False:
    print("Invalid address. Please enter a valid address (1-50 characters ")
    cAddress = input("Enter your address: ")

pNumber = input("Enter your phone number: ")
while len(pNumber) <1 or len(pNumber) > 20 or pNumber.isspace() or pNumber.isdigit() ==False:
    print("Invalid phone number. Please enter a valid phone number (1-50 characters and must contain digits).")
    pNumber = input("Enter your phone number: ")

#Using try and expect to handle error incase of invaild input to prevent crashing
while True:
    try:
        qtyPizza = int(input("Enter the quantity of pizzas (1-6): "))
        if qtyPizza < 1 or qtyPizza > 6:
            print("Invalid quantity. Please enter a number between 1 and 6.")
        break
    except ValueError:
        print("Invalid input. Please enter a valid number.")

sizePizza = []
qtyTopping = []


for i in range(0,qtyPizza):
    sizeRequest = input(f"Enter the size of pizza {i+1} (small, medium, large): ").lower()
    while sizeRequest not in ["small", "medium", "large"]:
        print("Invalid size. Please enter 'small', 'medium', or 'large'.")
        sizeRequest = input(f"Enter the size of pizza {i+1} (small, medium, large): ").lower()
    sizePizza.append(sizeRequest)

    
    toppingRequest = input(f"Enter the quantity of toppings for pizza {i+1} Min: 0: ")
    while not toppingRequest.isdigit() or int(toppingRequest) < 0:
        print("Invalid quantity. Please enter a non-negative number.")
        toppingRequest = input(f"Enter the quantity of toppings for pizza {i+1} Min: 0: ")
    if int(toppingRequest )>4: 
        toppingRequest =4 
    qtyTopping.append(int(toppingRequest))

delivery= input("Do you want the pizza to be delivered? (yes/no): ").lower()
while delivery not in ["yes", "no"]:
    print("Invalid input. Please enter 'yes' or 'no'.")
    delivery = input("Do you want the pizza to be delivered? (yes/no): ").lower()

subTotal = 0 

print(f"Customer Name: {cName}  \n Customer Address: {cAddress}  \n Customer Phone Number: {pNumber}  \n ")

for j in range(0,qtyPizza):
    if sizePizza[j] =="small":
        print(f"Pizza {j+1}: Size Small £3.25")
        subTotal +=3.25
    if sizePizza[j] =="medium":
        print(f"Pizza {j+1}: Size Medium £5.50")
        subTotal +=5.50
    if sizePizza[j] =="large":
        print(f"Pizza {j+1}: Size Large £7.15")
        subTotal +=7.15
    if qtyTopping[j] == 1:
        print(f"Pizza {j+1}: {qtyTopping[j]} Toppings £0.75")
        subTotal += 0.75
    if qtyTopping[j] == 2:
        print(f"Pizza {j+1}: {qtyTopping[j]} Toppings £1.35")
        subTotal += 1.35
    if qtyTopping[j] == 3:
        print(f"Pizza {j+1}: {qtyTopping[j]} Toppings £2.00")
        subTotal += 2.00
    if qtyTopping[j] == 4:
        print(f"Pizza {j+1}: {qtyTopping[j]} Toppings £2.50")
        subTotal += 2.50

print(f"Subtotal: £{subTotal:.2f}")

if subTotal > 20:
    print(f"Discount applied: £{subTotal * 0.10:.2f}")
    subTotal -= subTotal * 0.10

if delivery == "yes":
    print(f"Delivery Fee: £ 2.50")
    subTotal += 2.50

print(f"Total £{subTotal:.2f}")


