# Introduction

Thank you for your interest in Daily Harvest! As the next step in our interview process, please spend 30-60 minutes completing the attached coding exercise. This is a simplified instance of the sort of functionality that we build for Daily Harvest customers. We will build off of your solution to this exercise in the on-site interview.

This is not intended to be a time-consuming process. We expect that most candidates will be able to complete it within an hour. Enjoy!

# Challenge

At Daily Harvest, we want to make it as easy as possible for our customers to get healthy food that they enjoy. One way to do this is to allow people to search for products that contain a favorite ingredient (apples, kale, cinnamon, etc.).

We have provided two files that define products and ingredients in JSON format:


[`products.json`](data/products.json)

[`ingredients.json`](data/ingredients.json)

In a language of your choice (Python and JavaScript preferred, but any modern language that will run under OSX or Linux will be accepted), please write a program that returns all of the products (defined in `products.json`) that contain the ingredient “Organic Banana” (defined in `ingredients.json`).

With your solution, please include any instructions for configuring and running your program.

# Workflow

1. Fork this repository to your account.

2. Write your program according to the [#Challenge](#challenge) instructions above in the `engineering-1` directory.

3. Add your instructions for config and running your program in the [#Instructions](#instructions) section below.

4. Commit and push your changes to your forked repository.

5. Share the URL to the repository with your solution with us.

# Notes

* Do not modify the `json` files in the `data` directory.
* Keep your code as clean and readable as possible.
* Bonus points for organization and documentation.
* Bonus points for tests.

# Instructions

1. See the demo video in this directory at [`Daily-Harvest_App_Screen_Recording.mov`](Daily-Harvest_App_Screen_Recording.mov)
2. Open "Daily Harvest.xcodeproj" in the iPhone-App directory with Xcode 10.2.1 (Most Recent Stable Version) on a Mac OS
3. Type CMD+R to run app in iOS Simulator
4. On iOS Simulator, click "Ingredients Filters (0)"
5. Click "Organic Bananas"
6. Click "Done"
7. Go Back to Xcode, and type CMD+U to run unit tests
