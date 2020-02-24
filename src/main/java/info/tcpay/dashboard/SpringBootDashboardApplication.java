package info.tcpay.dashboard;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.undertow.UndertowServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EnableAdminServer
public class SpringBootDashboardApplication {

  public static void main(String[] args) {
    SpringApplication.run(SpringBootDashboardApplication.class, args);
  }

  @Bean
  public ServletWebServerFactory servletContainer() {
    return new UndertowServletWebServerFactory();
  }
}
