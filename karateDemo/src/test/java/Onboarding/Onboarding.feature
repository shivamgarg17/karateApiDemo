@Onboarding
Feature: Onboarding API

  Background: 
    *def url callonce BaseUrl
    Given def data = callonce  {serviceId:'3859811111111'}
    Given def filecompare = read('JSONSchema.json')
 
    
    @Login
    Scenario: Login using SMS
    
    Given url BaseUrl
    And path '/login'
    Given request read('LoginWithSMS.json')
    When  method POST
    Then status 200
    
    @LoginSchema
    Scenario: Login with IMSI
    Given url BaseUrl
    And path '/login'
    Given request {'type' : 'IMSI','IMSI' : '35646316464313565746'}
    When method POST
    Then status 202
    And match response == filecompare
    #And match data.serviceId contains response.serviceId
    
    @Login
    Scenario: Login with Username and Password
    
    Given url BaseUrl
    And path '/login'
    Given request read('LoginWithTelekomId.json')
    When  method POST
    Then status 200
    
    @Login
    Scenario: Login in App using Invalid Method
    
    Given url BaseUrl
    And path '/login'
    Given request {'type' : '','IMSI' : '35646316464313565746'}
    When method POST
    Then status 400
    And match response.code contains 'BAD_REQUEST'
    
    
    @Login
    Scenario: Generate Login PIN and update the same using new Key
    
    Given url BaseUrl
    Given path '/pin'
    And request {'context' : 'login','serviceType': 'phoneNumber','serviceId' : '385981111111'}
    When method POST
    Then status 200
    And def nonce = response.nonce
    Given path '/pin'
    And def payload = {'context' : 'service','serviceType': 'phoneNumber','serviceId': '3859811111111111','PIN': '1234'}
    And set payload $.nonce = nonce 
    And request payload
    When method PUT
    Then status 200
    And match response contains {serviceId:'4567838239123017'}