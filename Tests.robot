*** Settings ***
Library  SeleniumLibrary

Suite Setup  Open Browser  https://talha-bayansar.github.io/EindOpdracht/#/  FireFox
Suite Teardown  Close Browser

*** Variables ***
${PLAYSTATION4SEEMORE}=  css:#root > div > section > div:nth-child(2) > div:nth-child(1) > div > div > span
${TEXTPRODUCTINFO}=  css:.css-bnrvcj > p
${SHOPPINGCART}=  css:#root > div > div:nth-child(1) > div:nth-child(3) > div
${TEXTEMPTYSHOPPINGCART}=  css:.css-shyhn5 > div > h2
${TEXTSHOPPINGCART}=  css:.css-shyhn5 > div > div > h1
${HOMEPAGE}=  css:#root > div > div:nth-child(1) > a:nth-child(2)
${PLAYSTATION4ADDTOCART}=  css:#root > div > section > div:nth-child(2) > div:nth-child(1) > div > div > button
${LOGIN}=  css:#root > div > div:nth-child(1) > div:nth-child(3) > button
${LOGINTITLE}=  css:.css-up5x7u > h3
${LOGINCLOSE}=  css:.css-up5x7u > button
${ADDPRODUCT}=  css:#root > div > div:nth-child(1) > button
${TEXTADDPRODUCT}=  css:.css-172g5ba > h2

*** Keywords ***
Open Product Info
    Click Element  ${PLAYSTATION4SEEMORE}

Get Product Description
    ${text}=  Get Text  ${TEXTPRODUCTINFO}
    [Return]  ${text}

Open Shopping Cart
    Click Element  ${SHOPPINGCART}

Get Empty Shopping Cart Content
    ${text}=  Get Text  ${TEXTEMPTYSHOPPINGCART}
    [Return]  ${text}

Go To Homepage
    Click Element  ${HOMEPAGE}

Add Product To Cart
    Click Element  ${PLAYSTATION4ADDTOCART}

Get Shopping Cart Content
    ${text}=  Get Text  ${TEXTSHOPPINGCART}
    [Return]  ${text}

Open Login Form
    Click Element  ${LOGIN}

Get Login Form Title
    ${text}=  Get Text  ${LOGINTITLE}
    [Return]  ${text}

Close Login Form
    Click Element  ${LOGINCLOSE}

Open Add Product Form
    Click Element  ${ADDPRODUCT}

Get Add Product Form Title
    ${text}=  Get Text  ${TEXTADDPRODUCT}
    [Return]  ${text}

*** Test Cases ***
Product Info Verification
    Open Product Info
    Sleep  1s
    ${text}=  Get Product Description
    Should Contain  ${text}  Playstation 4 with 500GB storage.

Empty Shopping Cart Verification
    Open Shopping Cart
    ${text}=  Get Empty Shopping Cart Content
    Should Contain  ${text}  Shopping cart is empty.
    Sleep  1s

Shopping Cart With 1 Product Verification
    Go To Homepage
    Sleep  1s
    Add Product To Cart
    Sleep  1s
    Open Shopping Cart
    Sleep  1s
    ${text}=  Get Shopping Cart Content
    Should Contain  ${text}  Playstation 4

Login Screen Verification
    Go To Homepage
    Sleep  1s
    Open Login Form
    Sleep  1s
    ${text}=  Get Login Form Title
    Should Contain  ${text}  Do you have an account?

Add Product Form Verification
    Close Login Form
    Sleep  1s
    Open Add Product Form
    Sleep  1s
    ${text}=  Get Add Product Form Title
    Should Contain  ${text}  Product Info:
