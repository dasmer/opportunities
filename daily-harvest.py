import json

def read_json_dictionary(filename):
    with open(filename) as json_file:
        data = json.load(json_file)
        return data

products_list = read_json_dictionary("engineering-1/data/products.json")["products"]
ingredients_list = read_json_dictionary("engineering-1/data/ingredients.json")["ingredients"]

ingredients_dictionary = {}
for ingredient in ingredients_list:
    ingredient["product_ids"] = []
    ingredients_dictionary[ingredient["id"]] = ingredient

products_dictionary = {}
for product in products_list:
    products_dictionary[product["id"]] = product
    for ingredient_id in product["ingredient_ids"]:
        ingredients_dictionary[ingredient_id]["product_ids"].append(product["id"])

for organic_banana_products_id in ingredients_dictionary[3]["product_ids"]:
    print products_dictionary[organic_banana_products_id]["name"]
