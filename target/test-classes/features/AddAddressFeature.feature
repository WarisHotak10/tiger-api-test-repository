Feature: Create an account and add address to the account

  Background: Create new account
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createAddressResult = callonce read('CreateAccountFeature.feature')
    And print createAddressResult
    * def primaryPersonId = createAddressResult.response.id
    * def token = createAddressResult.result.response.token

  Scenario: add address to an account
    Given path  '/api/accounts/add-account-address'
    Given param primaryPersonId = primaryPersonId
    Given header Authorization = "Bearer " + token
    Given request
      """
      {
        
        "addressType": "Home",
        "addressLine1": "325 jupiter",
        "city": "Allen",
        "state": "Texas",
        "postalCode": "75000",
        "countryCode": "123",
        "current": true
      }
      """
    When method post
    Then status 201
    And print response
