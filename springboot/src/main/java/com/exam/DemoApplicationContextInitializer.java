package com.exam;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;


public class DemoApplicationContextInitializer implements ApplicationContextInitializer {
	
	//DataSourceProperties dataSourceProperties;

	//@Autowired
	//ApplicationContext applicationContext;
	
	String[] args;
	@Resource
	private org.springframework.core.env.Environment environment;
	
	@Autowired
	DataSourceProperties dataSourceProperties;
	
    @Override
    public void initialize(ConfigurableApplicationContext applicationContext) {
        // do whatever you want with applicationContext,
    	//applicationContext.refresh();
    	//System.out.println(applicationContext.setEnvironment(null));
        //DataSource dataSource = applicationContext.getBean(DataSource.class);
        // 查看配置数据源信息
    	String dbip = args[0];
    	String dburl ="jdbc:mysql://" + dbip + ":3306/exam?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC";
	    dataSourceProperties.setUrl(dburl);
    	System.out.println(dataSourceProperties.getUrl());
        System.out.println("ApplicationContextInitializer");
        System.out.println(args[0]);
        //System.out.println(dataSource);
        //applicationContext.registerShutdownHook();
        
    }
    
    public  DemoApplicationContextInitializer(String[] args) {
    	this.args =args;  	
    }
}