package runners;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.intuit.karate.junit4.Karate;

//import test.ServerStart;

@RunWith(Karate.class)
public abstract class TestBase {
//private static ServerStart server;
    
   /* public static int startServer() throws Exception {
		return 0;
        if (server == null) { // keep spring boot side alive for all tests including package 'mock'
            server = new ServerStart();
            server.start(new String[]{"--server.port=0"}, false);
        }
        System.setProperty("demo.server.port", server.getPort() + "");
        System.setProperty("karate.env", "dev");
        return server.getPort();       
    }*/
    
    @BeforeClass
    public static void beforeClass() throws Exception {
    	
       
    }
}
