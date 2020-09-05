*** Settings ***
 Documentation      Este proyecto realiza pruebas automatizadas a la aplicacion de Claims 
 Library            SeleniumLibrary    
 Library            OperatingSystem
 # Test setup run before all the tests cases
 Test Setup         OpenBrowseInPage
 # Test Teardown run after all the tests cases
 Test Teardown      Close Browser

*** Variables ***
 @{BROWSER}         chrome    firefox
 ${URL}             http://claimsfront.herokuapp.com/mx/qa/#/
 &{CREDENTIALS}     user=1019077858    password=Aq123456

*** Test Cases ***
 CheckingLoginPage
   [Documentation]  This is a sample login test
   [Tags]           SmokeTest
   SleepPage
   LoginWithUser
   SleepPage
   LogoutUser    
   FinalLogs  
       
 OtherTest
   [Documentation]  This is the second test case
   [Tags]           Test
   log              Prueba

*** Keywords ***
 OpenBrowseInPage
   Open Browser                 ${URL}    @{BROWSER}[0]
   Set Window Size              1366      768
   Set Window Position          0         0
   Set Browser Implicit Wait    3
  
 LoginWithUser
   Input Text                   id=documentNumber    &{CREDENTIALS}[user]
   Input Password               id=password          &{CREDENTIALS}[password]
   Click Button                 id=btnLoginMovil

 LogoutUser
   Click Button                 id=btn-bl-logout
   
 SleepPage
   Sleep                        5
   
 FinalLogs
   Log                          Test Completed
   Log                          This test was executed by %{username} on %{os}


  
  