*** Variables ***
# URL
${BASE_URL}             https://www.saucedemo.com

# Browser
${BROWSER}              headlesschrome

# Timeouts
${WAIT}                 15s

# Test Users
${VALID_USER}           standard_user
${LOCKED_USER}          locked_out_user
${PASSWORD}             secret_sauce
${WRONG_PASSWORD}       wrong_password

# Locators — Login Page
${LOC_USERNAME}         id:user-name
${LOC_PASSWORD}         id:password
${LOC_LOGIN_BTN}        id:login-button
${LOC_ERROR_MSG}        css:[data-test="error"]

# Locators — Products Page
${LOC_PRODUCTS_TITLE}   css:.title
${LOC_SORT_DROPDOWN}    css:[data-test="product-sort-container"]
${LOC_FIRST_PRODUCT}    css:.inventory_item_name:first-of-type

# Locators — Cart
${LOC_CART_ICON}        id:shopping_cart_container
${LOC_CART_BADGE}       css:.shopping_cart_badge
${LOC_ADD_BACKPACK}     id:add-to-cart-sauce-labs-backpack
${LOC_ADD_BIKE_LIGHT}   id:add-to-cart-sauce-labs-bike-light
${LOC_REMOVE_BACKPACK}  id:remove-sauce-labs-backpack
${LOC_CART_ITEM}        css:.cart_item

# Locators — Checkout
${LOC_CHECKOUT_BTN}     id:checkout
${LOC_FIRST_NAME}       id:first-name
${LOC_LAST_NAME}        id:last-name
${LOC_POSTAL_CODE}      id:postal-code
${LOC_CONTINUE_BTN}     id:continue
${LOC_FINISH_BTN}       id:finish
${LOC_COMPLETE_HEADER}  css:.complete-header
