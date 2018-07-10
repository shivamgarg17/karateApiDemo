

Feature: To get the details for different Natcos
  
Background:
 * def getValue = Java.type('com.mito.controller.TokenController')
 Then  def session = getValue.generateRandomToken()
 Then def expectedSchema = read('CMSSchema.json')
 
  @tag1
  Scenario: To get the Details of Hungary(hu)
  * configure headers = read('classpath:header.js')
  Given url 'https://cms.dtoneapp.telekom.net/cdn/configs/'
  * def CMS_API_Key = 'A0DWUQQT5xQ1dUPUaprCmAKbvNEkeD2I'
  Then path CMS_API_Key, 'oa_config_hu_0.25.0.json'
  And params {rand: '<session>'}
  And method GET
  # validate the response data with expected data
  And match response contains read('CMSDataValidation.json')  
  Then assert response.modules.payment.acceptedCardTypes.visa == true
  # validate the response schema
  Then match response == expectedSchema
  
  Then def ref = karate.prevRequest
  * def refHeaders = ref.headers
