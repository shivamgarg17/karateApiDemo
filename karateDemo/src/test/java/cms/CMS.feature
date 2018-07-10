

Feature: To get the details for different Natcos
  
Background:
 * def getValue = Java.type('com.mito.controller.TokenController')
 Then  def session = getValue.generateRandomToken()
 
  @tag1
  Scenario: To get the Details of Hungary(hu)
  * configure headers = read('classpath:header.js')
  Given url 'https://cms.dtoneapp.telekom.net/cdn/configs/'
  Then print session
  * def CMS_API_Key = 'A0DWUQQT5xQ1dUPUaprCmAKbvNEkeD2I'
  Then path CMS_API_Key, 'oa_config_hu_0.25.0.json'
  And params {rand: '<session>'}
  And method GET
  Then def ref = karate.prevRequest
  * def refHeaders = ref.headers
