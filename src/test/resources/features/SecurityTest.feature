@Smoke
Feature: Security test. Token Generation Test.
@FirstTest
Scenario: Generation token
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response
@SecondTest
Scenario:  Test API Endpoint with Invalid Username and valid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor1","password": "tek_supervisor"}
When method post
Then status 404
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "USER_NOT_FOUND"
@ThirdTest
Scenario: Test API Endpoint with valid Username and Invalid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor1"}
When method post 
Then status 400
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "Password Not Matched"