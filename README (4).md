# Saucedemo Automation

UI test automation project for [saucedemo.com](https://www.saucedemo.com) built with Robot Framework and Python.

I built this to practice real automation skills — not just tutorials, but an actual working test suite with CI/CD and a live report.

## What's Being Tested

- **Login** — valid login, wrong password, locked out user
- **Cart** — add one item, add two items, remove item
- **Checkout** — full end-to-end flow from cart to order confirmation
- **Products** — page loads correctly, sorting works

12 test cases total across 3 test suites.

## Tech Stack

- Robot Framework
- SeleniumLibrary
- Python
- GitHub Actions (CI/CD)
- Headless Chrome

## Project Structure

```
Tests/
    cart_tests.robot
    login_tests.robot
    product_tests.robot
Resources/
    pages/
        login_page.resource
        products_page.resource
        cart_page.resource
        checkout_page.resource
    keywords.resource
    variables.resource
```

Tests are organized using Page Object Model — each page has its own resource file with its own keywords.

## Live Test Report

Tests run automatically on every push to main.

👉 [View Latest Report](https://hwilltester.github.io/saucedemo-automation/report.html)

## Run Locally

```bash
pip install robotframework
pip install robotframework-seleniumlibrary

robot Tests/
```

## Author

Htuu Will Oo — QA Engineer with 7+ years in banking and fintech.  
[LinkedIn](https://www.linkedin.com/in/htuuwill/) · [GitHub](https://github.com/hwilltester)
