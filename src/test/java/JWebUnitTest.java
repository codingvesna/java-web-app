import org.junit.Before;
import org.junit.Test;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class JWebUnitTest {
    @Before
    public void prepare() {
//         setBaseUrl("http://localhost:8081/java-web-app");
        setBaseUrl("http://java-web-app.eu-west-1.elasticbeanstalk.com/");
    }
    @Test
    public void testLoginPage() {
        beginAt("index.jsp");
        assertTitleEquals("Home");
        assertLinkPresent("home");
        clickLink("home");
    }

    @Test
    public void testHomePage() {
        beginAt("home.jsp");
        assertTitleEquals("Login");
        assertLinkPresent("login");
        clickLink("login");
    }
}
