Feature: Header configuration, Get all the headers before any request

  Background: 
    * def tokens = callonce read('../cms/CMS.feature')
    
  @Login
  Scenario: Check head performing
    * configure headers = tokens.refHeaders
    And url 'http://dev.mito.hu/oneapp/login/'
    Given request {'type' : 'IMSI','IMSI' : '35646316464313565746'}
    When method POST
    Then print response

  @Login
  Scenario: Change Header value
    Then print reqheaders
    Given url 'http://dev.mito.hu/oneapp/pin/'
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
