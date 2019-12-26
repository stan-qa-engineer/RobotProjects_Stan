*** Settings ***
Library    RequestsLibrary    

*** Variables ***
${Base_URL}    http://thetestingworldapi.com/

*** Test Cases ***
Get_Request_Test
    Create Session    Get_Students_Details    ${Base_URL}    
    ${response}    Get Request    Get_Students_Details    api/studentsDetails    
    Log To Console    ${response.status_code}  
    Log  Test Completed