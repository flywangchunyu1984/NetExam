package com.exam;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

//@Component
public class DemoCommandLineRunner implements CommandLineRunner {
		
	@Autowired
	DataSourceProperties dataSourceProperties;

	@Autowired
	ApplicationContext applicationContext;
	
	@Override
    public	void run(String... args) {
		DataSource dataSource = applicationContext.getBean(DataSource.class);
		System.out.println("HelloWorldRunListener.starting()...1111111111111");	
		System.out.println(dataSource);
		System.out.println("args[0]=" + args[0]);
		String dbip = args[0];
		String dburl ="jdbc:mysql://" + dbip + ":3306/exam?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC";
	    dataSourceProperties.setUrl(dburl);
	    System.out.println(dataSourceProperties.getUrl());
	}
}
