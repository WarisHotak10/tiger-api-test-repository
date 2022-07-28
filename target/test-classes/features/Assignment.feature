# 2)Test API endpoint "/api/accounts/add-primary-account" to add new Account with Existing email address.
      # Then status code should be 400 – Bad Request ,  validate response
      Feature: Create account
      Background: generate token for all scenarios
      Given url "https://tek-insurance-api.azurewebsites.net"
      And path "/api/token"
      And request {"username": "supervisor","password": "tek_supervisor"}
      When method post 
      Then status 200
      * def generatedToken = response.token
      Scenario: Add new Account with Existing email address 
      Given path "/api/accounts/add-primary-account"
      And request {"email": "warishotak30@tekschool.com","title": "Mr","firstName": "waris","lastName": "hotak","gender": "MALE","maritalStatus": "SINGLE","employmentStatus": "employee","dateOfBirth": "2000-04-06"}
      And header Authorization = "Bearer " + generatedToken
      When method post
      Then status 400
      Then print response
        # 3)Test API endpoint "/api/accounts/add-account-car" to add car to existing account.
      # Then status code should be 201 – Create ,  validate response
      Scenario: Add car to existing account
      Given path "api/accounts/add-account-car"
      And param primaryPersonId = "34"
      And request = {"make": "CHEVROLET","model": "CRUZE","year": "2012","licensePlate": "WHS1010"}
      And header Authorization = "Bearer " + generatedToken
      When method post
      Then status 201
      Then print response
       # 4)Test API endpoint "/api/accounts/add-account-phone" to add Phone number to existing account.
      # Then status code should be 201 – Create ,  validate response
      Scenario: Add Phone number to existing account
      Given path "api/accounts/add-account-phone"
      And param primaryPersonId = "34"
      And request {"phoneNumber": "4694694694","phoneExtension": "123","phoneTime": "Morning","phoneType": "Home"}
      And header Authorization = "Bearer " + generatedToken
      When method post
      Then status 201
      Then print response
      # 5)Test API endpoint "/api/accounts/add-account-address" to add address to existing account.
      # Then status code should be 201 – Create ,  validate response
      Scenario: Add address to existing account
      Given path "api/accounts/add-account-address"
      And param primaryPersonId = "34"
      And request {"addressType": "Apartment","addressLine1": "325 s jupiter ","city": "Allen","state": "Texas","postalCode": "75002","countryCode": "0001","current": true}
      And header Authorization = "bearer " + generatedToken
      When method post
      Then status 201 
      Then print response  
      
      
      
      
      
      
      
      
