package com.exam;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringApplicationRunListener;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

//@Component
public class DemoSpringApplicationRunListener implements SpringApplicationRunListener {
	
	String[] args;
	
	@Value("${spring.datasource.url}")
	private String url;
	
	@Autowired
	private Environment env;
	
	@Autowired
	DataSourceProperties dataSourceProperties;

	@Autowired
	ApplicationContext applicationContext;
	
	public  DemoSpringApplicationRunListener() {
		System.out.println("DemoSpringApplicationRunListener2000000000000000002");
		System.out.println("url="+url);
		//DataSource dataSource = applicationContext.getBean(DataSource.class);
		//System.out.println(dataSourceProperties.getUrl());
	}
	
	public  DemoSpringApplicationRunListener(SpringApplication application, String[]  args) {
	    	this.args =args;  	
	    	System.out.println("HelloWorldRunListener.starting()...11111111111110007");
	}
	@Override
	public void starting() {
		System.out.println("HelloWorldRunListener.starting()...11111111111110008");
	}
	@Override
	public void environmentPrepared(ConfigurableEnvironment environment) {
		System.out.println("HelloWorldRunListener.starting()...11111111111110001");
		
	}
	@Override
	public void contextPrepared(ConfigurableApplicationContext context) {
		System.out.println("HelloWorldRunListener.starting()...11111111111110002");
		
	}
	
	@Override
	public void started(ConfigurableApplicationContext context) {
		DataSource dataSource = context.getBean(DataSource.class);
		System.out.println("DemoSpringApplicationRunListener222222222222220009");
		
		
	}
	@Override
    public void contextLoaded(ConfigurableApplicationContext context) {
		System.out.println("HelloWorldRunListener.starting()...11111111111110003");
	}
	@Override
	public void running(ConfigurableApplicationContext context) {
		System.out.println("HelloWorldRunListener.starting()...11111111111110004");
		
	}
	@Override
	public	void failed(ConfigurableApplicationContext context, Throwable exception) {
		System.out.println("HelloWorldRunListener.starting()...11111111111110005");
	}
	
	/**@Override
	public void onApplicationEvent(ApplicationEvent event) {
		// TODO Auto-generated method stub
		DataSource dataSource = applicationContext.getBean(DataSource.class);
		System.out.println("DemoSpringApplicationRunListener3333333333333333");
		
	}*/
	
}
