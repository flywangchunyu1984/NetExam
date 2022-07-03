package com.exam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

//@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@SpringBootApplication
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class ExamsystemApplication {

    public static void main(String[] args) {
    	SpringApplication.run(ExamsystemApplication.class, args);

    	//SpringApplication application = new SpringApplication(ExamsystemApplication.class);
    	//application.addInitializers(new DemoApplicationContextInitializer(args));
    	//application.addListeners(new DemoSpringApplicationRunListener(application,args));
    	//application.run(args);


    	
    	
    }

}

