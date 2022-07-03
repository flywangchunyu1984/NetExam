package com.exam;

import com.baomidou.mybatisplus.autoconfigure.ConfigurationCustomizer;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@Configuration
//@MapperScan("com.exam.service.*.mapper*")
public class MybatisPlusConfig {
	/**
     * 分页插件
     * @return
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
    /**@Bean public ConfigurationCustomizer configurationCustomizer() { 
    	return new ConfigurationCustomizer() { 
    		@Override 
    		public void customize(org.apache.ibatis.session.Configuration configuration) { 
    			configuration.
    			configuration.setCacheEnabled(true); 
    			configuration.setMapUnderscoreToCamelCase(true); 
    			configuration.setCallSettersOnNulls(true); 
    			configuration.setJdbcTypeForNull(JdbcType.NULL); 
    			} 
    		}; 
    }*/

}
