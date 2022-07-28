Feature: Create Account

  Background: generate token for all scenarios
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token

  Scenario: Create new account happy path
    Given path "/api/accounts/add-primary-account"
    And request {"email": "warishotak010@gmail.com","title": "Mr","firstName": "Waris","lastName": "Hotak","gender": "MALE","maritalStatus": "SINGLE","employmentStatus": "employee","dateOfBirth": "2000-04-06"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then print response
    Then status 201
    
    
