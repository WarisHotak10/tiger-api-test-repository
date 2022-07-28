Feature: create account with data generator

  # we are going to re-use a generate token feature
  Background: Prepare for test. generate token
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    And print generatedToken

  Scenario: Create new account using data generator
    * def generator = Java.type('tiger.api.test.data.DataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dob = generator.getDob()
    Given path "/api/accounts/add-primary-account"
    And request
      """
      {
          "id": 34,
          "email": "#(email)",
          "title": "Mr",
          "firstName": "#(firstName)",
          "lastName": "#(lastName)",
          "gender": "MALE",
          "maritalStatus": "SINGLE",
          "employmentStatus": "employee",
          "dateOfBirth": "#(dob)"
          }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    * def generatedId = response.id
    And print generatedId
    And print response
    Then assert response.email == email
