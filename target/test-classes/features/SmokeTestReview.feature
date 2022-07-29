@SmokeTest
Feature: Authentication Smoke Test
Scenario: Generate token with Valid user name and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post 
Then status 200
And print response.token
Scenario: Generate token with Invaid user name and Valid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "1supervisor","password": "tek_supervisor"}
When method post
Then status 404
And print response
* def errorMessage = response.errorMessage
And assert response.errorMessage == "USER_NOT_FOUND"
