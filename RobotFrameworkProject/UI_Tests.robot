*** Settings ***
Library    SeleniumLibrary

Suite Setup    Set Browser
Suite Teardown    Close Browser
Test Teardown    Log    This test was completed by %{username} on %{os}

*** Test Cases ***
PositiveLoginTest
    [Documentation]    This is a positive login test    
    [Tags]    positive
    Login To App
    Wait Until Element Is Visible    id=companyLogoHeader    
    Click Element     link=Logout
    
NegativeLoginTest
    [Documentation]    This is a negative login test    
    [Tags]    negative
    Click Button      id=btnLogin
    Wait Until Element Is Visible    id=spanMessage                 
    Page Should Contain    Username cannot be empty    

*** Variables ***
${URL}    https://s2.demo.opensourcecms.com/orangehrm/symfony/web/index.php/auth/login
@{CREDENTIALS}    opensourcecms    opensourcecms
&{LOGINDATA}    username=opensourcecms    password=opensourcecms

*** Keywords ***
Set Browser
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

Login To App
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button      id=btnLogin