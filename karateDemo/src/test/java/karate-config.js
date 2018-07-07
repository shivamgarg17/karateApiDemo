function() {
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);  
  var port = 8888
	  /*karate.properties['demo.server.port'];  
  if (!port) {
    port = karate.env == 'dev' ? 8888 : 8080;
  }*/
  var protocol = 'http';
  /*if (karate.properties['demo.server.https'] == 'true') {
    protocol = 'https';
    karate.configure('ssl', true);
  }  */
  var config = { BaseUrl: protocol + '://18.184.255.205:' + port+ '/api'	 
  };
  
  return config;
}
